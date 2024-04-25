require("plugins.packer")

if not vim.env.HEADLESS_NEOVIM then
  require("settings")
  require("keymaps")
  require("plugins.alpha-nvim")
  require("plugins.lualine")
  require("plugins.gitsigns")
  require("plugins.fzf-lua")
end
