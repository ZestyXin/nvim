" Complete
    " Settings 
        " deoplete
    let g:deoplete#enable_at_startup = 1
    call deoplete#custom#option('ignore_sources', {'_': ['buffer', 'around']})
    call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment'])
        " clangx
        " neco-vim
        " neoinclude
    let g:neoinclude#ctags_command = ""
        " neopairs
        " neo-snippet
    "let g:neosnippet#snippets_directory = ''
        " echodoc
    set noshowmode
    let g:echodoc#enable_at_startup = 1
        " auto-pairs
    let g:AutoPairsFlyMode = 0
    let g:AutoPairsMultilineClose = 1
    let g:AutoPairsCenterLine = 1

    let g:AutoPairsShortcutToggle = ''
    let g:AutoPairsShortcutBackInsert = ''
    let g:AutoPairsShortcutFastWrap = ''
    let g:AUtoPairsShortcutJump = ''

    let g:AutoPairsMapBS = 0
    let g:AutoPairsMapCh = 0
    let g:AutoPairsMapCR = 0
    let g:AutoPairsMapSpace = 0

    " Key Mappings
    imap <silent> <expr><Tab> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>")
    smap <silent> <expr><Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
    xmap <silent> <expr><Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
    imap <silent> <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-tab>"

    imap <silent> <expr><CR> pumvisible() ? 
        \ (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : deoplete#close_popup()) : 
        \ "\<cr><C-R>=AutoPairsReturn()<CR>"
    
    inoremap <buffer> <silent> <BS>     <C-R>=AutoPairsDelete()<CR>
    inoremap <buffer> <silent> <space>  <C-R>=AutoPairsSpace()<CR>
    inoremap <buffer> <silent> <M-e>    <C-R>=AutoPairsFastWrap()<CR>
    inoremap <buffer> <silent> <C-l>    <Esc>:call AutoPairsJump()<CR>a