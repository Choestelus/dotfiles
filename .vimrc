set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
" Plug 'L9'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'lokaltog/vim-easymotion'
Plug 'ervandew/supertab'
" Plug 'matchit.zip'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux-focus-events'
" ==== colorschemes ==== "
Plug 'sjl/badwolf'
Plug 'fatih/molokai'
Plug 'rakr/vim-one'

" ==== syntax highlight ==== "
Plug 'xsbeats/vim-blade'
Plug 'cespare/vim-toml'
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-highlight'
Plug 'vim-scripts/paredit.vim'

" ==== languages specific ===="
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'davidhalter/jedi-vim'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-salve'

" ==== Autocomplete ===="
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --gocode-completer --racer-completer --tern-completer --clang-completer
  endif
endfunction

Plug 'Valloric/YouCompleteMe', {'do': function('BuildYCM')}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

Plug 'Raimondi/delimitMate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'

call plug#end()


let g:ycm_global_ycm_extra_conf = '~/.vim/ycm-c-semantics.py'

" ====== key bindings and configuration ====== "
set backspace=indent,eol,start
set fileformat=unix

set autoread

" ========= Interface Configuration ========= "
set t_Co=256

if (has("termguicolors"))
  set termguicolors
endif

set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum

set background=dark
set ruler

" scroll speed
set scroll=8

" set line number and syntax
set nu
syntax on
filetype plugin indent on
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

" ===== YCM & preview variables ===== "
set completeopt=menuone
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 0

let g:SuperTabClosePreviewOnPopupClose = 1

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

let g:go_metalinter_autosave = 1

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
