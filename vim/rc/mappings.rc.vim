"" Key-mappings:
""---------------------------------------------------------------------------
""
let mapleader= ","
let maplocalleader= "m"
" German Keyboard
map ö [
map <c-ä> <c-]>
map ä ] 
xmap ö [
xmap ä ]
nnoremap ü <C-]>
nnoremap Ü <C-O>
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

"VimFiler
noremap <leader>e :VimFiler<cr>
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

nnoremap <leader>v :e $MYVIMRC<cr>

" Upper case
inoremap <c-u> <esc>viWU<esc>Ea
nnoremap <c-u> vaWUe

"Move Lines
nnoremap - :m .+1<CR>==
nnoremap _ :m .-2<CR>==
vnoremap - :m '>+1<CR>gv=gv
vnoremap _ :m '<-2<CR>gv=gv
