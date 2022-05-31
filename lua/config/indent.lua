local utils = require('utils')

local function setup()
  local indent = utils.get_plug('indent_blankline')
  if not indent then
    utils.log.error('Cannot load indent_blankline.nvim')
    return false
  end

  require("indent_blankline").setup {
    char = '',
    -- char_list = {' ', ' ', ' ', ' '},
    -- char_list_blankline = {' ', ' ', ' ', ' '},
    context_char = '┆',
    show_current_context = true,
    use_treesitter = true,
    filetype_exclude = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "neo-tree",
      "Trouble",
    },
    buftype_exclude = {
      "nofile",
      "terminal",
      "lsp-installer",
      "lspinfo",
    },
    context_patterns = {
      "class",
      "return",
      "function",
      "method",
      "^if",
      "^while",
      "jsx_element",
      "^for",
      "^object",
      "^table",
      "block",
      "arguments",
      "if_statement",
      "else_clause",
      "jsx_element",
      "jsx_self_closing_element",
      "try_statement",
      "catch_clause",
      "import_statement",
      "operation_type",
    }
  }
end

local modules = {
  setup = setup,
}

return modules
