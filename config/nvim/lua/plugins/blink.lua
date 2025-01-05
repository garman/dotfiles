local blink = require('blink.cmp')

blink.setup({
    -- 'default', 'super-tab', 'enter'
    keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    -- 'preselect', 'manual', 'auto_insert'
    completion = {
        list = { selection = 'auto_insert' },
        menu = { border = 'rounded' },
        documentation = { auto_show = true, window = { border = 'rounded' } },
        ghost_text = { enabled = true },
    },
    signature = { window = { border = 'rounded' } },
    appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        use_nvim_cmp_as_default = true,
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', },
    },
})
