local function configure()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    require('nvim-tree').setup({
        renderer = {
            icons = {
                webdev_colors = true,
                show = {
                    git = true,
                    folder = true,
                    file = true,
                    folder_arrow = false,
                },
                glyphs = {
                    default = '',
                    git = {
                        unstaged = '~',
                        staged = '+',
                        unmerged = '!',
                        renamed = '≈',
                        untracked = '?',
                        deleted = '-',
                    },
                },
            },
            indent_markers = {
                enable = true,
            },
        },
    })
end


return  {
    'nvim-tree/nvim-tree.lua',
    dependencies= { 'nvim-tree/nvim-web-devicons' },
    config = configure
}
