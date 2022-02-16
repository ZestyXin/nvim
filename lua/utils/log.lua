local path = require('utils.path')

local function nvim_print_log(title, content, level)
  local msg = title .. ':' .. content
  if level == 'error' then
    vim.cmd('echohl ErrorMsg')
  elseif level == 'warn' then
    vim.cmd('echohl WarningMsg')
  end
  vim.cmd('echo "' .. msg .. '"')
  vim.cmd('echohl None')
end

local function print_log(title, content, level)
  local notify_path = path.get_data_dir() .. '/site/pack/packer/start/nvim-notify'

  if vim.fn.empty(vim.fn.glob(notify_path)) > 0 then
    nvim_print_log(title, content, level)
    return
  end

  local notify = require('notify')
  notify(content, level, {
    title = title
  })
end

local function log_error(title, content)
  print_log(title, content, 'error')
end

local function log_warn(title, content)
  print_log(title, content, 'warn')
end

local function log_info(title, content)
  print_log(title, content, 'info')
end

local function log_debug(title, content)
  print_log(title, content, 'debug')
end

local modules = {
  error = log_error,
  warn = log_warn,
  info = log_info,
  debug = log_debug,
}

return modules
