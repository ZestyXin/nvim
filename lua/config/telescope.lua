local utils = require('utils')

local function find_files()
  if utils.check_path('telescope.nvim') then
    require('telescope.builtin').find_files()
  end
end

local function live_grep()
  if utils.check_path('telescope.nvim') then
    require('telescope.builtin').live_grep()
  end
end

local function grep_string()
  if utils.check_path('telescope.nvim') then
    require('telescope.builtin').grep_string()
  end
end

local function buffers()
  if utils.check_path('telescope.nvim') then
    require('telescope.builtin').buffers()
  end
end

local function lsp_workspace_symbols()
  if utils.check_path('telescope.nvim') then
    require('telescope.builtin').lsp_dynamic_workspace_symbols()
  end
end


local function lsp_references()
  if utils.check_path('telescope.nvim') then
    require('telescope.builtin').lsp_references()
  end
end


local function lsp_definitions()
  if utils.check_path('telescope.nvim') then
    require('telescope.builtin').lsp_definitions()
  end
end

local function diagnostics()
  if utils.check_path('telescope.nvim') then
    require('telescope.builtin').diagnostics()
  end
end

local function lsp_type_definitions()
  if utils.check_path('telescope.nvim') then
    require('telescope.builtin').lsp_type_definitions()
  end
end

local function setup()
  local previewers = require "telescope.previewers"
  local sorters = require "telescope.sorters"
  local opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,
      file_sorter = sorters.get_fuzzy_file,
      generic_sorter = sorters.get_generic_fuzzy_sorter,
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.75,
        preview_cutoff = 120,
        horizontal = { mirror = false },
        vertical = { mirror = false },
      },
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
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
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
    },
  }
  require('telescope').setup(opts)
  require('telescope').load_extension('fzf')
end

local modules = {
  setup = setup,
  find_files = find_files,
  live_grep = live_grep,
  grep_string = grep_string,
  buffers = buffers,
  lsp_workspace_symbols = lsp_workspace_symbols,
  lsp_references = lsp_references,
  lsp_definitions = lsp_definitions,
  lsp_type_definitions = lsp_type_definitions,
  diagnostics = diagnostics,
}

return modules
