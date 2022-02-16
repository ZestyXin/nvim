local function setup()
  local opts = {
    marker_padding = true,
    comment_empty = false,
    create_mappings = true,
    line_mapping = [[<leader>/]],
    operator_mapping = [[<leader>/]],
    hook = function ()
      require("ts_context_commentstring.internal").update_commentstring()
    end
  }
  require("nvim_comment").setup(opts)
  vim.api.nvim_set_keymap(
    "n",
    '<leader>/',
    "<cmd>CommentToggle<CR>",
    { noremap = true, silent = true }
  )
end

local modules = {
  setup = setup,
}

return modules
