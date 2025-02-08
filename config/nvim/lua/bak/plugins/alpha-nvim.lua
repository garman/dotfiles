local dashboard = require "alpha.themes.dashboard"

local function footer()
  local datetime = os.date("%Y/%m/%d %I:%M %p", os.time() + 2 * 60 * 60 )
  return datetime
end

local codespaces_bloody = {
  "                                                                                        ",
  "  ▄████▄   ▒█████  ▓█████▄ ▓█████   ██████  ██▓███   ▄▄▄       ▄████▄  ▓█████   ██████  ",
  " ▒██▀ ▀█  ▒██▒  ██▒▒██▀ ██▌▓█   ▀ ▒██    ▒ ▓██░  ██▒▒████▄    ▒██▀ ▀█  ▓█   ▀ ▒██    ▒  ",
  " ▒▓█    ▄ ▒██░  ██▒░██   █▌▒███   ░ ▓██▄   ▓██░ ██▓▒▒██  ▀█▄  ▒▓█    ▄ ▒███   ░ ▓██▄    ",
  " ▒▓▓▄ ▄██▒▒██   ██░░▓█▄   ▌▒▓█  ▄   ▒   ██▒▒██▄█▓▒ ▒░██▄▄▄▄██ ▒▓▓▄ ▄██▒▒▓█  ▄   ▒   ██▒ ",
  " ▒ ▓███▀ ░░ ████▓▒░░▒████▓ ░▒████▒▒██████▒▒▒██▒ ░  ░ ▓█   ▓██▒▒ ▓███▀ ░░▒████▒▒██████▒▒ ",
  " ░ ░▒ ▒  ░░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░▒ ▒▓▒ ▒ ░▒▓▒░ ░  ░ ▒▒   ▓▒█░░ ░▒ ▒  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░ ",
  "   ░  ▒     ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░░ ░▒  ░ ░░▒ ░       ▒   ▒▒ ░  ░  ▒    ░ ░  ░░ ░▒  ░ ░ ",
  " ░        ░ ░ ░ ▒   ░ ░  ░    ░   ░  ░  ░  ░░         ░   ▒   ░           ░   ░  ░  ░   ",
  " ░ ░          ░ ░     ░       ░  ░      ░                 ░  ░░ ░         ░  ░      ░   ",
  " ░                  ░                                         ░                         ",
  "                                                                                        ",
  "             You can checkout any time you like, but you can never leave...             ",
}

local garman_melting = {
"							     ",
"   ▄████  ▄▄▄      ██▀███   ███▄ ▄███▓ ▄▄▄      ███▄    █   ",
" ▒ ██▒ ▀█▒▒████▄   ▓██ ▒ ██▒▓██▒▀█▀ ██▒▒████▄    ██ ▀█   █  ",
" ░▒██░▄▄▄░▒██  ▀█▄ ▓██ ░▄█ ▒▓██    ▓██░▒██  ▀█▄ ▓██  ▀█ ██▒ ",
" ░░▓█  ██▓░██▄▄▄▄██▒██▀▀█▄  ▒██    ▒██ ░██▄▄▄▄██▓██▒  ▐▌██▒ ",
" ░▒▓███▀▒░▒▓█   ▓██░██▓ ▒██▒▒██▒   ░██▒▒▓█   ▓██▒██░   ▓██░ ",
"  ░▒   ▒  ░▒▒   ▓▒█░ ▒▓ ░▒▓░░ ▒░   ░  ░░▒▒   ▓▒█░ ▒░   ▒ ▒  ",
"   ░   ░  ░ ░   ▒▒   ░▒ ░ ▒ ░  ░      ░░ ░   ▒▒ ░ ░░   ░ ▒░ ",
" ░ ░   ░ ░  ░   ▒    ░░   ░ ░      ░     ░   ▒     ░   ░ ░  ",
"       ░        ░     ░            ░         ░           ░  ",
}

local garman_ghost = {
"   								   ",
"   ▄▄█▀▀▀█▄█                                                      ",
" ▄██▀     ▀█                                                      ",
" ██▀       ▀ ▄█▀██▄ ▀███▄███▀████████▄█████▄  ▄█▀██▄ ▀████████▄   ",
" █▓         ██   ██   ██▀ ▀▀  ██    ██    ██ ██   ██   ██    ██   ",
" █▓▄    ▀████▄███▓█   █▓      ▓█    ██    ██  ▄███▓█   █▓    ██   ",
" ▀▓█▄     ███▓   ▓█   █▓      ▓█    ▓█    ██ █▓   ▓█   █▓    ▓█   ",
" ▓▓▓    ▀▓█▓▓▓▓▓▓▒▓   ▓▓      ▓▓    ▓▓    ▓▓  ▓▓▓▓▒▓   ▓▓    ▓▓   ",
" ▀▒▓▓     ▓▓▓▓   ▒▓   ▓▒      ▒▓    ▒▓    ▓▓ ▓▓   ▒▓   ▓▓    ▓▓   ",
"   ▒▒▒ ▒ ▒▒ ▒▓▒ ▒ ▓▒▒ ▒▒▒   ▒ ▒▓▒  ▒▒▒   ▒▒▓▒▒▓▒ ▒ ▓▒▒ ▒▒▒  ▒▓▒ ▒ ",
"                                                                  ",
}

