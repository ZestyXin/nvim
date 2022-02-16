-- Utils

local uv = vim.loop
local path_sep = uv.os_uname().version:match "Windows" and "\\" or "/"
local function join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

local path = require('utils.path')
local log = require('utils.log')
local function get_plug(name)
  local ok, plug = pcall(require, name)
  if ok then
    return plug
  else
    log.error(name, 'Please Install ' .. name .. ' by run :PackerInstall')
    return ok
  end
end

local function check_path(name, prefix)
  if not prefix then
    prefix = 'start'
  end
  local install_path = join_paths(path.get_data_dir(), 'site/pack/packer', prefix, name)
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    log.error(name, 'Please Install ' .. name .. ' by run :PackerInstall')
    return false
  end

  return true
end

local modules = {
  join_paths = join_paths,
  get_plug = get_plug,
  check_path = check_path,
  config = require('utils.config'),
  log = log,
  loader = require('utils.loader'),
  path = path,
}

return modules
