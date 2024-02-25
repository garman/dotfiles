local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

map("n", "<leader><leader>", ":nohl<CR>", default_opts)

map("i", "jk", "<Esc>", {noremap = true})

map("n", "ff", "<cmd>lua require('fzf-lua').files()<CR>", default_opts)
map("n", "fr", "<cmd>lua require('fzf-lua').oldfiles()<CR>", default_opts)

map("n", "<C-h>", "<C-W><C-H>", default_opts)
map("n", "<C-j>", "<C-W><C-J>", default_opts)
map("n", "<C-k>", "<C-W><C-K>", default_opts)
map("n", "<C-l>", "<C-W><C-L>", default_opts)

map("n", "<leader>t", "<C-u>tabnew<CR>", default_opts)
map("n", "<C-t>", "<C-u>tabnew<CR>", default_opts)
map("n", "<Tab>", "<C-u>tabnext<CR>", default_opts)
map("n", "<S-Tab>", "<C-u>tabprevious<CR>", default_opts)
