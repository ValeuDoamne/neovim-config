local function lsp_server()
	local mason_registry = require('mason-registry')
	local ra_binary = mason_registry.is_installed('rust-analyzer')
	  and mason_registry.get_package('rust-analyzer'):get_install_path() .. "/rust-analyzer"
	  or "rust-analyzer"
	return { ra_binary } -- You can add args to the list, such as '--log-file'
end


return {
    'mrcjkb/rustaceanvim',
    version = "^5",
    lazy = false,
    ["rust-analyzer"] = {
        cargo = {
            allFeatures = true,
        },
    },
    server = {
        cmd = lsp_server,
    },
}
