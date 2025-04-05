return {
	{ "rafamadriz/friendly-snippets" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "onsails/lspkind.nvim" },
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		opts = function()
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			local auto_select = true

			return {
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					format = function(entry, item)
						local source_names = {
							nvim_lsp = "[LSP]",
							luasnip = "[SNIP]",
							buffer = "[BUF]",
							path = "[PATH]",
						}

						item.menu = source_names[entry.source.name] or "[UNK]"
						return item
					end,
				},
				completion = {
					completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
				},
				preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = auto_select }),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
					["<C-CR>"] = function(fallback)
						cmp.abort()
						fallback()
					end,
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
				experimental = {
					ghost_text = vim.g.ai_cmp and { hl_group = "CmpGhostText" } or false,
				},
				sorting = defaults.sorting,
			}
		end,
	},
}
