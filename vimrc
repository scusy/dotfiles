" Bundles {{{1
if has('vim_starting')
set nocompatible               
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim' 
NeoBundle 'scusy/vim-colors'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Lokaltog/vim-easymotion'
filetype plugin indent on
NeoBundleCheck


" Friendly Cat :)
echom " (>^.^<) "
" Config {{{1 
let s:is_windows = has('win16') || has('win32') || has('win64')
let s:is_cygwin = has('win32unix')
let s:is_mac = !s:is_windows && !s:is_cygwin
      \ && (has('mac') || has('macunix') || has('gui_macvim') ||
      \   (!executable('xdg-open') &&
      \     system('uname') =~? '^darwin'))
let s:is_sudo = $SUDO_USER != '' && $USER !=# $SUDO_USER
      \ && $HOME !=# expand('~'.$USER)
      \ && $HOME ==# expand('~'.$SUDO_USER)
	

syntax on

if has("wildmenu")
    set wildmenu
    " Ignore stuff (for TAB autocompletion)
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif

set list
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪
" dont need recovery-> user version control
set nobackup
set nowritebackup
set noswapfile

set autoindent
set autoread
set smartindent
set cmdheight=2
set number
set backspace=indent,eol,start
set showmatch 
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set expandtab
set clipboard=unnamed
set clipboard=unnamedplus 
" Config||Leader {{{1
let mapleader = ","
let maplocalleader="-"


" Plugins {{{1
" UltiSnips {{{2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
" neocomplete {{{2
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Colorscheme {{{1
set t_Co=256
set background=dark
colorscheme  3dglasses
highlight clear SignColumn

" Filetype||Html {{{1
augroup ft_html
    au!
    au BufNewFile,BufRead *.html setlocal filetype=html
    au FileType html setlocal foldmethod=manual
augroup END

" Filetype||Vim {{{1
augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
augroup END
" XML folding
set foldnestmax=2
let g:xml_syntax_folding=0
augroup ft_xml
    au!
    au FileType xml setlocal foldmethod=syntax
augroup END
" Mappings  {{{1


"Fix Some Movement
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
inoremap jk <esc>
nnoremap n nzzzv
nnoremap N Nzzzv
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>
" Easymotion
let g:EasyMotion_mapping_f = 'f'
let g:EasyMotion_mapping_F = 'F'
let g:EasyMotion_mapping_T = 'T'
let g:EasyMotion_mapping_t = 't'

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_
" Paste
nnoremap <leader>p o<esc>p
set scroll=15
" Folds
nnoremap <space> za
vnoremap <space> zf

" Vimrc 
nnoremap <leader>sv  :source ~/.vimrc<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>

" Upper case
inoremap <c-u> <esc>viWU<esc>Ea
nnoremap <c-u> vaWUe

"Move Lines
nnoremap - :m .+1<CR>==
nnoremap _ :m .-2<CR>==
vnoremap - :m '>+1<CR>gv=gv
vnoremap _ :m '<-2<CR>gv=gv
