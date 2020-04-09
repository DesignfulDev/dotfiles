
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


################################################################
############ SETS POWERLEVEL9K THEME ###########################
################################################################

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"

# Sets left prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="" # Cool alternative "╭"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="  "
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B0"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_icon dir_writable vi_mode dir vcs) # removed context segment
POWERLEVEL9K_CONTEXT_TEMPLATE=%n # only useful when context segment is active
POWERLEVEL9K_SHORTEN_DIR_LENGTH=true
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_first_and_last
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

# Sets right prompt
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\u23FD"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs ram battery)
POWERLEVEL9K_STATUS_OK_FOREGROUND="010"

# Sets custom icon
# POWERLEVEL9K_CUSTOM_ICON="echo ⏻" # Cool alternatives ⏻    烈ﬦ      
POWERLEVEL9K_CUSTOM_ICON="echo ﬦ" # Cool alternatives ⏻    烈ﬦ      
POWERLEVEL9K_CUSTOM_ICON_BACKGROUND=000
POWERLEVEL9K_CUSTOM_ICON_FOREGROUND=003

# Sets DIR segment
POWERLEVEL9K_DIR_HOME_FOREGROUND="007"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="007"
POWERLEVEL9K_DIR_HOME_BACKGROUND="004"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="004"
POWERLEVEL9K_DIR_ETC_FOREGROUND="000"
POWERLEVEL9K_DIR_ETC_BACKGROUND="007"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="000"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="006"

# Sets lock symbol on folders where the user has no access
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="003"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="001"

# Sets Vi Mode indicator
POWERLEVEL9K_VI_INSERT_MODE_STRING="I"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="N"
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="023"
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="231"
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="022"
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="148"

# Sets status for last executed command
POWERLEVEL9K_STATUS_CROSS=true
POWERLEVEL9K_STATUS_OK_FOREGROUND="010"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="003"
POWERLEVEL9K_STATUS_OK_BACKGROUND="000"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="001"

# Sets battery segment
POWERLEVEL9K_BATTERY_STAGES=($'\uF582' $'\uF579' $'\uF57A' $'\uF57B' $'\uF57C' $'\uF57D' $'\uF57F' $'\uF580' $'\uF581' $'\uF578')
POWERLEVEL9K_BATTERY_LOW_THRESHOLD=30

################################################################

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

export EDITOR="nvim" # Sets NeoVim as editor of choice
export NVIMRC="$HOME/.config/nvim/init.vim" # Sets NeoVim config path
export VIMRC="$HOME/.vimrc" # Sets Vim config path

# Set aliases
alias vi="nvim"
alias v="nvim"
alias zshconfig="nvim $HOME/.zshrc"
alias sz="source $HOME/.zshrc"
alias upgrade="sudo dnf upgrade --refresh -y"

# Set exa aliases (exa: a modern replacement for ls https://the.exa.website/)
alias ls="exa --group-directories-first --classify"
alias la="exa -a --group-directories-first --classify"
alias ll="exa -ghl --group-directories-first --classify --git"
alias l="exa -ghal --group-directories-first --classify --git"

# Node Version Manager (nvm) installation
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use Vim modes in ZSH
bindkey -v

# Syncs config files to backup folder
rsync $HOME/.config/nvim/init.vim $HOME/.config/config-files-bkp/
rsync $HOME/.hyper.js $HOME/.config/config-files-bkp/
rsync $HOME/.zshrc $HOME/.config/config-files-bkp/

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
