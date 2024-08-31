return {
    {
		"catppuccin/nvim",
		name = "catppuccin",
        config = function()
            local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin')
            if not ok then
              vim.cmd 'colorscheme default' -- if the above fails, then use default
            end
        end,
    }
}
