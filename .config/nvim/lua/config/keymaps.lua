local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

keymap("i", "jk", "<ESC>", default_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)
keymap("n", "<C-h>", "<Cmd>BufferMovePrevious<CR>", default_opts)
keymap("n", "<C-l>", "<Cmd>BufferMoveNext<CR>", default_opts)
keymap("n", "<leader>d", ":bdelete<CR>", default_opts)
