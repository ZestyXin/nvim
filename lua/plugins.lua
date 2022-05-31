return {
  -- Base
  { 'wbthomason/packer.nvim' },
  {
   'rcarriga/nvim-notify',
   config = function()
     require('config.notify').setup()
   end,
  },
  { 'nvim-lua/popup.nvim' },
  { 'nvim-lua/plenary.nvim' },

  -- Appearance
  {
    'navarasu/onedark.nvim',
    config = function ()
      require('config.onedark').setup()
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('config.treesitter').setup()
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('config.gitsigns').setup()
    end
  },
  {
    'glepnir/dashboard-nvim',
    event = 'BufWinEnter',
    config = function()
      require('config.dashboard').setup()
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('config.lualine').setup()
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('config.indent').setup()
    end,
  },

  -- LSP
  { 'b0o/schemastore.nvim' },
  {
    'neovim/nvim-lspconfig',
    config = function ()
      require('config.lsp').setup()
    end},
  { 'hrsh7th/cmp-nvim-lsp', },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/cmp-calc' },
  { 'hrsh7th/cmp-emoji' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'rafamadriz/friendly-snippets' },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('config.completion').setup()
    end,
  },

  -- Tools
  --{
  --  'kyazdani42/nvim-tree.lua',
  --  requires = {
  --    'kyazdani42/nvim-web-devicons',
  --  },
  --  config = function()
  --    require('config.tree').setup()
  --  end
  --},
  {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('config.telescope').setup()
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
  },
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('config.projects').setup()
    end,
    requires = {
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'phaazon/hop.nvim',
    branch = 'v1',
    config = function()
      require('config.hopmove').setup()
    end
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring', },
  {
    'terrortylor/nvim-comment',
    config = function()
      require('config.comment').setup()
    end
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('config.pairs').setup()
    end
  },
  {
    'abecodes/tabout.nvim',
    config = function()
      require('config.tabout').setup()
    end,
    wants = { 'nvim-treesitter' },
    after = { 'nvim-cmp' },
  },
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('config.terminal').setup()
    end,
  },
  {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('config.diff').setup()
    end,
  },
  {
    'ludovicchabant/vim-gutentags',
    config = function()
      require('config.tags').setup()
    end,
  },
  {
    'yamatsum/nvim-cursorline',
    config = function()
      require('config.cursor').setup()
    end,
  }
}
