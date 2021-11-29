"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:CloseBufferNotWindow()
    let l:id = bufnr('%')
    bnext
    execute id.'bdelete'
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set nocompatible                    " Disable Vi backwards compatibility
set background=dark                 " Setting dark mode
set t_Co=256                        " Add true color support
set hidden                          " Allows switching buffers without having to write/save
set undofile                        " Undo even after closing buffer
set undodir=~/.vim/tmp/undodir      " Persistent undo storage
set termguicolors                   " Add true color support
set number                          " Add line numbers
set relativenumber                  " Make line numbers relative
set history=500                     " Sets how many lines of history VIM has to remember
set autoread                        " Set to auto read when a file is changed from the outside
set so=7                            " Set 7 lines to the cursor - when moving vertically using j/k
set langmenu=en                     " set menu language
set ruler                           " Always show current position
set cmdheight=1                     " Height of the command bar
set hid                             " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent      " Configure backspace so it acts as it should act
set whichwrap+=<,>                  " Go to next/previous line when using left or right arrow
set ignorecase                      " Ignore case when searching
set smartcase                       " When searching try to be smart about cases
set hlsearch                        " Highlight search results
set incsearch                       " Makes search act like search in modern browsers
set lazyredraw                      " Don't redraw while executing macros (good performance config)
set magic                           " For regular expressions turn magic on
set showmatch                       " Show matching brackets when text indicator is over them
set mat=2                           " How many tenths of a second to blink when matching brackets
set noerrorbells                    " No annoying sound on errors
set novisualbell                    " No annoying sound on errors
set vb t_vb=                        " No annoying sound on errors
set tm=500                          " No annoying sound on errors
set belloff=all                     " No annoying sound on errors
set foldcolumn=2                    " Add a bit extra margin to the left
set nobackup                        " Turn backup off, since most stuff is in SVN, git etc. anyway...
set nowb                            " Turn backup off, since most stuff is in SVN, git etc. anyway...
set noswapfile                      " Turn backup off, since most stuff is in SVN, git etc. anyway...
set expandtab                       " Use spaces instead of tabs
set smarttab                        " Be smart when using tabs
set shiftwidth=4                    " 1 tab == 4 spaces
set tabstop=4                       " Number of spaces for a tab
set linebreak                       " Linebreak on 500 characters
set textwidth=500                   " Linebreak on 500 characters
set ai                              " Auto indent
set si                              " Smart indent
set wrap                            " Wrap lines
set encoding=utf8                   " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac                " Use Unix as the standard file type
set laststatus=2                    " Always show the status line
set switchbuf=useopen,usetab,newtab " Specify the behavior when switching between buffers
set showtabline=2                   " Show tab line menu
set wildmenu                        " Command mode autocomplete
set cursorline                      " Highlight current line
" set complete+=kspell                " Add word suggestion to autocomplete

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Stores



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pluggins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" Use single quotes around github path url
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'                                  " Adds gruvbox colorscheme
Plug 'vim-airline/vim-airline'                          " Improves status bar 
Plug 'vim-airline/vim-airline-themes'                   " Status bar themes
Plug 'preservim/nerdtree'                               " Browse file system in separate tab
Plug 'ryanoasis/vim-devicons'                           " Adds icons to nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'                      " Adds git status indicators to nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'          " Adds nerdtree node highlighting
Plug 'mhinz/vim-startify'                               " Adds a start screen to vim on no args opening
Plug 'airblade/vim-gitgutter'                           " Adds gitlens type feature to vim
Plug 'sheerun/vim-polyglot'                             " Adds polyglot multi language support
Plug 'vim-scripts/YankRing.vim'                         " Allows copy and cut stashing
Plug 'tpope/vim-surround'                               " Adds tags manipulations
Plug 'tpope/vim-commentary'                             " Adds multi language comment support
Plug 'junegunn/fzf'                                     " Adds fuzzy finder search assistant
Plug 'junegunn/fzf.vim'                                 " Fuzzy finder vim wrapper

" Initialize plugin system
call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Initialisers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                                           " Enable syntax highlighting
setlocal spell spelllang=en                             " Adds spell check support
filetype plugin on                                      " Enable filetype plugins
filetype indent on                                      " Enable filetype indent

source $VIMRUNTIME/delmenu.vim                          " Drop all GUI menus setting
source $VIMRUNTIME/menu.vim                             " Resets GUI menus to default state

let $LANG='en'                                          " Avoid garbled characters in Chinese language windows OS
let mapleader=' '                                       " Like <leader>w sa<leader>ves the current file
let g:airline#extensions#tabline#enabled=1              " Show buffers in a status bar at top
let g:airline#extensions#tabline#buffer_idx_mode=1      " Show buffer number in buffer status bar
let g:airline_powerline_fonts=1                         " User powerline font with status bar for arrows
let g:airline_theme='gruvbox'                           " Use gruvbox theme for airline
let g:NERDTreeGitStatusShowIgnored=1                    " Mark git ignored files in nerd tree
let g:indent_guides_enable_on_vim_startup=0

colorscheme gruvbox


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command -nargs=* SudoSave execute 'w !sudo tee % > /dev/null'
command -nargs=* SourceConfig execute 'w | source .vimrc | noh'

imap fj <esc> 
map fj <esc> 


nmap <leader>sw :wincmd w<CR>                                                " Switch between windows
nmap <leader>sb :bnext<CR>                                                   " Switch between buffers
nmap <leader>tt :NERDTreeToggle<CR>                                          " Toggle nerdtree visibility
nmap <leader>tn :set relativenumber!<CR>                                     " Toggle line nuber between absolute and relative
nmap <leader>tc :let &background=(&background=="dark"?"light":"dark")<CR>    " Toggle theme between dark and light  
nmap <leader>ch :noh<CR>                                                     " Cancel selection highlight
nmap <leader>cb :call <SID>CloseBufferNotWindow()<CR>                        " Close current buffer and jump to next

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Automation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Update buffer when changes are made from outside vim
au FocusGained,BufEnter * checktime

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" Use startify landing page when no files is provided as arg on vim startup
au VimEnter * if !argc() | Startify | NERDTree | wincmd w | endif

" Start NERDTree and put the cursor back in the other window
au VimEnter * if argc() | NERDTreeFind | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
au BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

