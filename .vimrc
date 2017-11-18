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
