local utils = require('utils')

local function show()
  if utils.check_path('dashboard-nvim', 'opt') then
    vim.cmd('Dashboard')
  end
end

local function setup()
  vim.g.dashboard_default_executive = 'telescope'
  vim.g.dashboard_custom_header = {
    '',
    [[ ________        __    __                             __               ]],
    [[|        \      |  \  |  \                           |  \              ]],
    [[ \▓▓▓▓▓▓▓▓      | ▓▓\ | ▓▓ ______   ______  __     __ \▓▓______ ____   ]],
    [[    /  ▓▓ ______| ▓▓▓\| ▓▓/      \ /      \|  \   /  \  \      \    \  ]],
    [[   /  ▓▓ |      \ ▓▓▓▓\ ▓▓  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\\▓▓\ /  ▓▓ ▓▓ ▓▓▓▓▓▓\▓▓▓▓\ ]],
    [[  /  ▓▓   \▓▓▓▓▓▓ ▓▓\▓▓ ▓▓ ▓▓    ▓▓ ▓▓  | ▓▓ \▓▓\  ▓▓| ▓▓ ▓▓ | ▓▓ | ▓▓ ]],
    [[ /  ▓▓___       | ▓▓ \▓▓▓▓ ▓▓▓▓▓▓▓▓ ▓▓__/ ▓▓  \▓▓ ▓▓ | ▓▓ ▓▓ | ▓▓ | ▓▓ ]],
    [[|  ▓▓    \      | ▓▓  \▓▓▓\▓▓     \\▓▓    ▓▓   \▓▓▓  | ▓▓ ▓▓ | ▓▓ | ▓▓ ]],
    [[ \▓▓▓▓▓▓▓▓       \▓▓   \▓▓ \▓▓▓▓▓▓▓ \▓▓▓▓▓▓     \▓    \▓▓\▓▓  \▓▓  \▓▓ ]],
    '',
  }


  vim.g.dashboard_custom_section = {
      a = {
        description = { "  Find File          " },
        command = "Telescope find_files",
      },
      b = {
        description = { "  New File           " },
        command = ":ene!",
      },
      c = {
        description = { "  Recent Projects    " },
        command = "Telescope projects",
      },
      d = {
        description = { "  Recently Used Files" },
        command = "Telescope oldfiles",
      },
      e = {
        description = { "  Find Word          " },
        command = "Telescope live_grep",
      },
  }
  vim.g.dashboard_session_directory = utils.join_paths(utils.path.get_cache_dir(), 'sessions')
end

local modules = {
  setup = setup,
  show = show,
}

return modules
