" Environment
let g:vimscript_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:python3_host_prog='C:\Users\Zesty\AppData\Local\Programs\Python\Python38\python.exe'

" Default Settings
if filereadable(expand(vimscript_path.'/default.vim'))
    exec expand('source '.vimscript_path.'/default.vim')
endif

" Plugins Settings
if filereadable(expand(vimscript_path.'/plugins.vim'))
    exec expand('source '.vimscript_path.'/plugins.vim')
endif