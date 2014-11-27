"---------------------------------------------------------------------------
" Plugin:
"

" changelog.vim"{{{
autocmd MyAutoCmd BufNewFile,BufRead *.changelog setf changelog
let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "Scusy"
"}}}

" python.vim
let python_highlight_all = 1

" netrw.vim"{{{
let g:netrw_list_hide= '*.swp'
" Change default directory.
set browsedir=current
"}}}

if neobundle#tap('neocomplete.vim') "{{{
  let g:neocomplete#enable_at_startup = 1
  let neobundle#hooks.on_source =
        \ '~/.vim/rc/plugins/neocomplete.rc.vim'

  call neobundle#untap()
endif "}}}

"if neobundle#tap('neosnippet.vim') "{{{
"  let neobundle#hooks.on_source =
"        \ '~/.vim/rc/plugins/neosnippet.rc.vim'
"
"  call neobundle#untap()
"endif "}}}

if neobundle#tap('unite.vim') "{{{
  " The prefix key.
  nnoremap    [unite]   <Nop>
  xnoremap    [unite]   <Nop>
  nmap    ; [unite]
  xmap    ; [unite]
"
"  nnoremap <expr><silent> ;b
"        \ ":\<C-u>Unite -buffer-name=build". tabpagenr() ." -no-quit build\<CR>"
"  nnoremap <expr><silent> ;t
"        \ ":\<C-u>Unite -buffer-name=test". tabpagenr() ." -no-quit build::test\<CR>"
"  nnoremap <silent> ;o
"        \ :<C-u>Unite outline -no-start-insert -resume<CR>
"  nnoremap <silent> ;t
"        \ :<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include<CR>
"  xnoremap <silent> ;r
"        \ d:<C-u>Unite -buffer-name=register register history/yank<CR>
"  nnoremap <silent> <C-k>
"        \ :<C-u>Unite change jump<CR>
"  nnoremap <silent><expr> ;g
"        \ ":\<C-u>Unite grep -buffer-name=grep%".tabpagenr()." -auto-preview -no-split -no-empty -resume\<CR>"
  nnoremap <silent> [unite]r
        \ :<C-u>Unite -buffer-name=register register history/yank<CR>

"
"  " <C-t>: Tab pages
"  nnoremap <silent><expr> <C-t>
"        \ ":\<C-u>Unite -auto-resize -select=".(tabpagenr()-1)." tab\<CR>"
"
  nnoremap <silent> [unite]s
        \ :<C-u>Unite -buffer-name=files -no-split -multi-line -unique -silent
        \ jump_point file_point file_mru
        \ file_rec/git buffer_tab:- file file/new<CR>
"
"  nnoremap <expr><silent> [Window]r  ":\<C-u>Unite -start-insert ref/".ref#detect()."\<CR>"
"  nnoremap <silent> [Window]<Space>  :<C-u>Unite -buffer-name=files file_rec:~/.vim/rc<CR>
"  nnoremap <silent> [Window]n  :<C-u>Unite -start-insert -default-action=lcd neobundle:!<CR>
"  nnoremap <silent> [Window]g  :<C-u>Unite -start-insert ghq<CR>
"
"  nnoremap <silent> [Window]f
"        \ :<C-u>Unite <CR>
"
"  nnoremap <silent> [Window]w
"        \ :<C-u>Unite window<CR>
"  nnoremap <silent> [Space]b
"        \ :<C-u>UniteBookmarkAdd<CR>
"
"  " t: tags-and-searches "{{{
"  " The prefix key.
"  nnoremap    [Tag]   <Nop>
"  nmap    t [Tag]
"  " Jump.
"  " nnoremap [Tag]t  g<C-]>
"  nnoremap <silent><expr> [Tag]t  &filetype == 'help' ?  "g\<C-]>" :
"        \ ":\<C-u>UniteWithCursorWord -buffer-name=tag -immediately tag tag/include\<CR>"
"  nnoremap <silent><expr> [Tag]p  &filetype == 'help' ?
"        \ ":\<C-u>pop\<CR>" : ":\<C-u>Unite jump\<CR>"
"  "}}}
"
"  " Execute help.
"  nnoremap <silent> <C-h>  :<C-u>Unite -buffer-name=help help<CR>
"
"  " Execute help by cursor keyword.
"  nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>
"
"  " Search.
"  nnoremap <silent><expr> /
"        \ ":\<C-u>Unite -buffer-name=search%".bufnr('%')." -start-insert line:forward:wrap\<CR>"
"  nnoremap <expr> g/  <SID>smart_search_expr('g/',
"        \ ":\<C-u>Unite -buffer-name=search -start-insert line_migemo\<CR>")
"  nnoremap <silent><expr> ?
"        \ ":\<C-u>Unite -buffer-name=search%".bufnr('%')." -start-insert line:backward\<CR>"
"  nnoremap <silent><expr> *
"        \ ":\<C-u>UniteWithCursorWord -buffer-name=search%".bufnr('%')." line:forward:wrap\<CR>"
"  nnoremap [Alt]/       /
"  nnoremap [Alt]?       ?
"  cnoremap <expr><silent><C-g>        (getcmdtype() == '/') ?
"        \ "\<ESC>:Unite -buffer-name=search line:forward:wrap -input=".getcmdline()."\<CR>" : "\<C-g>"
"
"  function! s:smart_search_expr(expr1, expr2)
"    return line('$') > 5000 ?  a:expr1 : a:expr2
"  endfunction
"
"  nnoremap <silent><expr> n
"        \ ":\<C-u>UniteResume search%".bufnr('%')." -no-start-insert\<CR>"
"
"  nnoremap <silent> <C-w>  :<C-u>Unite -auto-resize window/gui<CR>
"
  let neobundle#hooks.on_source =
        \ '~/.vim/rc/plugins/unite.rc.vim'
"
  call neobundle#untap()
endif "}}}

if neobundle#tap('vimfiler.vim') "{{{
  nnoremap <silent>   [Space]v   :<C-u>VimFiler -invisible<CR>
  nnoremap    [Space]ff   :<C-u>VimFilerExplorer<CR>

  let neobundle#hooks.on_source =
        \ '~/.vim/rc/plugins/vimfiler.rc.vim'

  call neobundle#untap()
endif "}}}


