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
    --bigfile = { enabled = true },
    --input = { enabled = true },
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
    { "<leader>r", function() Snacks.explorer.reveal() end, desc = "File Explorer with File" },
  },
}
