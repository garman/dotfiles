local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

map("i", "jk", "<Esc>", {noremap = true})
map("n", ";;", "<cmd>lua require('fzf-lua').files()<CR>", default_opts)

cmd "let g:tmux_navigator_no_mappings = 1"
map("n", "<C-h>", "<C-W><C-H>", default_opts)
map("n", "<C-j>", "<C-W><C-J>", default_opts)
map("n", "<C-k>", "<C-W><C-K>", default_opts)
map("n", "<C-l>", "<C-W><C-L>", default_opts)
