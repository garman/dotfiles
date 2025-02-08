return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {}
  },
  { "junegunn/fzf" },
  { "christoomey/vim-tmux-navigator" },
  { "preservim/nerdtree" },
  { "f-person/git-blame.nvim" },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({ })
    end,
  },
  {
    'dense-analysis/ale',
    config = function()
        -- Configuration goes here.
        local g = vim.g

        g.ale_ruby_rubocop_auto_correct_all = 0

        g.ale_linters = {
            ruby = {'rubocop', 'ruby'},
            lua = {'lua_language_server'}
        }
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "lua", "vim", "vimdoc", "ruby", "go", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  { "tpope/vim-commentary" },
  { "tpope/vim-surround" },
  { "tpope/vim-endwise" },
  { 'voldikss/vim-floaterm' },
  { "vim-test/vim-test" },
}
