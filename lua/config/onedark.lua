local utils = require('utils')

local function setup()
  local onedark = utils.get_plug('onedark')
  if not onedark then
    utils.log.error('Cannot load onedark.nvim')
    return false
  end

  onedark.setup({
    style = 'deep',
    transparent = true,
    term_colors = false,
    ending_tildes = false,
    cmp_itemkind_reverse = false,
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
    colors = {},
    highlights = {},
    diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
    },
  })
  onedark.load()

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
