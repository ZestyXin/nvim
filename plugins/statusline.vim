" Status Line
    " lightline
        " colorscheme mine
    let s:black  = [ '#232526', 233 ]
    let s:gray   = [ '#808080', 244 ]
    let s:white  = [ '#f8f8f2', 234 ]
    let s:cyan   = [ '#66d9ef',  81 ]
    let s:green  = [ '#a6e22e', 118 ]
    let s:orange = [ '#ef5939', 166 ]
    let s:pink   = [ '#f92672', 161 ]
    let s:red    = [ '#ff0000', 160 ]
    let s:yellow = [ '#e6db74', 229 ]

    let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

    let s:p.normal.left     = [ [ s:black, s:yellow ], [ s:yellow, s:black ] ]
    let s:p.normal.middle   = [ [ s:yellow, s:black ] ]  
    let s:p.normal.right    = [ [ s:black, s:yellow ], [ s:black, s:yellow ] ]

    let s:p.normal.error    = [ [ s:pink,   s:black ] ]
    let s:p.normal.warning  = [ [ s:orange, s:black ] ]

    let s:p.insert.left     = [ [ s:black,   s:cyan ], [ s:cyan, s:black ] ]
    let s:p.insert.middle   = [ [ s:cyan, s:black ] ]  
    let s:p.insert.right    = [ [ s:black,   s:cyan ], [ s:black, s:cyan ] ]

    let s:p.visual.left     = [ [ s:black,  s:green ], [ s:green, s:black ] ]
    let s:p.visual.middle   = [ [ s:green, s:black ] ]  
    let s:p.visual.right    = [ [ s:black,  s:green ], [ s:black, s:green ] ]

    let s:p.replace.left    = [ [ s:black,    s:red ], [ s:red, s:black ] ]
    let s:p.replace.middle  = [ [ s:red, s:black ] ]  
    let s:p.replace.right   = [ [ s:black,    s:red ], [ s:black, s:red ] ]

    let s:p.inactive.left   = [ [ s:gray, s:black ], [ s:white, s:black ] ]
    let s:p.inactive.middle = [ [ s:gray, s:black ] ]
    let s:p.inactive.right  = [ [ s:white, s:gray ], [ s:gray, s:black ] ]

    let s:p.tabline.left    = [ [ s:orange, s:black ] ]
    let s:p.tabline.middle  = [ [ s:orange, s:black] ]
    let s:p.tabline.right   = copy(s:p.normal.right)
    let s:p.tabline.tabsel  = [ [ s:black, s:orange ] ]

    let g:lightline#colorscheme#mine#palette = lightline#colorscheme#flatten(s:p)

        " settings
    let g:lightline = {
      \ 'colorscheme': 'mine',
      \ 'active': {
      \     'left': [['mode', 'paste'], ['readonly', 'filename', 'modified']],
      \     'right': [['lineinfo'], ['percent'], ['fileinfo'] , ['errormsg']]
      \ },
      \ 'component': {
      \     'lineinfo': '▶%3l/%-2c',
      \     'percent': '≡ %3p%%',
      \ },
      \ 'component_function': {
      \     'paste': 'ShowPaste',
      \     'fileinfo': 'ShowFileInfo',
      \     'errormsg': 'ShowNeomake',
      \ },
      \ }

    function! ShowPaste()
        return &paste ? '[P]' : ''
    endfunction

    function! ShowFileInfo()
        let file_format = &ff
        let file_encoding = &fenc!=#""?&fenc:&enc
        let file_type = &ft!=#""?&ft:"NO"
        return '🖥 '.toupper(file_format).' 🖊 '.file_encoding.' 🧾 '.file_type
    endfunction

    function! ShowNeomake()
        let leaderf_msg = neomake#statusline#LoclistCounts()
        let error_msg = has_key(leaderf_msg, 'E') ? '❌ '.leaderf_msg['E'] : ''
        let warn_msg = has_key(leaderf_msg, 'W') ? '❗ '.leaderf_msg['W'] : ''
        let x_msg = has_key(leaderf_msg, 'x') ? '❓ '.leaderf_msg['x'] : ''
        return ''.error_msg.warn_msg.x_msg
    endfunction
    

