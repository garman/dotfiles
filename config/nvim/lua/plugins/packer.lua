local present, packer = pcall(require, "packer")

if not present then
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd "packadd packer.nvim"
  end

  packer = require("packer")
end

return packer.startup(function()
  use "goolord/alpha-nvim"
  use { "ibhagwan/fzf-lua",
    requires = { "nvim-tree/nvim-web-devicons" }
  }
  use { "junegunn/fzf", run = "./install --bin" }
  use {
  'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use "github/copilot.vim"
  use "projekt0n/github-nvim-theme"
  use "pauchiner/pastelnight.nvim"
  use "tpope/vim-commentary"
  use "tpope/vim-rails"
  use "tpope/vim-surround"
  use "tpope/vim-endwise"
  use 'voldikss/vim-floaterm'
  use 'vim-ruby/vim-ruby'
  use "lewis6991/gitsigns.nvim"
  use "dense-analysis/ale"
  use "preservim/nerdtree"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/nvim-cmp"
  use "nvim-treesitter/nvim-treesitter"
  use "tpope/vim-rhubarb"
  use "vim-test/vim-test"
  use "wbthomason/packer.nvim"
  use "f-person/git-blame.nvim"
  use "fatih/vim-go"
end)
