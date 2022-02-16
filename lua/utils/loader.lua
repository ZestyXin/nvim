local path = require('utils.path')
local log  = require('utils.log')

local function load(plugins)
  -- local compile_path = path.get_data_dir() .. '/plugin/packer_compiled.lua'
  local package_root = path.get_data_dir() .. '/site/pack'

  local install_path = package_root .. "/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    log.error('Packer', 'Please install packer.vim')
    return
  end

  local packer = require('packer')
  packer.init({
    package_root = package_root,
    -- compile_path = compile_path,
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  })
  packer.reset()

  for _, plugin in ipairs(plugins) do
    packer.use(plugin)
  end
end

local modules = {
  load = load,
}

return modules
