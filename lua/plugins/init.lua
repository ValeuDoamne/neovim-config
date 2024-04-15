return {
    { 'nvim-lua/plenary.nvim' },
	{ 'rose-pine/neovim', name = 'rose-pine'},

    { 'mbbill/undotree', config = function () vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) end, },

    { 'tpope/vim-fugitive', config = function() vim.keymap.set("n", "<leader>gs", vim.cmd.Git) end,},

    'jose-elias-alvarez/null-ls.nvim',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-path',
	'nvim-tree/nvim-web-devicons',
	"nvim-lua/lsp-status.nvim",
	{ "catppuccin/nvim", name = "catppuccin-mocha" },
    -- Debugger
    { "puremourning/vimspector", build = "python install_gadget.py --all"},

    {
        'numToStr/Comment.nvim',
        lazy = false,
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
      end,
      opts = {},
    },

    -- Dart Stuff 
    'dart-lang/dart-vim-plugin',
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = function () require("flutter-tools").setup {} end,
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {
      "lervag/vimtex",
       init = function()
         -- Use init for configuration, don't use the more common "config".
       end
    }
}
