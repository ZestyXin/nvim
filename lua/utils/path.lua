-- Path

local function get_config_dir()
  return vim.fn.stdpath("config")
end

local function get_cache_dir()
  return vim.fn.stdpath("cache")
end

local function get_data_dir()
  return vim.fn.stdpath("data")
end

local modules = {
  get_config_dir = get_config_dir,
  get_cache_dir = get_cache_dir,
  get_data_dir = get_data_dir,
}

return modules
