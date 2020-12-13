" Lint
    " neomake
    set signcolumn=yes
    call neomake#configure#automake('nrwi', 500)
    let g:neomake_highlight_lines = 1

    "let g:neomake_cpp_enabled_makers = ['gcc', 'cppcheck']
    "let g:neomake_cpp_gcc_args = ['-Wall', '-O2', '-std=c++11']

    "let g:neomake_c_enabled_makers = ['gcc', 'cppcheck']
    "let g:neomake_c_gcc_args = ['-Wall', '-O2', '-std=c99']

    let g:neomake_vim_enabled_makers = ['vint']