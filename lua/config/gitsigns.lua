local utils = require('utils')

local cmds = {
  stage_hunk   = function ()
    local gitsign = utils.get_plug('gitsigns')
    if not gitsign then
      utils.log.error('Cannot load gitsigns.nvim')
      return false
    end
    gitsign.stage_hunk()
  end,
  stage_buffer = function ()
    local gitsign = utils.get_plug('gitsigns')
    if not gitsign then
      utils.log.error('Cannot load gitsigns.nvim')
      return false
    end
    gitsign.stage_buffer()

  end,
  reset_hunk   = function ()
    local gitsign = utils.get_plug('gitsigns')
    if not gitsign then
      utils.log.error('Cannot load gitsigns.nvim')
      return false
    end
    gitsign.reset_hunk()

  end,
  reset_buffer = function ()
    local gitsign = utils.get_plug('gitsigns')
    if not gitsign then
      utils.log.error('Cannot load gitsigns.nvim')
      return false
    end
    gitsign.reset_buffer()

  end,
  preview_hunk = function ()
    local gitsign = utils.get_plug('gitsigns')
    if not gitsign then
      utils.log.error('Cannot load gitsigns.nvim')
      return false
    end
    gitsign.preview_hunk()
  end,
  prev_hunk    = function ()
    local gitsign = utils.get_plug('gitsigns')
    if not gitsign then
      utils.log.error('Cannot load gitsigns.nvim')
      return false
    end
    gitsign.prev_hunk()
  end,
  next_hunk    = function ()
    local gitsign = utils.get_plug('gitsigns')
    if not gitsign then
      utils.log.error('Cannot load gitsigns.nvim')
      return false
    end
    gitsign.next_hunk()
  end,
}

local function setup()
  local gitsign = utils.get_plug('gitsigns')
  if not gitsign then
    utils.log.error('Cannot load gitsigns.nvim')
    return false
  end

  gitsign.setup({
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
  })
end


local modules = {
  setup = setup,
  cmds = cmds,
}

return modules
