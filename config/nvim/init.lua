local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    import = "plugins",
  },
  --  {
  --  "L3MON4D3/LuaSnip",
  --  -- follow latest release.
  --  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  --  -- install jsregexp (optional!).
  --  build = "make install_jsregexp"
  --},
  -- 'saadparwaiz1/cmp_luasnip',
  -- "rafamadriz/friendly-snippets",
  -- LSP
  -- 'neovim/nvim-lspconfig',
  -- 'hrsh7th/cmp-nvim-lsp',
  -- "williamboman/mason.nvim",
  -- "williamboman/mason-lspconfig.nvim",
  -- 'gfanto/fzf-lsp.nvim',
  colorscheme = { "catppuccin-macchiato" },
  checker = { enabled = true },
})
require("settings")
require("keymaps")
