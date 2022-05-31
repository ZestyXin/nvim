local function setup()
  vim.g.gutentags_project_root = {
    '.root',
    '.svn',
    '.git',
    '.hg',
    '.project',
    'compile_commands.json',
    'compile_flags.txt',
  }

  vim.g.gutentags_ctags_tagfile = '.tags'
  vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/tags')
  if not vim.fn.isdirectory(vim.g.gutentags_cache_dir) then
    vim.cmd [[silent! call mkdir(s:vim_tags, 'p')]]
  end

  vim.g.gutentags_ctags_extra_args = {
    '--fields=+niazS',
    '--extra=+q',
    '--c++-kinds=+px',
    '--c-kinds=+px',
  }
end

local modules = {
  setup = setup,
}

return modules
