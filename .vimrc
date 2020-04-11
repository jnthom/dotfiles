set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'

Plugin 'Lokaltog/vim-powerline'

Plugin 'manabuishii/vim-cwl'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" End Vundle

" YCM options
let g:ycm_autoclose_preview_window_after_completion=1
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

syntax on
set number
set ruler
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set background=dark
set incsearch ignorecase smartcase
set hidden
set backspace=indent,eol,start
set scrolloff=5
set t_Co=256
set nrformats=bin,hex
set encoding=utf-8

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

highlight TabLineFill ctermfg=black

let $BASH_ENV = "~/.bash_aliases"

" Cursor line highlighting
set cursorline
" Default
highlight CursorLine cterm=none ctermbg=235
" Switch to underline in insert mode
autocmd InsertEnter * highlight CursorLine ctermbg=darkblue
" Switch back to default when leaving insert mode
autocmd InsertLeave * highlight CursorLine ctermbg=235

" Right hand column (darker gray)
highlight ColorColumn ctermbg=235
set colorcolumn=+1
autocmd BufRead,BufNewFile *.js set textwidth=80
autocmd BufRead,BufNewFile *.cc set textwidth=80
autocmd BufRead,BufNewFile *.h set textwidth=80
autocmd BufRead,BufNewFile BUILD set textwidth=100
autocmd BufRead,BufNewFile *.md set textwidth=80
autocmd BufRead,BufNewFile *.soy set textwidth=100
autocmd BufRead,BufNewFile *.java set textwidth=100

autocmd BufRead,BufNewFile .bash_aliases set syntax=sh
autocmd BufRead,BufNewFile *.md set filetype=markdown

autocmd BufRead,BufNewFile *.py
    \ setlocal textwidth=80 |
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal foldmethod=indent |
    \ setlocal foldlevel=99 |

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Allow sane cursor movement in wrapped lines
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj

" Map `` to ctrl-6 to avoid conflicting with mosh
noremap `` <C-^>

"Open NERDTree if vim was opened with no files.
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()
