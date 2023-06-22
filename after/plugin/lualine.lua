local lualine = require('lualine')

lualine.setup {
    options = { theme = 'horizon' },
    sections = { lualine_c = { "require'lsp-status'.status()" } }
}
