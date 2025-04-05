return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			python = { "pylint" },
			javascript = { "eslint_d" },
			html = { "htmlhint" },
			css = { "stylelint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
