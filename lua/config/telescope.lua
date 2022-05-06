local utils = require('utils')

local cmds = {
  find_files = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.find_files()
  end,
  grep_string = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.grep_string()
    end,
  live_grep = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.live_grep()
  end,
  buffers = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.buffers()
  end,
  marks = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.marks()
  end,
  keymaps = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.keymaps()
  end,
  current_buffer = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.current_buffer_fuzzy_find()
  end,

  lsp_references = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.lsp_references()
  end,
  lsp_document_symbols = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.lsp_document_symbols()
  end,
  lsp_workspace_symbols = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.lsp_workspace_symbols()
  end,
  lsp_dynamic_workspace_symbols = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.lsp_dynamic_workspace_symbols()
  end,
  diagnostics = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.diagnostics()
  end,
  lsp_implementations = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.lsp_implementations()
  end,
  lsp_definitions = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.lsp_definitions()
  end,
  lsp_type_definitions = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.lsp_type_definitions()
  end,

  treesitter = function ()
    local builtin = utils.get_plug('telescope.builtin')
    if not builtin then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    builtin.treesitter()
  end,
  file_browser = function ()
    local telescope = utils.get_plug('telescope')
    if not telescope then
      utils.log.error('Cannot load telescope.nvim')
      return false
    end
    telescope.extensions.file_browser.file_browser()
  end,
}

local function setup()
  local telescope = utils.get_plug('telescope')
  if not telescope then
    utils.log.error('Cannot load telescope.nvim')
    return false
  end

  local sorters = require 'telescope.sorters'

  telescope.setup({
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      entry_prefix = "  ",
      initial_mode = "normal",
      file_sorter = sorters.get_fuzzy_file,
      generic_sorter = sorters.get_generic_fuzzy_sorter,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
      },
      file_ignore_patterns = {},
      path_display = { shorten = 5 },
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      pickers = {
        find_files = {
          find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
        },
        live_grep = {
          --@usage don't include the filename in the search results
          only_sort_text = true,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
      file_browser = {
        -- theme = "ivy",
        mappings = {
          ["i"] = {
          -- your custom insert mode mappings
          },
          ["n"] = {
          -- your custom normal mode mappings
          },
        },
      },
    },
  })
  telescope.load_extension('fzf')
  telescope.load_extension('file_browser')


end

local modules = {
  setup = setup,
  cmds = cmds,
}

return modules
