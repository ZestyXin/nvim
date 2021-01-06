" Explorer
    " vim-dirvish
    noremap <silent><m-i> :Dirvish<cr>
    augroup dirvish_config
      autocmd!
      " Map `t` to open in new tab.
      autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
      " Map `gr` to reload.
      autocmd FileType dirvish nnoremap <silent><buffer>
        \ gr :<C-U>Dirvish %<CR>
      " Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
      autocmd FileType dirvish nnoremap <silent><buffer>
        \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>
    augroup END

    " vim-dirvish-git
    let g:dirvish_git_show_icons = 1
    let g:dirvish_git_indicators = {
        \ 'Modified'  : '✹',
        \ 'Staged'    : '✚',
        \ 'Untracked' : '✭',
        \ 'Renamed'   : '➜',
        \ 'Unmerged'  : '═',
        \ 'Ignored'   : '☒',
        \ 'Unknown'   : '?'
        \ }
