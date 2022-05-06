return {
  'au FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>',
  'au FileType dashboard nnoremap <silent> <buffer> q :q<CR>',
  'au BufEnter *.vala exec ":set filetype=vala"',
  'au FileType vim,lua,c,cpp,java,go,javascript,python,rust,xml,yml,perl,sql au BufWritePre <buffer> call StripTrailingWhitespace()'
}
