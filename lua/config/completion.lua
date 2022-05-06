local get_plug = require('utils').get_plug

local function setup()
  local cmp = get_plug('cmp')
  if not cmp then
    return
  end

  local snip = get_plug('luasnip')
  if not snip then
    return
  end

  local icons = {
    Class = " ",
    Color = " ",
    Constant = "ﲀ ",
    Constructor = " ",
    Enum = "練",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = "",
    Folder = " ",
    Function = " ",
    Interface = "ﰮ ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Operator = "",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = "塞",
    Value = " ",
    Variable = " ",
  }

  local source_names = {
    nvim_lsp = "(LSP)",
    emoji = "(Emoji)",
    path = "(Path)",
    calc = "(Calc)",
    vsnip = "(Snippet)",
    luasnip = "(Snippet)",
    buffer = "(Buffer)",
  }

  local mappings = {
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<C-d>"] = cmp.mapping(function (fallback)
      if snip.jumpable() then
        snip.jump(1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<C-u>"] = cmp.mapping(function (fallback)
      if snip.jumpable(-1) then
        snip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        })
      elseif snip.expandable() then
        snip.expand()
      else
          fallback()
      end
    end),
  }

  local opts = {
    mapping = mappings,
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    completion = {
      ---@usage The minimum length of a word to complete on.
      keyword_length = 1,
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = icons[vim_item.kind]
        vim_item.menu = source_names[entry.source.name]
        return vim_item
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "luasnip" },
      { name = "nvim_lua" },
      { name = "buffer" },
      { name = "calc" },
      { name = "emoji" },
    },
    experimental = {
      ghost_text = true,
      native_menu = false,
    },
  }
  require("luasnip/loaders/from_vscode").lazy_load()
  require("luasnip").filetype_extend("dart", {"flutter"})
  require('cmp').setup(opts)
end

local modules = {
  setup = setup,
}

return modules
