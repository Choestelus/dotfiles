set nocompatible              " be iMproved, required

if has('vim_starting')
    set runtimepath+=~/.config/nvim/
endif

call plug#begin('~/.local/share/nvim/plugged')

" Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" ==== colorschemes ==== "
Plug 'Rigellute/rigel'
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'tyrannicaltoucan/vim-quantum'

" ==== syntax highlight ==== "
Plug 'cespare/vim-toml'
Plug 'kien/rainbow_parentheses.vim'
Plug 'guns/vim-clojure-highlight'

" ==== languages specific ===="
Plug 'elzr/vim-json'
" Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.local/share/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-salve'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" ==== Autocomplete ===="
Plug 'Raimondi/delimitMate'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'


Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ==== Plugin order matters ==== "

call plug#end()

filetype plugin indent on

" ========== coc.nvim ========== "
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" ============================== "
let g:ale_sign_column_always = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


" ====== key bindings and configuration ====== "
set backspace=indent,eol,start
set fileformat=unix

set autoread
" ========= Interface Configuration ========= "
" set t_Co=256
set termguicolors

set hidden

set t_8b=[48;2;%lu;%lu;%lum
set t_8f=[38;2;%lu;%lu;%lum

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
" let g:rigel_airline=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'one'
" set laststatus=2

" ===== Syntax Configuration ===== "
let g:vim_json_syntax_conceal = 0
let g:indentLine_noConcealCursor=""

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set statusline+=%#warningmsg#
set statusline+=%*

set completeopt=longest,menuone
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
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'

let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = 'goimports'

let g:gometalinter_enabled = ['vet']
let g:go_metalinter_autosave = 0
"
" Search
nnoremap <C-p> :call fzf#run(fzf#wrap({'source': 'fd -t f . $(git rev-parse --show-toplevel)','options': '--preview="bat --color=always {}"'}))<cr>
"" search by buffer name
nnoremap <silent> <leader>s :call fzf#run(fzf#wrap({'source': map(range(1, bufnr('$')), 'bufname(v:val)'), 'options': '--preview="bat --color=always {}"'}))<cr>
"" Pass current word to :Rg when invoke
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

nnoremap <silent> <leader>e :call Fzf_dev()<CR>
" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

"" Easymotion
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader>L <Plug>(easymotion-overwin-line)


"" map <Space> as <Leader>, this don't change to current leader's key
"map <Space> <Leader>
" Remap the leader key to signle quote
let mapleader = "'"
" Run commands with semicolon
nnoremap ; :

" display indent guild
let g:indent_guides_enable_on_vim_startup = 1

" My Define keymap
"" OmniComplete on tab - Change <Tab> in InsertMode to Ctrl-X + Ctrl-O
" imap <Tab> <C-x><C-o>
map <C-n> :NERDTreeToggle<CR>
"
" Buffer
" close it with out closing window
command! BD :bn|:bd#
noremap <Leader>bd :BD<CR>

"" jump between go symbol/function
nnoremap <leader><C-r> :GoDecls<cr>

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)
" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)
" Rename the identifier under the cursor to a new name
" au FileType go nmap <Leader>e <Plug>(go-rename)

let $NVIM_PYTHON_LOG_FILE='/tmp/nvim_log'
let $NVIM_PYTHON_LOG_LEVEL='DEBUG'
