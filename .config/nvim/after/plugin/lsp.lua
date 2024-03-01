local Remap = require("fink.keymap")
local nnoremap = Remap.nnoremap
-- local inoremap = Remap.inoremap

-- configs for all ls
local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			nnoremap("gd", function() vim.lsp.buf.definition() end)
			-- nnoremap("gi", function() vim.lsp.buf.implementation() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("[j", function() vim.diagnostic.goto_next() end)
			nnoremap("[k", function() vim.diagnostic.goto_prev() end)
			-- nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			-- nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			nnoremap("<A-a>", function() vim.lsp.buf.code_action() end)
			-- nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
			nnoremap("<A-r>", function() vim.lsp.buf.rename() end)
			-- inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end

-- setup servers
require("lspconfig").lua_ls.setup(config({
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
			},
		},
	},
}))

require("lspconfig").bashls.setup(config())
require("lspconfig").clangd.setup(config())
require("lspconfig").html.setup(config())
require("lspconfig").pylsp.setup(config())
require'lspconfig'.marksman.setup{}
