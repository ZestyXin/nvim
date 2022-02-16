local utils = require('utils')

local function hint_words()
  if utils.check_path('hop.nvim') then
    require('hop').hint_words()
  end
end

local function hint_lines()
  if utils.check_path('hop.nvim') then
    require('hop').hint_lines()
  end
end

local function setup()
  local opts = {
    keys = 'etovxqpdygfblzhckisuran',
    jump_on_sole_occurrence = false,
  }
  require('hop').setup(opts)
end

local modules = {
  setup = setup,
  hint_words = hint_words,
  hint_lines = hint_lines,
}

return modules
