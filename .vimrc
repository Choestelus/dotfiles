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
" ==== colorschemes ==== "
Plugin 'vim-scripts/chance-of-storm'
Plugin 'tomasr/molokai'
Plugin 'sjl/badwolf'

" ==== syntax highlight ==== "
Plugin 'xsbeats/vim-blade'

" ==== languages specific ===="

" ==== Autocomplete ===="
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

" ========= Tab autocompletion ========= "
inoremap <C-Space> <C-x><C-o>
" remap <tab> to auto-complete
function InsertTabWrapper()

  " popup menu visible? select next item
  if pumvisible()
    return "\<c-n>"
  endif

  if strpart(getline('.'), 0, col('.') - 1) =~ '\w$'

    if ShouldUseOmniCompletion()
      return "\<c-x>\<c-o>"
    endif

    return "\<c-n>"

  endif

  return "\<tab>"

endfunction

function ShouldUseOmniCompletion()
  let text = strpart(getline('.'), 0, col('.') - 1)
  let name = synIDattr(synID(line("."), col("."), 1), "name")
  if text =~ '</$' | return 1 | end
  if name =~ '^css' | return 1 | end
  return 0
endfunction

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-tab> <c-p>

" ========= End tab autocomplete ========= "



" ========= Interface Configuration ========= "
set ruler background=dark

" scroll speed
set scroll=8

" set line number and syntax
set nu
syntax on

" show line number and command being entered
set showcmd number

" set fonts
set encoding=utf-8
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h10

" airline configurations
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
set laststatus=2

" colorscheme
colorscheme badwolf

" ==== Indentations ==== "

" set tab stops
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
set autoindent

au FileType html setl sw=2 sts=2 et
au FileType php setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et
au FileType ruby setl sw=2 sts=2 et

