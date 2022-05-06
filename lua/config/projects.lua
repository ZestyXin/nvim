local utils = require('utils')

local function setup()
  local project = utils.get_plug('project_nvim')
  if not project then
    utils.log.error('Cannot load project_nvim')
    return false
  end

  project.setup({
    manual_mode = false,
    detection_methods = { "lsp", "pattern" },
    patterns = { ".root", ".git", "go.mod", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    ignore_lsp = {},
    exclude_dirs = {},
    show_hidden = false,
    silent_chdir = true,
    datapath = utils.path.get_cache_dir()
  })
  require('telescope').load_extension('projects')
end

local modules = {
  setup = setup,
}

return modules
