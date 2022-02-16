local utils = require('utils')

local function setup()
  local opts = {
    manual_mode = false,
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "go.mod", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    ignore_lsp = {},
    exclude_dirs = {},
    show_hidden = false,
    silent_chdir = true,
    datapath = utils.path.get_cache_dir()
  }
  require('project_nvim').setup(opts)
  require('telescope').load_extension('projects')
end

local modules = {
  setup = setup,
}

return modules
