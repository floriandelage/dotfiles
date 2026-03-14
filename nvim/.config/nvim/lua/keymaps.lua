vim.g.mapleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Remove search highlight
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.open_float()
end) -- Extended diagonstic
