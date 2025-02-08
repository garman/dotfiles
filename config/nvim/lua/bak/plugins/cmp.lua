local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

local default_setup = function(server)
  require('lspconfig')[server].setup({
    capabilities = lsp_capabilities,
  })
end

local cmp = require('cmp')
-- luasnip setup
local luasnip = require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load()


-- nvim-cmp setup
cmp.setup({
  preselect = cmp.PreselectMode.None,

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  }),

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
    matching = { disallow_symbol_nonprefix_matching = false }
  }),

  --- GoLang
  lspconfig['gopls'].setup{
    cmd = {'gopls'},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    },
    init_options = {
      usePlaceholders = true,
    }
  }
})
