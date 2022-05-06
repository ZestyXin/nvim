local all_keybingdings = {

}

local insert_keybindings = {

}

local normal_keybindings = {
  -- base
  ["<m-H>"] = "<C-w>h",
  ["<m-J>"] = "<C-w>j",
  ["<m-K>"] = "<C-w>k",
  ["<m-L>"] = "<C-w>l",
  ["[b"] = { "<cmd>bp<CR>", { noremap = true, silent = true} },
  ["]b"] = { "<cmd>bn<CR>", { noremap = true, silent = true} },
  -- tree
  ["<a-->"] = { "<cmd>lua require('config.telescope').cmds.file_browser()<CR>", { noremap = true } },
  -- telescope
  ["<a-f>"] = { "<cmd>lua require('config.telescope').cmds.find_files()<CR>", { noremap = true} },
  ["<a-s>"] = { "<cmd>lua require('config.telescope').cmds.live_grep()<CR>", { noremap = true} },
  ["<a-S>"] = { "<cmd>lua require('config.telescope').cmds.grep_string()<CR>", { noremap = true} },
  ["<a-b>"] = { "<cmd>lua require('config.telescope').cmds.buffers()<CR>", { noremap = true} },
  ["<a-p>"] = { "<cmd>lua require('config.telescope').cmds.lsp_workspace_symbols()<CR>", { noremap = true} },
  ["<a-d>"] = { "<cmd>lua require('config.telescope').cmds.diagnostics()<CR>", { noremap = true} },
  ["gd"] = { "<cmd>lua require('config.telescope').cmds.lsp_definitions()<CR>", { noremap = true} },
  ["gt"] = { "<cmd>lua require('config.telescope').cmds.lsp_type_definitions()<CR>", { noremap = true} },
  ["gr"] = { "<cmd>lua require('config.telescope').cmds.lsp_references()<CR>", { noremap = true} },
  -- gitsigns
  ["<leader>hS"] = { "<cmd>lua require('config.gitsigns').cmds.stage_buffer()<CR>", { noremap = true} },
  ["<leader>hs"] = { "<cmd>lua require('config.gitsigns').cmds.stage_hunk()<CR>", { noremap = true} },
  ["<leader>hR"] = { "<cmd>lua require('config.gitsigns').cmds.reset_buffer()<CR>", { noremap = true} },
  ["<leader>hr"] = { "<cmd>lua require('config.gitsigns').cmds.reset_hunk()<CR>", { noremap = true} },
  ["<leader>hp"] = { "<cmd>lua require('config.gitsigns').cmds.preview_hunk()<CR>", { noremap = true} },
  ["]h"] = { "<cmd>lua require('config.gitsigns').cmds.next_hunk()<CR>", { noremap = true} },
  ["[h"] = { "<cmd>lua require('config.gitsigns').cmds.prev_hunk()<CR>", { noremap = true} },
  -- dashboard
  -- [";"] = { "<cmd>lua require('config.dashboard').show()<CR>", { noremap = true} },
  -- hop
  ["<leader>w"] = { "<cmd>lua require('config.hopmove').cmds.hint_words()<CR>", { noremap = true} },
  ["<leader>l"] = { "<cmd>lua require('config.hopmove').cmds.hint_lines()<CR>", { noremap = true} },
  -- LSP
  ["<leader>r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true} },
  ["<leader>f"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true} },
  ["[d"] = { "<cmd>lua vim.diagnostics.goto_prev()<CR>", { noremap = true, silent = true} },
  ["]d"] = { "<cmd>lua vim.diagnostics.goto_next()<CR>", { noremap = true, silent = true} },
  ["<a-o>"] = {"<cmd>ClangdSwitchSourceHeader<cr>", { noremap = true, silent = true } }
}

local term_keybindings = {
  ["<m-q>"] = [[<c-\><c-n>]],
}

local visual_keybindings = {
  ["<leader>hs"] = { "<cmd>lua require('config.gitsigns').cmds.stage_hunk()<CR>", { noremap = true} },
  ["<leader>hr"] = { "<cmd>lua require('config.gitsigns').cmds.reset_hunk()<CR>", { noremap = true} },
}

local visual_block_keybindings = {
  ["<leader>hs"] = { "<cmd>lua require('config.gitsigns').cmds.stage_hunk()<CR>", { noremap = true} },
  ["<leader>hr"] = { "<cmd>lua require('config.gitsigns').cmds.reset_hunk()<CR>", { noremap = true} },
}

local command_keybindings = {

}

local keybindings = {
  all_mode          = all_keybingdings,
  insert_mode       = insert_keybindings,
  normal_mode       = normal_keybindings,
  term_mode         = term_keybindings,
  visual_mode       = visual_keybindings,
  visual_block_mode = visual_block_keybindings,
  command_mode      = command_keybindings,
}

return keybindings
