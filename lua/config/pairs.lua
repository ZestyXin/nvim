local function setup()
  local autopairs = require "nvim-autopairs"
  local Rule = require "nvim-autopairs.rule"
  local cond = require "nvim-autopairs.conds"

  autopairs.setup {
    map_bs = true,
    check_ts = true,
    ts_config = {
      lua = { "string" },
      javascript = { "template_string" },
      java = false,
    },
  }

  autopairs.add_rule(Rule("$$", "$$", "tex"))
  autopairs.add_rules {
    Rule("$", "$", { "tex", "latex" }) -- don't add a pair if the next character is %
      :with_pair(cond.not_after_regex_check "%%") -- don't add a pair if  the previous character is xxx
      :with_pair(cond.not_before_regex_check("xxx", 3)) -- don't move right when repeat character
      :with_move(cond.none()) -- don't delete if the next character is xx
      :with_del(cond.not_after_regex_check "xx") -- disable  add newline when press <cr>
      :with_cr(cond.none()),
  }
  autopairs.add_rules {
    Rule("$$", "$$", "tex"):with_pair(function(opts)
      print(vim.inspect(opts))
      if opts.line == "aa $$" then
        -- don't add pair on that line
        return false
      end
    end),
  }

  local cmp_status_ok, cmp = pcall(require, "cmp")
  if cmp_status_ok then
    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local map_char = {
      all = "(",
      tex = "{",
    }
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = map_char })
  end

  local ts_conds = require "nvim-autopairs.ts-conds"

  -- TODO: can these rules be safely added from "config.lua" ?
  -- press % => %% is only inside comment or string
  autopairs.add_rules {
    Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
    Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
  }
end

local modules = {
  setup = setup,
}

return modules
