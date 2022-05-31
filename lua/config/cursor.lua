local utils = require('utils')
local function setup()
  local cursor = utils.get_plug('nvim-cursorline')
  cursor.setup {
    cursorline = {
      enable = true,
      timeout = 1000,
      number = false,
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true },
    }
}
end

local modules = {
  setup = setup,
}

return modules
