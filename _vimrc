set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'lokaltog/vim-easymotion'
Plugin 'ervandew/supertab'
Plugin 'matchit.zip'
Plugin 'mhinz/vim-signify'
" ==== colorschemes ==== "
Plugin 'vim-scripts/chance-of-storm'
Plugin 'sjl/badwolf'
Plugin 'chriskempson/base16-vim'
Plugin 'MaxSt/FlatColor'
Plugin 'fatih/molokai'

" ==== syntax highlight ==== "
Plugin 'xsbeats/vim-blade'

" ==== languages specific ===="
Plugin 'fatih/vim-go'
Plugin 'vim-jp/vim-go-extra'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'davidhalter/jedi-vim'

" ==== Autocomplete ===="
Plugin 'Valloric/YouCompleteMe'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'

"Plugin 'vim-scripts/HTML-AutoCloseTag'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ====== key bindings and configuration ====== "
set backspace=indent,eol,start
set fileformat=unix

" ========= Interface Configuration ========= "
set t_Co=256
set background=dark
set ruler

" scroll speed
set scroll=8

" set line number and syntax
set nu
syntax on

" show line number and command being entered
set showcmd number

" set fonts
set encoding=utf-8
set guifont=Source\ Code\ Pro\ for\ Powerline\ 10,DejaVu\ Sans\ Mono\ for\ Powerline\ 10,DejaVu\ Sans\ Mono\ 10

" airline configurations
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
set laststatus=2

" colorscheme
colorscheme molokai

" ==== Indentations ==== "

" set tab stops
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
set autoindent

au FileType html setl sw=2 sts=2 et
au FileType php setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType ruby setl sw=2 sts=2 et
"
" ==== Go Specific ==== "
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)
" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)
" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)
