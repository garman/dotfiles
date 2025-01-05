require("plugins.packer")
require("plugins.colorscheme")

if not vim.env.HEADLESS_NEOVIM then
  require("settings")
  require("keymaps")
  require("plugins.alpha-nvim")
  require("plugins.cmp")
  require("plugins.lualine")
  require("plugins.gitsigns")
  require("plugins.fzf-lua")
  require("plugins.blink")
end
