return {
    { 'nvim-lua/plenary.nvim' },
    {
		'nvim-telescope/telescope.nvim',
	},
	{ 'rose-pine/neovim', name = 'rose-pine'},

	{'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate'},
	'mbbill/undotree',
	'tpope/vim-fugitive',
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			{'neovim/nvim-lspconfig'},
			{
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'},
			{'L3MON4D3/LuaSnip'},
		}
	},
    'jose-elias-alvarez/null-ls.nvim',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-path',
	'nvim-tree/nvim-web-devicons',
	'nvim-lualine/lualine.nvim',
	"nvim-lua/lsp-status.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },
	{'nvim-tree/nvim-tree.lua', dependencies= { 'nvim-tree/nvim-web-devicons' } },
    -- Debugger
    { "puremourning/vimspector", build = "python install_gadget.py --all"},
    -- Rust tools
    'simrat39/rust-tools.nvim',
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
    },

    {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
    },
    -- Dart Stuff 
    'dart-lang/dart-vim-plugin',
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    }
}
