" vimrc -----------------------------------------------------------------------
" Johannes Lahann -------------------------------------------------------------
" Last Changed: 2015-09-16 -----------------------------------------------------


" Pluginmanager {{{1
call plug#begin('~/.cache/vim-plug')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/vader.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-scriptease'
Plug 'lervag/vimtex'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/vimfiler.vim'
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()
" Settings {{{1
set nocp
set colorcolumn=80
set shiftwidth=2
set softtabstop=2
set noswapfile
set mouse=a
set foldmethod=marker
set backspace=2
set clipboard=unnamedplus
let mapleader=","
let maplocalleader="-"
set foldmethod=marker
set expandtab
set number
set hidden

" Colorscheme {{{1 
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 234
" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
let g:seoul256_background = 256
colorscheme seoul256
" Mappings {{{1
nn <enter> o<esc>
nn <leader>sv :so ~/.vimrc<cr>
nn <leader>ev :e ~/.vimrc<cr>
nn <space> za
vnoremap a <esc>ggVG<cr>
nn <left> :bN<cr>
nn <right> :bn<cr>
nn <leader>f :FZF<cr>
nn <leader>ex :VimFiler -toggle<cr>
nn <leader>d :bd<cr>
nn <leader>v :vnew<cr>
nn <leader>go :GoyoEnter<cr>
nn <leader>gc :GoyoLeave<cr>
noremap L $
noremap H 0

vnoremap P "0p
nn P "0p
vnoremap <f2> yq:pIechom(<esc>A)<esc><cr>

" German Keyboard {{{1
map ü <C-]>
map ö [
map ä ]
map Ö {
map Ä }
map ß /
" Latex {{{1
" Compiler for latex 
" requires rubber
function! InitLatex()
  setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
  if filereadable('Makefile')
    setlocal makeprg=make
  else
    exec "setlocal makeprg=make\\ -f\\ ~/latex.mk\\ " . substitute(bufname("%"),"tex$","pdf", "")
  endif
endfunction
augroup latex
  autocmd!
  autocmd Filetype plaintex :set filetype=tex
  autocmd Filetype tex,plaintex nn <buffer> <localleader>m :silent make!\|redraw!\|cw<cr>
  autocmd Filetype tex,plaintex :call InitLatex() 
augroup END
" Vim {{{1
augroup vim
  autocmd!
  autocmd Filetype vim set expandtab
  autocmd Filetype vim set sw=2
  autocmd Filetype vim set tabstop=2
augroup END
function! InitLog(pa)
  let b:logpath=a:pa
  call system("echo ".a:pa. " > ".$HOME."/.cache/vim-logs/".b:logpath .".vimlog")
  call system("echo ------------------------------------------------------ >> ".$HOME."/.cache/vim-logs/".b:logpath .".vimlog")
endfunction 
function! MyLog(id,val)
  call system("echo ".a:id.": ".a:val. " >> ".$HOME."/.cache/vim-logs/".b:logpath .".vimlog")
endfunction


" Markdown {{{1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_folding_disabled=1
augroup markdown
  autocmd!
  autocmd Filetype mkd.markdown set expandtab
  autocmd Filetype mkd.markdown set sw=2
  autocmd Filetype mkd.markdown set tabstop=2
  autocmd Filetype mkd.markdown set foldmethod=marker
augroup END

" Neocomplete {{{1
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex =
      \ '\v\\\a*(ref|cite)\a*([^]]*\])?\{([^}]*,)*[^}]*'
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
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
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"Ultisnips {{{1
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"   

" Goyo - LimeLight {{{1
function! s:goyo_enter()
  Limelight
  Goyo 100%x100%
  set number
  set colorcolumn=80
endfunction

function! s:goyo_leave()
  Limelight!
  Goyo!
endfunction

command!  GoyoEnter  call <SID>goyo_enter()
command!  GoyoLeave  call <SID>goyo_leave()

" Vimfiler {{{1
let g:vimfiler_as_default_explorer = 1

" Spell checking {{{1
function! s:en_spell_local()
  setlocal spell
endfunction

command!  SpellEnglish call <SID>en_spell_local()

" Unite {{{1

" Yank History
let g:unite_source_history_yank_enable = 1
nnoremap <leader>uy :Unite history/yank<cr>
