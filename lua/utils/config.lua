-- utils.config

local function set_options(options)
  for key, val in pairs(options) do
    vim.opt[key] = val
  end
end

local function set_cmds(cmds)
  for _, val in pairs(cmds) do
    vim.api.nvim_command(val)
  end
end

local function set_mode_mapping(mode, mapping)
  local mode_adapters = {
    all_mode = "",
    insert_mode = "i",
    normal_mode = "n",
    term_mode = "t",
    visual_mode = "v",
    visual_block_mode = "x",
    command_mode = "c",
  }
  mode = mode_adapters[mode]
  if not mode then
    return
  end

  for key, val in pairs(mapping) do
    local opt = {}
    if type(val) ==  "table" then
      opt = val[2]
      val = val[1]
    end
    vim.api.nvim_set_keymap(mode, key, val, opt)
  end

end

local function set_keybindings(keybindings)
  keybindings = keybindings or {}
  for mode, mapping in pairs(keybindings) do
    set_mode_mapping(mode, mapping)
  end
end

local modules = {
  set_options = set_options,
  set_cmds = set_cmds,
  set_keybindings = set_keybindings,
}

return modules
