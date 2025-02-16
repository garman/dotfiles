return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    picker = { enabled = true },
    animate = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    lazygit = { enabled = true },
    --input = { enabled = true },
    --bigfile = { enabled = true },
    --notifier = { enabled = true },
    --quickfile = { enabled = true },
    --scope = { enabled = true },
    --scroll = { enabled = true },
    --statuscolumn = { enabled = true },
    --words = { enabled = true },
  },
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git blame line" },
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Open in GitHub" },
    { "<leader>lg", function() Snacks.lazygit() end, desc = "Git UI" },
  },
}
