" =============================================================================
" 0 Vundle Setup 
" =============================================================================

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Solarised Color Scheme
Plugin 'altercation/vim-colors-solarized'


" Syntastic code competion, replaced by YCM
" Plugin 'scrooloose/syntastic'

" Automatic tabbing
Plugin 'godlygeek/tabular'

" YCM for Fuzzy Code Completion
Plugin 'Valloric/YouCompleteMe'

" Markdown Plugins
Plugin 'plasticboy/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'

" Haskell
Plugin 'bitc/vim-hdevtools'
Plugin 'dag/vim2hs'

" Airline
Plugin 'bling/vim-airline'
Plugin 'edkolev/promptline.vim'
Plugin 'edkolev/tmuxline.vim'

" Git
Plugin 'tpope/vim-fugitive'

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


" =============================================================================
" 1 important
" =============================================================================
" =============================================================================
" 2 moving around, searching and patterns
" =============================================================================
set incsearch "highlight dynamically as they are typed.

" Case insensitive search, except when using *
set ignorecase
set smartcase

" =============================================================================
" 3 tags
" =============================================================================
" =============================================================================
" 4 displaying text
" =============================================================================
set relativenumber
set number
" =============================================================================
" 5 syntax, highlighting and spelling
" =============================================================================

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on

"Colorisation Settings

set t_Co=256
set background=dark
colorscheme solarized

" Spellcheck
set spell
set spelllang=en_gb
set spellfile=~/dotfiles/vimspellfile.utf-8.add

" Line at 80 chars
set colorcolumn=80

" Pretty line wrap
set showbreak=↪

set hlsearch
" =============================================================================
" 6 multiple windows
" =============================================================================

" Multiple buffer support
set hidden

" =============================================================================
" 7 multiple tab pages
" =============================================================================
" =============================================================================
" 8 terminal
" =============================================================================

" Show title in terminals
set title

" But get rid of the "thanks for flying vim" bs
set titleold=""

" =============================================================================
" 9 using the mouse
" =============================================================================

set mouse=a
set ttymouse=xterm2

" =============================================================================
" 10 GUI
" =============================================================================
" =============================================================================
" 11 printing
" =============================================================================
" =============================================================================
" 12 messages and info
" =============================================================================

" Use a confirmation dialogue when saving instead of violently failing
set confirm

" Shortmess, see :help shortmess
" Gets rid of annoying "please hit enter" stuff
set shortmess=filnxtToOs

" =============================================================================
" 13 selecting text
" =============================================================================
" =============================================================================
" 14 editing text
" =============================================================================

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" =============================================================================
" 15 tabs and indenting
" =============================================================================

" Taken from Haskell docs
set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple

set smartindent

" =============================================================================
" 16 diff mode
" =============================================================================
" =============================================================================
" 17 mapping
" =============================================================================
" =============================================================================
" 18 reading and writing files
" =============================================================================

" Because our lord demands it:
" Vim. Live it. ------------------------------------------------------- {{{
inoremap <up> <nop>
noremap <up> <nop>
inoremap <down> <nop>
noremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
noremap <left> <nop>
noremap <right> <nop>
" B-A-<start> }}}

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Sanity Preservation measures
:cmap WQ wq
:cmap Wq wq
:cmap W w
:cmap Q q

" Fuck :X
cnoremap <expr> X (getcmdtype() is# ':' && empty(getcmdline())) ? 'x' : 'X'

" Disable auto-comment
noremap <expr> <enter> getline('.') =~ '^\s*//' ? '<enter><esc>S' : '<ente    r>'

" Fixes auto comment with O keys
nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
noremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'

" Map jk to leave insert mode for comfort 
:inoremap jk <Esc>
" =============================================================================
" 19 the swap file
" =============================================================================

" Auto reload file if modified
set autoread

" Backup and swap directories
set backupdir=/var/tmp,/tmp
set directory=/var/tmp,/tmp

" =============================================================================
" 20 command line editing
" =============================================================================
" =============================================================================
" 21 executing external commands
" =============================================================================

" Longer history
set history=1000

" Enhanced file/command completion
set wildmenu
set wildmode=list:longest

" =============================================================================
" 22 running make and jumping to errors
" =============================================================================
" =============================================================================
" 23 language specific
" =============================================================================
" =============================================================================
" 24 multi-byte characters
" =============================================================================
" =============================================================================
" 25 various
" =============================================================================
" =============================================================================
" 27 Operating System Specific Settings 
" =============================================================================

" ----------------------------------------------------------------------------
" 27.1 OS X
" ----------------------------------------------------------------------------

if (system('uname') =~? "Darwin")
    " OS X clipboard
    set clipboard=unnamed
    
    " Yank text to the OS X clipboard
    noremap <leader>y "*y
    noremap <leader>yy "*Y
    
    " Preserve indentation while pasting text from the OS X clipboard
    noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

    " Enables double-width characters (this is an iTerm Compatability thing)
    " set ambiwidth=double
endif

" =============================================================================
" 28 Plugin Settings 
" =============================================================================

" ----------------------------------------------------------------------------
" 28.1 Airline, Powerline, Tmuxline
" ----------------------------------------------------------------------------

set noshowmode

" Powerline Symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
set guifont=Anonymice\ Powerline:h14

let g:airline_theme = 'solarized'

" don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled = 0

" disable to improve fugitive performance
let g:airline#extensions#branch#enabled = 1

" put a buffer list at the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Make the Statusbar always visible
set laststatus=2

" Promptline
let g:promptline_theme = 'airline'
let g:promptline_preset = {
        \'a' : [ '$(if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then if [[ -n ${ZSH_VERSION-} ]]; then print %m; elif [[ -n ${FISH_VERSION-} ]]; then hostname -s; else printf "%s" \\h; fi; fi )' ],
        \'b' : [ '$USER'],
        \'c' : [ promptline#slices#cwd() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

" Tmuxline
let g:tmuxline_preset = 'full'
let g:tmuxline_theme = 'airline'

" ----------------------------------------------------------------------------
" 28.2 Syntastic and YouCompleteMe
" ----------------------------------------------------------------------------

" Enable C++11 Support for Syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-Wall -std=c++11 -stdlib=libc++'
let g:ycm_global_ycm_extra_conf = '~/dotfiles/ycm/.ycm_extra_conf.py'


" =============================================================================
" 29 Language Specific Fun-ness
" =============================================================================

" Haskell
" fuck code folding
autocmd BufNewFile,BufRead *.hs set nofoldenable

" Enhanced % matching
runtime macros/matchit.vim

