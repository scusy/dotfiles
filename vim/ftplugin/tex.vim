"EasyLatex

"Simple Script to compile Latex
if !exists("g:easylatex_compile")
        let g:easylatex_compile = "rubber"
        let g:easylatex_view = "evince "
endif

function! EasylatexCompile()
        silent !clear
        execute "silent !" . g:easylatex_compile. " " . bufname("%")
        execute "silent !" . g:easylatex_view. " " . expand("%:r") . ".dvi &"
endfunction

nnoremap <buffer> <localleader>c :call EasylatexCompile()<cr>
