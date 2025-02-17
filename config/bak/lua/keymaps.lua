local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

vim.g.mapleader = ","

-- Clear search highlights
map("n", "<leader>nh", "<cmd>nohl<CR>", default_opts)

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", default_opts) -- increment
map("n", "<leader>-", "<C-x>", default_opts) -- decrement

-- QoL improvements
map("i", "jk", "<Esc>", { noremap = true })
map("n", ";", ":", default_opts)

-- window splits
map("n", "<leader>sv", "<C-w>v", default_opts) -- split vertically
map("n", "<leader>sh", "<C-w>s", default_opts) -- split horizontally
map("n", "<leader>se", "<C-w>=", default_opts) -- make splits equal size
map("n", "<leader>sx", "<cmd>close<CR>", default_opts) -- close current split

-- tab management
map("n", "<leader>to", "<cmd>tabnew<CR>", default_opts)
map("n", "<leader>tx", "<cmd>tabclose<CR>", default_opts)
map("n", "<leader>tn", "<cmd>tabnext<CR>", default_opts)
map("n", "<leader>tp", "<cmd>tabprevious<CR>", default_opts)
map("n", "<leader>tf", "<cmd>tabnew %<CR>", default_opts) -- open current buffer in new tab

-- Ruby/rails related mappings
cmd("let test#ruby#rspec#executable = 'script/test'")
cmd("let test#strategy = 'floaterm'")
map("n", "<leader>t", "<cmd>TestNearest<CR>", default_opts)
map("n", "<leader>T", "<cmd>TestFile<CR>", default_opts)

-- Golang
map("n", "<leader>gt", ":GoTest<CR>", default_opts)
map("n", "<leader>gl", ":GoLint<CR>", default_opts)
