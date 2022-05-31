local lsp_config = {
  bashls = {
  },
  clangd = {
    cmd = {
      "clangd",
      "--header-insertion=never",
    }
  },
  cmake = {
  },
  dartls = {
    cmd = {
      "dart",
      "/home/zesty/.local/share/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot",
      "--lsp"
    },
  },
  gopls = {
  },
  html = {
  },
  jsonls = {
      schemas = require('schemastore').json.schemas(),
  },
  pyright = {
  },
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  },
  tsserver = {
  },
}

local function set_sign()
  vim.fn.sign_define('DiagnosticSignError', {
    texthl = 'DiagnosticSignError',
    text = '',
  })
  vim.fn.sign_define('DiagnosticSignWarn', {
    texthl = 'DiagnosticSignWarn',
    text = '',
  })
  vim.fn.sign_define('DiagnosticSignHint', {
    texthl = 'DiagnosticSignHint',
    text = '',
  })
  vim.fn.sign_define('DiagnosticSignInfo', {
    texthl = 'DiagnosticSignInfo',
    text = '',
  })
end

local function setup()
  set_sign()
  local nvim_lsp = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  for name, config in pairs(lsp_config) do
    config.capabilities = capabilities
    nvim_lsp[name].setup(config)
  end
end

local modules = {
  setup = setup,
}

return modules
