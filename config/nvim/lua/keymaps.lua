local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

map("i", "jk", "<Esc>", {noremap = true})
map("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", default_opts)

cmd "let g:tmux_navigator_no_mappings = 1"
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", default_opts)
map("n", "<C-j>", ":TmuxNavigateDown<CR>", default_opts)
map("n", "<C-k>", ":TmuxNavigateUp<CR>", default_opts)
map("n", "<C-l>", ":TmuxNavigateRight<CR>", default_opts)
map("n", "<C-\\>", ":TmuxNavigatePrevious<CR>", default_opts)
