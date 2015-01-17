"=================================================================
"Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bitc/vim-hdevtools'

"Plugin 'L9'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'git://git.wincent.com/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"=================================================================
"Colorisation Settings

set t_Co=256
set background=dark
colorscheme solarized


"=================================================================
" OS X specific settings

if (system('uname') =~? "Darwin")
    " OS X clipboard
    set clipboard=unnamed
    
    " Yank text to the OS X clipboard
    noremap <leader>y "*y
    noremap <leader>yy "*Y
    
    " Preserve indentation while pasting text from the OS X clipboard
    noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
endif

"=================================================================
" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set laststatus=2


"=================================================================
" Because our lord demands it:
" Vim. Live it. ------------------------------------------------------- {{{
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
" }}}

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Enable line numbers
set relativenumber
set number

" Tab settings. Taken from Haskell docs, but it prefer them
set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple

" Disable auto-comment
noremap <expr> <enter> getline('.') =~ '^\s*//' ? '<enter><esc>S' : '<ente    r>'

" Fixes auto comment with O keys
nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
noremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
 
" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on
 
" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

" Multiple buffer support
set hidden

" Longer history
set history=1000

" Enhanced % matching
runtime macros/matchit.vim

" Enhanced file/command completion
set wildmenu
set wildmode=list:longest

" Case insensitive search, except when using *
set ignorecase
set smartcase

" Show title in terminals
set title

" But get rid of the "thanks for flying vim" bs
set titleold=""

" Shortmess, see :help shortmess
" Gets rid of annoying "please hit enter" stuff
set shortmess=filnxtToOs

" Map backtick to escape for comfort
imap ` <Esc>

" Pretty line wrap
set showbreak=↪

" Fuck :X
cnoremap <expr> X (getcmdtype() is# ':' && empty(getcmdline())) ? 'x' : 'X'

" Sanity Preservation measures
:cmap WQ wq
:cmap Wq wq
:cmap W w
:cmap Q q

" Auto reload file if modified
set autoread

" Backup and swap directories
set backupdir=/var/tmp,/tmp
set directory=/var/tmp,/tmp

" Enable C++11 Support for Syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-Wall -std=c++11 -stdlib=libc++'
let g:ycm_global_ycm_extra_conf = '~/dotfiles/ycm/.ycm_extra_conf.py'
