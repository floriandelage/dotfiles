vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Remove search highlight
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.open_float()
end) -- Extended diagonstic
