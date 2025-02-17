return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins

    config = function()
      require("catppuccin").setup {
        background = {
          dark = "macchiato"
        },
        styles = {
          comments = { "italic" },
          conditionals = {},
        }
      }
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = "wombat",
    }
  },
}
