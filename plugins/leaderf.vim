" LeaderF
    let g:Lf_RootMarkers = ['.root', '.svn', '.git', '.hg', '.project']
    let g:Lf_WindowHeight = 0.3
    let g:Lf_ShowRelativePath = 0
    let g:Lf_CacheDirectory = expand('~/.cache/leaderf')
    let g:Lf_WorkingDirectory = 'Ac'
    let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0}

    let g:Lf_ShortcutF = '<m-f>'
    let g:Lf_shortcutB = '<m-b>'
    noremap <m-m> :LeaderfMru<cr>
    noremap <m-p> :LeaderfFunction!<cr>
    noremap <m-t> :LeaderfTag<cr>