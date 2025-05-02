local function configure()
    local lualine = require('lualine')

    local lsp_info = {
      -- Lsp server name .
      function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon = ' ',
      color = { fg = '#ef9540', gui = 'bold' },
    }

    local lsp_progress = {
        function()
            return require('lsp-progress').progress()
        end,
        color = { fg = '#cc8800' },
    }

    lualine.setup {
        options = { theme = 'horizon' },
        sections = {
            lualine_b = { lsp_info, lsp_progress },
        }
    }

    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
        group = "lualine_augroup",
        pattern = "LspProgressStatusUpdated",
        callback = require("lualine").refresh,
    })
end

return {
    'nvim-lualine/lualine.nvim',
    config = configure,
}
