return {
  { "junegunn/fzf" },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "junegunn/fzf",
    },
  },
  {
    "dense-analysis/ale",
    config = function()
      -- Configuration goes here.
      local g = vim.g

      g.ale_ruby_rubocop_auto_correct_all = 0

      g.ale_linters = {
        ruby = { "rubocop", "ruby" },
        lua = { "lua_language_server" },
      }
    end,
  },
  { "vim-test/vim-test" },
  { "tpope/vim-commentary" },
  { "tpope/vim-surround" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = false },
      ensure_installed = {
        "go",
        "ruby",
        "proto",
        "mermaid",
        "lua",
        "markdown",
        "markdown_inline",
        "diff",
        "html",
        "javascript",
        "query",
        "tsx",
        "typescript",
      },
    },
  },
}
