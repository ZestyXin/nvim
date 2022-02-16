local utils = require('utils')

local function stage_hunk()
  if utils.check_path('gitsigns.nvim') then
    vim.cmd('Gitsigns stage_hunk')
  end
end

local function stage_buffer()
  if utils.check_path('gitsigns.nvim') then
    vim.cmd('Gitsigns stage_buffer')
  end
end

local function reset_hunk()
  if utils.check_path('gitsigns.nvim') then
    vim.cmd('Gitsigns reset_hunk')
  end
end


local function reset_buffer()
  if utils.check_path('gitsigns.nvim') then
    vim.cmd('Gitsigns reset_buffer')
  end
end

local function preview_hunk()
  if utils.check_path('gitsigns.nvim') then
    vim.cmd('Gitsigns preview_hunk')
  end
end

local function prev_hunk()
  if utils.check_path('gitsigns.nvim') then
    vim.cmd('Gitsigns prev_hunk')
  end
end

local function next_hunk()
  if utils.check_path('gitsigns.nvim') then
    vim.cmd('Gitsigns next_hunk')
  end
end

local function setup()
  local opts = {
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = "▎",
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      change = {
        hl = "GitSignsChange",
        text = "▎",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delete = {
        hl = "GitSignsDelete",
        text = "契",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = "契",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        hl = "GitSignsChange",
        text = "▎",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
    },
    keymaps = {
      noremap = true,
    },
    signcolumn = true,
    numhl      = false,
    linehl     = false,
    word_diff  = false,
    watch_gitdir = { interval = 1000 },
    sign_priority = 6,
    update_debounce = 200,
    status_formatter = nil, -- Use default
  }
  require('gitsigns').setup(opts)
end

local modules = {
  setup = setup,
  stage_hunk = stage_hunk,
  stage_buffer = stage_buffer,
  reset_hunk = reset_hunk,
  reset_buffer = reset_buffer,
  preview_hunk = preview_hunk,
  prev_hunk = prev_hunk,
  next_hunk = next_hunk,
}

return modules
