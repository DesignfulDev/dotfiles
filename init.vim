" Inspired by Fisa-vim-config, a config for both Vim and NeoVim
" http://vim.fisadev.com
" version: 12.0.0

let using_neovim = has('nvim')
let using_vim = !using_neovim

" ============================================================================
" Vim-Plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0

if using_neovim
    let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
else
    let vim_plug_path = expand('~/.vim/autoload/plug.vim')
endif

if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    if using_neovim
        silent !mkdir -p ~/.config/nvim/autoload
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    else
        silent !mkdir -p ~/.vim/autoload
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif


" Obscure hacks done, you can now modify the rest of the config down below
" as you wish :)
" IMPORTANT: some things in the config are vim or neovim specific. It's easy
" to spot, they are inside `if using_vim` or `if using_neovim` blocks.

" ============================================================================
" Activate plugins

if using_neovim
    call plug#begin("~/.config/nvim/plugged")
else
    call plug#begin("~/.vim/plugged")
endif

  "To Check: SuperTab, CoC, Markdown syntax (plasticboy/vim-markdown)
  Plug 'tpope/vim-surround' "Quickly edit surrounding parens, quotes, tags, etc; example: 'cs([', to swap ()'s with []'s
  Plug 'tpope/vim-fugitive' "Git wrapper to run git commands inside Vim
  Plug 'airblade/vim-gitgutter' "Shows git diffs in file on left gutter
  Plug 'scrooloose/nerdtree' "File system explorer <M-1>
  "Plug 'scrooloose/syntastic' "Simple linter to show warnings and erros
  Plug 'scrooloose/nerdcommenter' "Allows comment toggling <leader>c<leader>
  Plug 'mattn/emmet-vim' "Enable Emmet for Vim (M-,,)
  Plug 'sheerun/vim-polyglot' "Syntax highlighting for multiple languages
  Plug 'flazz/vim-colorschemes' "Color scheme theme bundle
  Plug 'vim-airline/vim-airline' "Status line and tabline
  Plug 'vim-airline/vim-airline-themes' "Customizable themes for vim-airline
  Plug 'bling/vim-bufferline' "List buffers on command bar
  Plug 'terryma/vim-multiple-cursors' "ctrl+n to multicursor edit words
  Plug 'jiangmiao/auto-pairs' "Autocomplete pairs of (), [], {}, '', etc
  Plug 'dense-analysis/ale' "Asynchronous Lint Engine
  Plug 'yuttie/comfortable-motion.vim' "Smooth scrolling: down <C-d> up <C-u> forward <C-f> backwards <C-b>
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "Code and files fuzzy finder
  Plug 'junegunn/fzf.vim' "Code and files fuzzy finder
  "Plug 'mileszs/ack.vim' "Ack code search (requires ack installed in the system)
  Plug 'ryanoasis/vim-devicons' "Icons for NERDTree file explorer and file type status line
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion (CoC) is an intellisense engine for Vim/Neovim.

  call plug#end() "Tell vim-plug we finished declaring plugins, so it can load them

" ============================================================================
" Install plugins the first time Vim runs
  if vim_plug_just_installed
      echo "Installing Bundles, please ignore key map error messages"
      :PlugInstall
  endif

" Update plugins when starting Vim
  if using_neovim
    "if empty(glob('~/.config/nvim/autoload/plug.vim'))
      "silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $NVIMRC | :q
    "endif
  else
    "if empty(glob('~/.vim/autoload/plug.vim'))
      "silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $VIMRC | :q
    "endif
  endif

" End of VimPlug configuration
" ============================================================================


" ============================================================================
" Plugin-independent Configurations

" To use fancy symbols wherever possible, change this setting from 0 to 1
" and use a font from https://github.com/ryanoasis/nerd-fonts in your terminal
" (if you aren't using one of those fonts, you will see funny characters here.
" Turst me, they look nice when using one of those fonts).
let fancy_symbols_enabled = 1

set number "Sets absolute number in current line
set relativenumber "Sets relative number in all other lines
set encoding=utf-8 "Sets character encoding
set hidden "Saves buffers in memory and warns user before :q
set mouse=a "Allows for mouse input
set inccommand=split "Instant feedback on substitute commands
set history=1000 "Reduces command history from NeoVim default of 10k to 1k
set scrolloff=3 "Cursos will always be 3 lines off top and bottom
set linebreak "Smart word break at the end of a line

"Tabs and spaces
set expandtab "On pressing tab, insert 2 spaces
set tabstop=2 "show existing tab with 2 spaces width
set softtabstop=2 "when indenting with '>', use 2 spaces width
set shiftwidth=2

let mapleader="\<space>" "Sets <spacebar> as leader key

"Toggles hybrid number in NORMAL mode and absolute number in INSERT mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"Buffer and Tab navigation mappings

" Reposition window
nnoremap <C-h> <C-w>H
nnoremap <C-j> <C-w>J
nnoremap <C-k> <C-w>K
nnoremap <C-l> <C-w>L

" Go to window
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <C-n> <C-w>w

"Clear search results
nnoremap <silent> // :noh<CR>


" ============================================================================
" Plugin-specific Configurations


" CoC ----------------------------------

let g:coc_node_path='/home/krone/.nvm/versions/node/v12.16.1/bin/node'

" The settings bellow are plugin-independent, but since they're specific to CoC, it makes sense to keep them here
set nobackup " Some servers have issues with backup files (see issue #649 on https://github.com/neoclide/coc.nvim).
set nowritebackup " Same as above
set cmdheight=2 " Give more space for displaying messages.
set updatetime=1500 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c " Don't pass messages to 'ins-completion-menu'.
set signcolumn=yes " Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>m  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" GruvBox Theme ------------------------

let g:gruvbox_italic=1 "Sets gruvbox to accept italics
let g:gruvbox_italicize_comments=1 "Sets comments to italics
let g:gruvbox_italicize_strings=1 "Sets strings to itilics

"Set color scheme for Vim
colorscheme gruvbox "Cool alternatives: gotham256, SlateDark, solarized8_dark_high, solarized8_dark


"NERDTree -----------------------------

"Sets Alt+1 to toggle NERDTree
map <M-1> :NERDTreeToggle<CR>
nmap ,t :NERDTreeFind<CR>

"Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Remove expandable arrow
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"

"Autorefresh on NERDtree focus
function! NERDTreeRefresh()
  if &filetype == "nerdtree"
    silent exe substitute(mapcheck("R"), "<CR>", "", "")
  endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()


" Fzf ------------------------------

" File finder mapping
nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
nmap ,c :Commands<CR>


" Ack.vim ------------------------------

" mappings
nmap ,r :Ack
nmap ,wr :execute ":Ack " . expand('<cword>')<CR>


" Vim Airline --------------------------

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.dirty=' ⚡'

  let g:airline_theme='base16_gruvbox_dark_hard'


" Comfortable Motion -------------------

"Sets motion intensity for smooth scrolling key bindings
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>


" ALE w/ Prettier ----------------------

" Set fixer tools
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\}

" Set linting tools
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}

let g:ale_linters_explicit = 1 "Run only linters and fixers which are explicitly set
let g:ale_fix_on_save = 1 "Have ALE run Prettier on save

" Set formatting options
let g:ale_javascript_prettier_options =
      \'--single-quote --jsx-single-quote --trailing-comma es5 --tab-width 2 --jsx-bracket-same-line'


" Emmet --------------------------------

let g:user_emmet_leader_key='<M-,>'
