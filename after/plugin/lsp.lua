local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
-- Locally installed jedi-language-server for python completition to work globally

local jedi_location = '/usr/bin/jedi-language-server'
if os.getenv("VIRTUAL_ENV") ~= nil then
    jedi_location = os.getenv("VIRTUAL_ENV").."/bin/jedi-language-server"
end


lspconfig['jedi_language_server'].setup {
    cmd = { jedi_location },
    filetypes = { "python" },
}

local root_files = {
  'compile_commands.json',
  '.ccls',
}

lspconfig.ccls.setup {
  default_config = {
    cmd = { '/usr/bin/ccls' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_dir = function(fname)
      return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end,
    offset_encoding = 'utf-32',
    -- ccls does not support sending a null root directory
    single_file_support = false,
  },
}

local js_root_files = {
    'mod.js'
}

lspconfig.denols.setup {
    default_config = {
        cmd = { '/usr/bin/deno', 'lsp' },
        filetypes = {'js', 'ts'},
        root_dir = function(fname)
          return util.root_pattern(unpack(js_root_files))(fname) or util.find_git_ancestor(fname)
        end,
        offset_encoding = 'utf-32'
    }
}

local dart_root_files = {
    '.mod.dart'
}

lspconfig.dartls.setup {
    default_config = {
        cmd = { '/usr/bin/dart', 'language-server'},
        filetypes = { 'dart' },
        root_dir = function(fname)
          return util.root_pattern(unpack(dart_root_files))(fname) or util.find_git_ancestor(fname)
        end,
        offset_encoding = 'utf-32',
    }
}

lsp.preset("recommended")

lsp.ensure_installed({
	'lua_ls',
	'rust_analyzer',
})

lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil


lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn  = 'W',
        hint  = 'H',
        info  = 'I'
    }
})

lsp.on_attach(function(_, buffnr)
	local opts = {buffer = buffnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrd", function() vim.lsp.buf.type_definition() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()


vim.diagnostic.config({
    virtual_text = true
})
