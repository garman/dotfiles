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
  --use "goolord/alpha-nvim"
  use "christoomey/vim-tmux-navigator"
 -- use { "ibhagwan/fzf-lua",
 --   requires = { "nvim-tree/nvim-web-devicons" }
 -- }
  use { "junegunn/fzf", run = "./install --bin" }
  --use {
  --'nvim-lualine/lualine.nvim',
  --  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  --}

  -- Colors
  --use { "catppuccin/nvim", as = "catppuccin" }
  -- use "folke/tokyonight.nvim"
--  use { "rose-pine/neovim", name = "rose-pine" }

  use "tpope/vim-commentary"
  use "tpope/vim-rails"
  use "tpope/vim-surround"
  use "tpope/vim-endwise"
  use 'voldikss/vim-floaterm'
  use 'vim-ruby/vim-ruby'
  use "lewis6991/gitsigns.nvim"
  use "dense-analysis/ale"
  use "leafgarland/typescript-vim"
  use "peitalin/vim-jsx-typescript"
  use "preservim/nerdtree"
  use "nvim-treesitter/nvim-treesitter"
  use "tpope/vim-rhubarb"
  use "vim-test/vim-test"
  use "wbthomason/packer.nvim"
  use "f-person/git-blame.nvim"
  use "OXY2DEV/markview.nvim"

  -- LSP and autocomplete
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use { 'hrsh7th/nvim-cmp',
    requires = { "L3MON4D3/LuaSnip" }
  }
  use { "Saghen/blink.cmp",
    tag = 'v0.9.0',
    requires = { 'rafamadriz/friendly-snippets' }
  }
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "zbirenbaum/copilot-cmp"
  use "zbirenbaum/copilot.lua"
  use "saadparwaiz1/cmp_luasnip"
  -- End LSP and autocomplete

  -- Golang
  use { "fatih/vim-go", run = "vim.cmd.GoInstallBinaries()" }
  use "benmills/vim-golang-alternate"
  -- End Golang

--  use { "CopilotC-Nvim/CopilotChat.nvim",
--    requires = { "github/copilot.vim" }, { "nvim-lua/plenary.nvim", branch = "master" }
--  }

  use {
      'KadoBOT/nvim-spotify',
      requires = 'nvim-telescope/telescope.nvim',
      config = function()
          local spotify = require'nvim-spotify'

          spotify.setup {
              -- default opts
              status = {
                  update_interval = 10000, -- the interval (ms) to check for what's currently playing
                  format = '%s %t by %a' -- spotify-tui --format argument
              }
          }
      end,
      run = 'make'
  }

end)
