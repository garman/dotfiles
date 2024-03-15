require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'wombat',
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1, 
      }
    }
  }
}
