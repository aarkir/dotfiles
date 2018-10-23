" Added for latex-vim

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

let g:Tex_DefaultTargetFormat = 'pdf'

" OLDER
set nocompatible

" copy unnamedplus to system
autocmd VimLeave * call system("xsel -ib", getreg('+'))
" make sure vim version is gtk or gnome, NOT TINY
set clipboard=unnamedplus

set hidden " hides buffers instead of closing them
set wildmenu
set hlsearch " highlighting in searches
set confirm " throw dialogue asking to save instead of failing a save command
set visualbell " use visual bell instead of beeping upon error
set mouse=a " use mouse in all modes
set cmdheight=2 " apparently used for press enter to continue?

" syntax
syntax enable
syntax on " obvious

" case
set ignorecase " case insensitive search
set smartcase " case sensitive if caps used

" tabs
filetype indent plugin on " tries to learn language and indent accordingly
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" display
set ruler " display cursor position in bottom line of screen
set laststatus=2 " always display status line, white bar
set number " obvious

" make
" let &varname sets varname to option. internally, &var is the name of the
" option
set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ g++\ -Wall\ -Wextra\ -std=c++14\ -o\ %<\ %  
autocmd FileType tex setlocal makeprg=latex\ %;xdg-open\ %<.pdf\ &

" splits
set splitbelow
set splitright

" autosave on buffer switch
set autowriteall

" executes local .vimrc file. run this upon start of project instead for
" security reasons
" set exrc
