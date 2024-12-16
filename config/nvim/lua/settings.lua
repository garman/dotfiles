local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt

g.mapleader = ","
g.floaterm_wintype = "split"

-- linenumbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.expandtab = true
opt.autoindent = true                         -- Copy indent from previous line
opt.shiftwidth = 2                            -- 2 spaces when indented
opt.smartindent = true                        -- Auto insert extra indent level in certain cases
opt.smarttab = true                           -- Prevents tab/space issues

-- formatting
opt.wrap = false                              -- Don"t wrap lines
opt.termguicolors = true
opt.background = "dark"                       -- Colorschemes default to dark
opt.signcolumn = "yes"                        -- Show sign colum so that text doesn't shift
opt.cursorline = true                         -- Highlight current line
cmd("colorscheme tokyonight")

-- searchsettings
opt.smartcase = true                          -- Enable case sensitive search only when uppercase characters present
opt.ignorecase = true                         -- Ignore case in searches

-- backspace
opt.backspace = { "indent", "eol", "start" }  -- Adds intuitive backspacing

--clipboard
opt.clipboard:append("unnamedplus")           -- Use system clipboard as default register

-- split windows
opt.splitbelow = true                         -- Open hsplits below rather than above
opt.splitright = true                         -- Open vsplits to the right rather than left

opt.backup = false                            -- No Backup files
opt.backupcopy = "yes"                        -- Keeps original creator code
opt.colorcolumn = '118'
opt.completeopt = { "menuone", "noselect" }
opt.completeopt:append("menuone")             -- Always show menu
opt.diffopt:append("vertical")                -- Always use vertical diffs
opt.errorbells = false                        -- Obvious
opt.fillchars:append("vert:│")                -- Use tall pipe in split separators
opt.foldmethod = "marker"
opt.hidden = false                            -- Don't hide unsaved buffers
opt.history = 100                             -- Keep 100 lines of command line history
opt.hlsearch = true                           -- Highlights search
opt.incsearch = true                          -- Searches for text as entered
opt.laststatus = 2                            -- Always show statusline
opt.lazyredraw = true
opt.linebreak = true
opt.list = true                               -- Don't show listchars
opt.listchars = { tab = "»·", trail = "·" }
opt.matchtime = 0                             -- Fix neovim match lag
opt.mouse = "a"
opt.ruler = true                              -- Show the ruler
opt.scrolloff = 5                             -- Always show 5 lines above/blow cursor
opt.shell = "/bin/zsh"                        -- use zsh for the `:terminal` shells
opt.shortmess = "fmnrWIcF"                    -- Customize what vim yells at you
opt.shortmess:append("sI")
opt.showcmd = false                           -- Don"t show command in the last line of the screen
opt.showmatch = true                          -- Highlight matching paren/brace/bracket
opt.swapfile = false                          -- No swap
opt.synmaxcol = 180                           -- Prevents segfaults and slow rendering
opt.tags = ".git/tags"                        -- Where to find tags
opt.undolevels = 500                          -- More undo
opt.wildignorecase = true                     -- Case insensitive completions
opt.wildmenu = true

exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

cmd [[
  au BufWritePre * :%s/\s\+$//e
  autocmd TermOpen * setlocal listchars= nocursorline

  let g:ale_linters = { 'ruby': ['rubocop', 'srb', 'rails_best_practices', 'packwerk', 'brakeman'] }

  au BufEnter * set fo-=c fo-=r fo-=o
  autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
  " set filetypes as typescriptreact
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
  command Term :botright vsplit term://$SHELL

  if has("autocmd")
    autocmd FileType gitcommit setlocal spell formatoptions-=t
    autocmd Filetype markdown setlocal spell formatoptions-=t
    autocmd FileType netrw setl bufhidden=delete
    autocmd FileType netrw setlocal
    autocmd FileType qf setlocal cc=""
    autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab
    autocmd BufNewFile,BufRead *.json.jbuilder set ft=ruby

    autocmd BufRead,BufNewFile *.es6 setfiletype javascript

    autocmd BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
  endif

  function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
      let dir=fnamemodify(a:file, ':h')
      if !isdirectory(dir)
        call mkdir(dir, 'p')
      endif
    endif
  endfunction

  au filetype go inoremap <buffer> . .<C-x><C-o>

  augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
  augroup END
]]
