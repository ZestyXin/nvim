local utils = require('utils')
local function setup()
  local treesitter = utils.get_plug('nvim-treesitter.configs')
  if not treesitter then
    utils.log.error('Cannot load nvim-treesitter')
    return false
  end

  treesitter.setup({
    autopairs = {
      enable = true
    },
    ensure_installed = {
      'bash',
      'c',
      'cmake',
      'cpp',
      'dart',
      'devicetree',
      'go',
      'lua',
      'python',
    },
    ignore_install = {},

    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
end

local modules = {
  setup = setup,
}

return modules
