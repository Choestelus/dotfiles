set nocompatible              " be iMproved, required

if has('vim_starting')
    set runtimepath+=~/.config/nvim/
endif

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'lokaltog/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux-focus-events'

" ==== colorschemes ==== "
Plug 'sjl/badwolf'
Plug 'fatih/molokai'
Plug 'rakr/vim-one'

" ==== syntax highlight ==== "
Plug 'cespare/vim-toml'
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-highlight'
Plug 'vim-scripts/paredit.vim'

" ==== languages specific ===="
Plug 'rust-lang/rust.vim'
Plug 'elzr/vim-json'
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-salve'

" ==== Autocomplete ===="
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tlib_vim'
Plug 'SirVer/ultisnips'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/denite.nvim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'racer-rust/vim-racer'
" ==== Plugin order matters ==== "
Plug 'vim-syntastic/syntastic'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'sebastianmarkow/deoplete-rust'
call plug#end()

filetype plugin indent on
" ====== key bindings and configuration ====== "
set backspace=indent,eol,start
set fileformat=unix

set autoread
" set pyxversion=3
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" let g:deoplete#disable_auto_complete = 1
let g:deoplete#sources#rust#racer_binary='$HOME/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='$RUST_SRC_PATH'
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1
" let g:deoplete#ignore_sources = {}
" let g:deoplete#ignore_sources._ = ['buffer', 'around']
" ========= Interface Configuration ========= "
" set t_Co=256
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect
if (has("termguicolors"))
  set termguicolors
endif

set hidden
let g:racer_cmd = "/home/chochoe/.cargo/bin/racer"
let g:racer_experimental_completer = 1

set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum

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
let g:airline_theme='one'
let g:airline_powerline_fonts = 1
set laststatus=2

" ===== Syntax Configuration ===== "
let g:vim_json_syntax_conceal = 0
let g:indentLine_noConcealCursor=""
" let g:indentLine_color_gui = 239
" let g:indentLine_color_term = 239

let g:SuperTabDefaultCompletionType = "<c-n>"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set completeopt=longest,menuone
" let g:SuperTabDefaultCompletionType = '<C-x><C-o>'
" let g:SuperTabClosePreviewOnPopupClose = 1
" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <Tab>  pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" inoremap <expr> <c-@>  pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

" inoremap <expr> <S-Tab>  pumvisible() ? "\<C-p>" : "\<s-tab>"
" colorscheme
colorscheme one

" ==== Indentations ==== "
let delimitMate_expand_cr = 1

" set tab stops
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
set autoindent

au FileType html setl sw=2 sts=2 et
au FileType php setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType ruby setl sw=2 sts=2 et
au FileType yaml setl sw=2 sts=2 et
au FileType json setl et

" ==== Go Specific ==== "
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"

let g:go_metalinter_autosave = 0

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)
" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)
" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)


let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"
