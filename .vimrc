set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'https://github.com/Chiel92/vim-autoformat'
Plugin 'https://github.com/ajh17/VimCompletesMe'

Plugin 'vim-latex/vim-latex'

Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
"
Plugin 'altercation/vim-colors-solarized'
" convenient sessions
Plugin 'tpope/vim-obsession'
Plugin 'fxn/vim-monochrome'

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
let g:tex_flavor='latex'
let g:Tex_CompileRule_pdf = 'xelatex $*'
" let g:Tex_CompileRule_pdf = 'xelatex --interaction=nonstopmode --shell-escape $*'

" splits
set splitbelow
set splitright

" autosave on buffer switch
set autowriteall

" executes local .vimrc file. run this upon start of project instead for
" security reasons
" set exrc

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" https://stackoverflow.com/questions/1416572/vi-vim-restore-opened-files
map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3

" for vim-latex / latex suite
let g:Tex_Env_frame = "\\begin{frame}{<++>}\<CR><++>\<CR>\\end{frame}\<CR><++>"
let g:Tex_Env_defn = "\\begin{definition}[<++>]\<CR><++>\<CR>\\end{definition}\<++>"
let g:Tex_Env_rmk = "\\begin{remark}[<++>]\<CR><++>\<CR>\\end{remark}\<++>"
let g:Tex_Env_thm = "\\begin{theorem}[<++>]\<CR><++>\<CR>\\end{theorem}\<++>"
" the following lines allow alt commands
" http://vim-latex.sourceforge.net/documentation/latex-suite/altkey-mappings.html
" https://tex.stackexchange.com/questions/130389/vim-latex-suite-alt-macro-not-working/249078
let g:Tex_AdvancedMath = 1
set winaltkeys=no
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeoutlen=1000
set ttimeoutlen=5

" noremap <C-j> <Esc>/<++><CR><Esc>cf>
noremap <M-b> <Esc>i\mathbb{<Esc>la}
noremap <M-c> <Esc>i\mathcal{<Esc>la}
noremap <M-o> <Esc>i\overline{<Esc>la}

" sagemath
augroup filetypedetect
  au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
augroup END
""""""
" Sage settings (from Franco Saliola)
autocmd BufRead,BufNewFile *.sage,*.pyx,*.spyx set filetype=python
autocmd Filetype python set tabstop=4|set shiftwidth=4|set expandtab
"autocmd FileType python set makeprg=sage\ -b\ &&\ sage\ -t\ %
autocmd FileType python set makeprg=sage\ %

colorscheme monochrome

xnoremap <M-g> "zy:!firefox "https://www.zdic.net/hant/<c-r>=substitute(@z,' ','%20','g')<cr>"<return>gv
