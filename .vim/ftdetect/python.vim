function! CheckSomething()
    let filename = expand('%:t')
    echo filename
endfunction

augroup PickCompiler
    au!
    autocmd BufRead,BufWrite *.py compiler python
    autocmd BufRead,BufWrite test_*.py compiler pytest
    " autocmd BufRead,BufWrite *.py call CheckSomething()
augroup END