local garman_splash = {
"                                       ",
"  ▄▄ •  ▄▄▄· ▄▄▄  • ▌ ▄ ·.  ▄▄▄·  ▐ ▄  ",
" ▐█ ▀ ▪▐█ ▀█ ▀▄ █··██ ▐███▪▐█ ▀█ •█▌▐█ ",
" ▄█ ▀█▄▄█▀▀█ ▐▀▀▄ ▐█ ▌▐▌▐█·▄█▀▀█ ▐█▐▐▌ ",
" ▐█▄▪▐█▐█▪ ▐▌▐█•█▌██ ██▌▐█▌▐█▪ ▐▌██▐█▌ ",
" ·▀▀▀▀  ▀  ▀ .▀  ▀▀▀  █▪▀▀▀ ▀  ▀ ▀▀ █▪ ",
"                                       ",
}

local turbo_time_splash = {
"                                                        ",
" ▄▄▄▄▄▄• ▄▌▄▄▄  ▄▄▄▄·            ▄▄▄▄▄▪  • ▌ ▄ ·. ▄▄▄ . ",
" •██  █▪██▌▀▄ █·▐█ ▀█▪▪          •██  ██ ·██ ▐███▪▀▄.▀· ",
"  ▐█.▪█▌▐█▌▐▀▀▄ ▐█▀▀█▄ ▄█▀▄       ▐█.▪▐█·▐█ ▌▐▌▐█·▐▀▀▪▄ ",
"  ▐█▌·▐█▄█▌▐█•█▌██▄▪▐█▐█▌.▐▌      ▐█▌·▐█▌██ ██▌▐█▌▐█▄▄▌ ",
"  ▀▀▀  ▀▀▀ .▀  ▀·▀▀▀▀  ▀█▄▀▪      ▀▀▀ ▀▀▀▀▀  █▪▀▀▀ ▀▀▀  ",
"                                                        ",
"             Has that ever happened to you?             ",
}

local fifty_five_splash = {
"                                             ",
" ·▄▄▄▪  ·▄▄▄▄▄▄▄▄ ▄· ▄▌    ·▄▄▄▪   ▌ ▐·▄▄▄ . ",
" ▐▄▄·██ ▐▄▄·•██  ▐█▪██▌    ▐▄▄·██ ▪█·█▌▀▄.▀· ",
" ██▪ ▐█·██▪  ▐█.▪▐█▌▐█▪    ██▪ ▐█·▐█▐█•▐▀▀▪▄ ",
" ██▌.▐█▌██▌. ▐█▌· ▐█▀·.    ██▌.▐█▌ ███ ▐█▄▄▌ ",
" ▀▀▀ ▀▀▀▀▀▀  ▀▀▀   ▀ •     ▀▀▀ ▀▀▀. ▀   ▀▀▀  ",
"                                             ",
"             I'm doing a thing!              ",
}

local nachos_splash = {
"                                   ",
"  ▐ ▄  ▄▄▄·  ▄▄·  ▄ .▄      .▄▄ ·  ",
" •█▌▐█▐█ ▀█ ▐█ ▌▪██▪▐█▪     ▐█ ▀.  ",
" ▐█▐▐▌▄█▀▀█ ██ ▄▄██▀▐█ ▄█▀▄ ▄▀▀▀█▄ ",
" ██▐█▌▐█ ▪▐▌▐███▌██▌▐▀▐█▌.▐▌▐█▄▪▐█ ",
" ▀▀ █▪ ▀  ▀ ·▀▀▀ ▀▀▀ · ▀█▄▀▪ ▀▀▀▀  ",
"                                   ",
"    What are you talking about?    "
}

local dashboard_header_options = {
  turbo_time_splash,
  fifty_five_splash,
  nachos_splash,
}
math.randomseed(os.clock()*100000000000)
math.random(); math.random(); math.random()
local header_choice = math.random(#dashboard_header_options)

dashboard.section.header.val = dashboard_header_options[header_choice]

dashboard.section.buttons.val = {
  dashboard.button("e", "New file", ":ene <BAR> startinsert<CR>"),
  dashboard.button("f", "Find file", ":FzfLua files<CR>"),
  dashboard.button("r", "Recent files", ":FzfLua oldfiles<CR>"),
  dashboard.button("s", "Settings", ":e $MYVIMRC<CR>"),
  dashboard.button("u", "Update plugins", ":PackerUpdate<CR>"),
  dashboard.button("q", "Quit", ":qa<CR>"),
}

dashboard.section.footer.val = footer()

require("alpha").setup(dashboard.config)
