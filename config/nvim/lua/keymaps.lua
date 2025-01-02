local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

vim.g.mapleader = " "

-- Clear search highlights
map("n", "<leader>nh", "<cmd>nohl<CR>", default_opts)

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", default_opts) -- increment
map("n", "<leader>-", "<C-x>", default_opts) -- decrement

-- QoL improvements
map("i", "jk", "<Esc>", { noremap = true })
map("n", ";", ":", default_opts)

-- File explorer
map("n", "<leader>ee", "<cmd>NERDTreeToggle<CR>", default_opts)
map("n", "<leader>ef", "<cmd>NERDTreeFind<CR>", default_opts)
map("n", "<leader>er", "<cmd>NERDTreeToggle<CR>", default_opts)

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

-- searching for words across files using fzf-lua
map("n", "fd", "<cmd>FzfLua grep<CR>", default_opts)
map("n", "fc", "<cmd>FzfLua grep_cWORD<CR>", default_opts)

-- git related mappings using fzf-lua
map("n", "gs", "<cmd>FzfLua git_status<CR>", default_opts)
map("n", "gc", "<cmd>FzfLua git_commits<CR>", default_opts)
map("n", "gb", "<cmd>FzfLua git_bcommits<CR>", default_opts)

-- file related mappings using fzf-lua
map("n", "ff", "<cmd>FzfLua files<CR>", default_opts)
map("n", "fr", "<cmd>FzfLua oldfiles<CR>", default_opts)

-- Git blaming things
map("n", "gibl", "<cmd>Gitsigns blame_line<CR>", default_opts)
map("n", "gbocu", "<cmd>GitBlameOpenCommitURL<CR>", default_opts)
map("n", "gbocf", "<cmd>GitBlameOpenFileURL<CR>", default_opts)

-- Ruby/rails related mappings
cmd "let test#ruby#rspec#executable = 'script/test'"
cmd "let test#strategy = 'floaterm'"
map("n", "<leader>t", "<cmd>TestNearest<CR>", default_opts)
map("n", "<leader>T", "<cmd>TestFile<CR>", default_opts)

-- Golang
map("n", "<leader>gt", "<Plug>(go-test)", default_opts)
map("n", "<leader>gl", "<Plug>(go-lint)", default_opts)
