return {
  {
    "fatih/vim-go",
    config = function()
      vim.cmd.GoInstallBinaries()
    end,
  },
  { "benmills/vim-golang-alternate" }
}
