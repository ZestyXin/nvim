local utils = require('utils')

local cmds = {
  hint_words = function ()
    local hop = utils.get_plug('hop')
    if not hop then
      utils.log.error('Cannot load hop.nvim')
      return false
    end
    hop.hint_words()
  end,
  hint_lines = function ()
    local hop = utils.get_plug('hop')
    if not hop then
      utils.log.error('Cannot load hop.nvim')
      return false
    end
    hop.hint_lines()
  end,
}

local function setup()
  local hop = utils.get_plug('hop')
  if not hop then
    utils.log.error('Cannot load hop.nvim')
    return false
  end

  hop.setup({
    keys = 'etovxqpdygfblzhckisuran',
    jump_on_sole_occurrence = false,
  })
end

local modules = {
  setup = setup,
  cmds = cmds,
}

return modules
