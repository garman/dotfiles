local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

map("n", "<leader><leader>", "<cmd>nohl<CR>", default_opts)

map("i", "jk", "<Esc>", { noremap = true })
map("n", ";", ":", default_opts)
map("n", "nt", "<cmd>NERDTreeToggle<CR>", default_opts)
map("n", "gibl", "<cmd>Gitsigns blame_line<CR>", default_opts)

-- window navigation
map("n", "<C-h>", "<C-W><C-H>", { noremap = true })
map("n", "<C-j>", "<C-W><C-J>", default_opts)
map("n", "<C-k>", "<C-W><C-K>", default_opts)
map("n", "<C-l>", "<C-W><C-L>", default_opts)

-- tab related mappings
map("n", "<leader>t", "<cmd>tabnew<CR>", default_opts)
map("n", "<C-t>", "<cmd>tabnew<CR>", default_opts)
map("n", "<Tab>", "<cmd>tabnext<CR>", default_opts)
map("n", "<S-Tab>", "<cmd>tabprevious<CR>", default_opts)

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

-- Ruby/rails related mappings
cmd "let test#ruby#rspec#executable = 'script/test'"
cmd "let test#strategy = 'floaterm'"
map("n", "<leader>t", "<cmd>TestNearest<CR>", default_opts)
map("n", "<leader>T", "<cmd>TestFile<CR>", default_opts)
