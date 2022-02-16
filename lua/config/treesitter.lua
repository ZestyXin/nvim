local function setup()
  require('nvim-treesitter.configs').setup({
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
