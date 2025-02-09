local function footer()
  datetime = os.date("%Y/%m/%d %I:%M %p", os.time())
  return datetime
end

local footer_opts = {
  type = "text",
  val = footer,
  opts = { position = "center", hl = "number" }
}

local turbo_time_splash = {
  type = "text",
  val = {
    "                                                        ",
    " ▄▄▄▄▄▄• ▄▌▄▄▄  ▄▄▄▄·            ▄▄▄▄▄▪  • ▌ ▄ ·. ▄▄▄ . ",
    " •██  █▪██▌▀▄ █·▐█ ▀█▪▪          •██  ██ ·██ ▐███▪▀▄.▀· ",
    "  ▐█.▪█▌▐█▌▐▀▀▄ ▐█▀▀█▄ ▄█▀▄       ▐█.▪▐█·▐█ ▌▐▌▐█·▐▀▀▪▄ ",
    "  ▐█▌·▐█▄█▌▐█•█▌██▄▪▐█▐█▌.▐▌      ▐█▌·▐█▌██ ██▌▐█▌▐█▄▄▌ ",
    "  ▀▀▀  ▀▀▀ .▀  ▀·▀▀▀▀  ▀█▄▀▪      ▀▀▀ ▀▀▀▀▀  █▪▀▀▀ ▀▀▀  ",
    "                                                        ",
    "             Has that ever happened to you?             ",
  },
  opts = { position = "center", hl = "Type" },
}

local fifty_five_splash = {
  type = "text",
  val = {
    "                                             ",
    " ·▄▄▄▪  ·▄▄▄▄▄▄▄▄ ▄· ▄▌    ·▄▄▄▪   ▌ ▐·▄▄▄ . ",
    " ▐▄▄·██ ▐▄▄·•██  ▐█▪██▌    ▐▄▄·██ ▪█·█▌▀▄.▀· ",
    " ██▪ ▐█·██▪  ▐█.▪▐█▌▐█▪    ██▪ ▐█·▐█▐█•▐▀▀▪▄ ",
    " ██▌.▐█▌██▌. ▐█▌· ▐█▀·.    ██▌.▐█▌ ███ ▐█▄▄▌ ",
    " ▀▀▀ ▀▀▀▀▀▀  ▀▀▀   ▀ •     ▀▀▀ ▀▀▀. ▀   ▀▀▀  ",
    "                                             ",
    "             I'm doing a thing!              ",
  },
  opts = { position = "center", hl = "Type" },
}

local nachos_splash = {
  type = "text",
  val = {
    "                                   ",
    "  ▐ ▄  ▄▄▄·  ▄▄·  ▄ .▄      .▄▄ ·  ",
    " •█▌▐█▐█ ▀█ ▐█ ▌▪██▪▐█▪     ▐█ ▀.  ",
    " ▐█▐▐▌▄█▀▀█ ██ ▄▄██▀▐█ ▄█▀▄ ▄▀▀▀█▄ ",
    " ██▐█▌▐█ ▪▐▌▐███▌██▌▐▀▐█▌.▐▌▐█▄▪▐█ ",
    " ▀▀ █▪ ▀  ▀ ·▀▀▀ ▀▀▀ · ▀█▄▀▪ ▀▀▀▀  ",
    "                                   ",
    "    What are you talking about?    ",
  },
  opts = { position = "center", hl = "Type" },
}


local random_header = function()
  dashboard_header_options = {
    turbo_time_splash,
    fifty_five_splash,
    nachos_splash,
  }
  math.randomseed(os.clock()*100000000000)
  math.random(); math.random(); math.random()
  header_choice = math.random(#dashboard_header_options)
  return dashboard_header_options[header_choice]
end

local function button(btn, txt, keybind)
  local sc = btn:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    shortcut = sc,
    cursor = 0,
    width = 50,
    align_shortcut = "right",
    hl_shortcut = "Keyword",
  }

  if keybind then
    opts.keymap = { "n", sc, keybind, { noremap = true, silent = true, nowait = true } }
  end

  local function on_press()
    local key = vim.api.nvim_replace_termcodes(sc .. "<Ignore>", true, false, true)
    vim.api.nvim_feedkeys(key, "t", false)
  end

  return {
    type = "button",
    val = txt,
    on_press = on_press,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    button("e", "New file", ":ene <BAR> startinsert<CR>"),
    button("f", "Find file", ":FzfLua files<CR>"),
    button("r", "Recent files", ":FzfLua oldfiles<CR>"),
    button("s", "Settings", ":e $MYVIMRC<CR>"),
    button("u", "Update plugins", ":PackerUpdate<CR>"),
    button("q", "Quit", ":qa<CR>"),
  },
  opts = {
    spacing = 0,
  },
}


return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins

    config = function()
      require("catppuccin").setup {
        background = {
          dark = "macchiato"
        },
        styles = {
          comments = { "italic" },
          conditionals = {},
        }
      }
    end
  },

  {
    'goolord/alpha-nvim',
    lazy = vim.fn.argc(-1) ~= 0,
    priority = 1000,
    opts = {
      layout = {
        { type = "padding", val = 2 },
        random_header(),
        { type = "padding", val = 2 },
        buttons,
        { type = "padding", val = 1 },
        footer_opts,
      },
      opts = {
        margin = 50,
      },
    }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = "wombat",
    }
  },
}
