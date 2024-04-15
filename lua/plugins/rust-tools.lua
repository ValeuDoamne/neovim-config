local function configure()
    local rt = require("rust-tools")
    local mason_registry = require('mason-registry')

    local dap_setup = {}

    if mason_registry.is_installed("codelldb") then
        local codelldb = mason_registry.get_package("codelldb")
        local extension_path = codelldb:get_install_path() .. "/extension/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        local os_name = vim.loop.os_uname().sysname
        local liblldb_path = ""

        if os_name == "Darwin" then
            liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
        elseif os_name == "Windows" then
            liblldb_path = extension_path .. "lldb/lib/liblldb.dll"
        else
            liblldb_path = extension_path .. "lldb/lib/liblldb.so"
        end
        dap_setup = {
            adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
        }
    end

    rt.setup({
      dap = dap_setup,
      server = {
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
          -- Code action groups
          vim.keymap.set("n", "<Leader>va", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
      },
      tools = {
        hover_actions = {
            auto_focus = true,
        },
      },
    })
end

return {
    'simrat39/rust-tools.nvim',
    config = configure,
}
