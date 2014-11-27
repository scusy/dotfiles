" NeoBundle:
"

NeoBundleFetch 'Shougo/neobundle.vim'


"NeoBundleLazy 'Shougo/echodoc.vim', {
"      \ 'insert' : 1
"      \ }

NeoBundleLazy 'Shougo/neocomplete.vim', {
      \ 'depends' : 'Shougo/context_filetype.vim',
      \ 'insert' : 1
      \ }

"NeoBundleLazy 'Shougo/neosnippet.vim', {
"      \ 'depends' : ['Shougo/neosnippet-snippets', 'Shougo/context_filetype.vim'],
"      \ 'insert' : 1,
"      \ 'filetypes' : 'snippet',
"      \ 'unite_sources' : [
"      \    'neosnippet', 'neosnippet/user', 'neosnippet/runtime'],
"      \ }

"NeoBundle 'Shougo/neobundle-vim-scripts'

NeoBundleLazy 'Shougo/unite.vim', {
      \ 'commands' : [{ 'name' : 'Unite',
      \                 'complete' : 'customlist,unite#complete_source'}]
      \ }
"NeoBundleLazy 'Shougo/unite-build'
"NeoBundleLazy 'Shougo/neossh.vim', {
"      \ 'filetypes' : 'vimfiler',
"      \ 'sources' : 'ssh',
"      \ }
"NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'Shougo/tabpagebuffer.vim'
"
"NeoBundleLazy 'ujihisa/vimshell-ssh', {
"      \ 'filetypes' : 'vimshell',
"      \ }
"NeoBundle 'Shougo/unite-sudo'
"NeoBundleLazy 'Shougo/vim-vcs', {
"      \ 'depends' : 'thinca/vim-openbuf',
"      \ }
NeoBundleLazy 'Shougo/vimfiler.vim', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'commands' : [
      \         { 'name' : ['VimFiler', 'Edit', 'Write'],
      \           'complete' : 'customlist,vimfiler#complete' },
      \         'Read', 'Source'],
      \ 'mappings' : '<Plug>',
      \ 'explorer' : 1,
      \ }
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    }
      \ }

"NeoBundleLazy 'Shougo/vimshell.vim', {
"      \ 'commands' : [{ 'name' : 'VimShell',
"      \                 'complete' : 'customlist,vimshell#complete'},
"      \               ],
"      \ 'mappings' : '<Plug>
"      \ }

"NeoBundleLazy 'Shougo/vinarise.vim', {
"      \ 'commands' : [{
"      \   'name' : 'Vinarise', 'complete' : 'file'
"      \ }]
"      \ }

"NeoBundleLazy 'Shougo/vesting', {
"      \ 'unite_sources' : 'vesting'
"      \ }

"NeoBundleLazy 'Shougo/junkfile.vim', {
"      \ 'unite_sources' : 'junkfile',
"      \ }

"NeoBundleLazy 'Shougo/unite-outline'

"NeoBundleLazy 'vim-ruby/vim-ruby', {
"      \ 'mappings' : '<Plug>',
"      \ 'filetypes' : 'ruby'
"      \ }
"

"NeoBundleLazy 'Shougo/unite-help'

NeoBundleLazy 'godlygeek/csapprox', { 'terminal' : 1 }
NeoBundleLazy 'thinca/vim-guicolorscheme', { 'terminal' : 1 }
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'flazz/vim-colorschemes'

"NeoBundleLazy 'Shougo/javacomplete', {
"      \ 'filetypes' : 'java',
"      \ }

"NeoBundleLazy 'osyo-manga/vim-monster', {
"      \ 'filetypes' : 'ruby',
"      \ }
