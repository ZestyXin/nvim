local function setup()
  vim.g.onedark_style = 'deep'
  vim.g.onedark_transparent_background = true
  vim.g.onedark_italic_comment = true
  vim.g.onedark_disable_terminal_colors = false
  vim.g.onedark_diagnostics_undercurl = true
  vim.g.onedark_darker_diagnostics = true
  vim.g.onedark_hide_ending_tildes = false
  require('onedark').setup()

  vim.cmd('highlight NotifyERRORBorder  guifg=#f65866')
  vim.cmd('highlight NotifyWARNBorder   guifg=#efbd5d')
  vim.cmd('highlight NotifyINFOBorder   guifg=#455574')
  vim.cmd('highlight NotifyDEBUGBorder  guifg=#41a7fc')
  vim.cmd('highlight NotifyTRACEBorder  guifg=#8bcd5b')
  vim.cmd('highlight NotifyERRORIcon    guifg=#f65866')
  vim.cmd('highlight NotifyWARNIcon     guifg=#efbd5d')
  vim.cmd('highlight NotifyINFOIcon     guifg=#455574')
  vim.cmd('highlight NotifyDEBUGIcon    guifg=#41a7fc')
  vim.cmd('highlight NotifyTRACEIcon    guifg=#8bcd5b')
  vim.cmd('highlight NotifyERRORTitle   guifg=#f65866')
  vim.cmd('highlight NotifyWARNTitle    guifg=#efbd5d')
  vim.cmd('highlight NotifyINFOTitle    guifg=#455574')
  vim.cmd('highlight NotifyDEBUGTitle   guifg=#41a7fc')
  vim.cmd('highlight NotifyTRACETitle   guifg=#8bcd5b')
  vim.cmd('highlight link NotifyERRORBody Normal')
  vim.cmd('highlight link NotifyWARNBody  Normal')
  vim.cmd('highlight link NotifyINFOBody  Normal')
  vim.cmd('highlight link NotifyDEBUGBody Normal')
  vim.cmd('highlight link NotifyTRACEBody Normal')
end

local modules = {
  setup = setup,
}

return modules
