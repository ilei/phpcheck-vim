if exists("g:php_check")
    finish
endif

let g:php_check = 1

if !exists("g:php_check_autorun")
    let g:php_check_autorun = 0
endif

if !exists('g:PHP_SYNTAX_CHECK_BIN')
    let g:PHP_SYNTAX_CHECK_BIN = 'php'
endif

function! PhpCheckSyntax()
    if &filetype == 'php'
        let result = system(g:PHP_SYNTAX_CHECK_BIN.' -l -n '.expand('%'))
        if (stridx(result, 'No syntax errors detected') == -1)
            echohl WarningMsg | echo result | echohl None
        endif
    endif
endfunction

if g:php_check_autorun
    autocmd BufWritePost * call PhpCheckSyntax()
endif

function! CallPhpCheckSyntax()
    if g:php_check_autorun
        w
    else
        w
        call PhpCheckSyntax()
    endif
endfunction
