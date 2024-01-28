-- return {
-- 	{
-- 		"nvim-telescope/telescope.nvim",
-- 		tag = "0.1.5",
-- 		dependencies = { "nvim-lua/plenary.nvim" },
-- 		config = function()
-- 			local builtin = require("telescope.builtin")
--
-- 			require("telescope").setup({
-- 				defaults = {
-- 					-- ...
-- 				},
-- 				pickers = {
-- 					find_files = {
-- 						theme = "cursor",
-- 					},
-- 					buffers = {
-- 						theme = "cursor",
-- 					},
-- 				},
-- 				extensions = {
-- 					-- ...
-- 				},
-- 			})
--
-- 			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
--
-- 			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
-- 		end,
-- 	},
-- }
return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
