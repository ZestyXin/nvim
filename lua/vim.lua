
local function init()
  local vim_scripts = [[
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
  ]]

  vim.cmd(vim_scripts)
end

local modules = {
  init = init,
}

return modules
