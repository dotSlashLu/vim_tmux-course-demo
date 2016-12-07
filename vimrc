" ===================== vundle ======================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'AutoClose'
Plugin 'kien/ctrlp.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

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

" ===================== vundle ======================

" read config

set encoding=utf8
set ffs=unix,mac,dos " default standard to unix file type

syntax on
set ruler " always show current position
set hlsearch " highlight search results
set number
set smartcase " auto set case insensitive when searching upper case terms

" tab settings, default to 2
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set ai " auto indent

autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR
" backspace
set backspace=indent,eol,start

" default term color is 8
set t_Co=256
" set t_ut=
" colorscheme Monokai
colorscheme 0x7A69_dark

" settings on C
autocmd BufRead,BufNewFile *.c,*.h,*.cc set shiftwidth=8 sts=8 et
autocmd BufRead,BufNewFile *.py,*.sh,*.php set shiftwidth=4 sts=4 et
autocmd BufRead,BufNewFile *.coffee imap log<TAB> console.log<SPACE>
autocmd BufRead,BufNewFile *.js imap log<TAB> console.log(

" autocmd BufRead,BufNewFile   *.c,*.h,*.java set noic cin noexpandtab

" autocmd BufRead,BufNewFile   *.pl syntax on

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" comment
inoremap /// /*<RETURN><RETURN>*/<ESC>ka<SPACE>

" #i -> #include
inoremap #i #include<SPACE>

" #i. -> #include <.h>
inoremap #i. #include<SPACE><.h><ESC>3ha

" #d -> #define
inoremap #d #define<SPACE>

" <ctrl>/ -> //
inoremap <C-/> ^//a<SPACE>

" C-e to jump to the end of line, especially useful when auto-complete is used
inoremap <C-e> <ESC>$a
inoremap <C-n> <ESC>la

" map SPACE to CTRL+D, e.g. page down
nnoremap <SPACE> <C-d>

" inoremap {{ {<RETURN>}<ESC>ko<TAB>
" inoremap (( ()<LEFT>


" Strip trailing white spaces

fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set

    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun

function! UpdateTimestamp ()
    '[,']s/^This file last updated: \zs.*/\= strftime("%c") /
endfunction

" update timestamp
augroup TimeStamping
    autocmd!
    autocmd BufWritePre,FileWritePre,FileAppendPre  *  :call UpdateTimestamp()
augroup END
autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType markdown,ruby,javascript,perl let b:noStripWhitespace=1

" highlight OverLength ctermbg=red ctermfg=white guibg=#FFD9D9
highlight OverLength ctermbg=black ctermfg=white guibg=#000000
match OverLength /\%80v.\+/


" constantly changing

