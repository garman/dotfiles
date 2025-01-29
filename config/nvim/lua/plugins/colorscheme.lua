--local bg = "#011628"
--local bg_dark = "#011423"
--
--require("tokyonight").setup {
--  style = "storm",
--  styles = {
--    keywords = { italic = false},
--    functions = { italic = false},
--    questions = { italic = false },
--  }
--}

--require("rose-pine").setup({
--  variant = "moon",
--  disable_italics = true,
--  highlight_groups = {
--    Comment = { italic = true }
--  }
--})

require("catppuccin").setup {
  flavor = "mocha",
  styles = {
    comments = { "italic" },
    conditionals = {},
  }
}
