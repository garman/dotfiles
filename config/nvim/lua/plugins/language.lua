return {
  {
    "fatih/vim-go",
    config = function()
      vim.cmd.GoInstallBinaries()
    end,
  },
  { "benmills/vim-golang-alternate" },
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "goimports", "gopls", "golangci-lint" } },
  },
  { "tpope/vim-rails" },
  { "vim-ruby/vim-ruby" },
  { "leafgarland/typescript-vim" },
  { "peitalin/vim-jsx-typescript" },
  { "OXY2DEV/markview.nvim" },
}
