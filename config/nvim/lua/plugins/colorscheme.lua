return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      background = {
        dark = "macchiato",
      },
      styles = {
        comments = { "italic" },
        conditionals = {},
      },
      integrations = {
        blink_cmp = true,
        cmp = true,
        treesitter = true,
        fzf = true,
        snacks = true,
      },
    },
    require("catppuccin").setup(opts),
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      theme = "wombat",
    },
  },
}
