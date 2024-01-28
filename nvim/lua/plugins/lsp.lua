-- return {
-- {
-- 	"williamboman/mason.nvim",
-- 	config = function()
-- 		require("mason").setup({
-- 			ui = {
-- 				icons = {
-- 					package_installed = "✓ ",
-- 					package_pending = "➜ ",
-- 					package_uninstalled = "✗ ",
-- 				},
-- 			},
-- 		})
-- 	end,
-- },
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		config = function()
-- 			local lspconfig = require("lspconfig")
-- 			lspconfig.lua_ls.setup({})
--
-- 			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- 			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- 		end,
-- 	},
-- }
--
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓ ",
						package_pending = "➜ ",
						package_uninstalled = "✗ ",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.pylsp.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
