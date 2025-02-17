return {
  {
    "fatih/vim-go",
    lazy = true,
    config = function()
      vim.cmd.GoInstallBinaries()
    end,
  },
  { "benmills/vim-golang-alternate" },

  { "tpope/vim-rails" },
  { "vim-ruby/vim-ruby" },
  { "leafgarland/typescript-vim" },
  { "peitalin/vim-jsx-typescript" },
  { "OXY2DEV/markview.nvim" },
}
