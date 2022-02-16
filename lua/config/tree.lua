local utils = require('utils')

local function toggle()
  if utils.check_path('nvim-tree.lua') then
    require('nvim-tree').toggle()
  end
end

local function setup()
  vim.g.nvim_tree_quit_on_open = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_highlight_opened_files = 1
  vim.g.nvim_tree_root_folder_modifier = ':~'
  vim.g.nvim_tree_add_trailing = 1
  vim.g.nvim_tree_group_empty = 1
  vim.g.nvim_tree_disable_window_picker = 1
  vim.g.nvim_tree_icon_padding = ' '
  vim.g.nvim_tree_symlink_arrow = ' >> '
  vim.g.nvim_tree_respect_buf_cwd = 1
  vim.g.nvim_tree_create_in_closed_folder = 0
  vim.g.nvim_tree_refresh_wait = 500
  vim.g.nvim_tree_window_picker_exclude = {
    filetype = { 'notify', 'packer', 'qf', 'dashboard' },
    buftype = { 'terminal' },
  }
  vim.g.nvim_tree_special_files = {}
  vim.g.nvim_tree_special_files['README.md'] = 1
  vim.g.nvim_tree_special_files['Makefile'] = 1
  vim.g.nvim_tree_special_files['MAKEFILE'] = 1


  local tree_cb = require('nvim-tree.config').nvim_tree_callback

  local opts = {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = true,
    open_on_tab         = false,
    hijack_cursor       = true,
    update_cwd          = true,
    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = true,
      update_cwd  = true,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = false,
      custom = {}
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      hide_root_folder = false,
      side = 'left',
      auto_resize = false,
      mappings = {
        custom_only = false,
        list = {
          { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
          { key = "h", cb = tree_cb "close_node" },
          { key = "v", cb = tree_cb "vsplit" },
        }
      },
      number = false,
      relativenumber = false,
      signcolumn = "yes"
    },
    trash = {
      cmd = nil,
      require_confirm = true
    }
  }

  require'nvim-tree'.setup(opts)

end

local modules = {
  setup = setup,
  toggle = toggle,
}

return modules
