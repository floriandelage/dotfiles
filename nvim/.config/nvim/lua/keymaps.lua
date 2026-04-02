vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Remove search highlight
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.open_float()
end) -- Extended diagonstic

local function git_root()
	local git_dir = vim.fn.finddir(".git", ";")
	return vim.fn.fnamemodify(tostring(git_dir), ":h")
end

local function typst_watch()
	local file = vim.fn.expand("%:.")
	local cmd = "typst watch --root " .. git_root() .. " " .. file

	vim.cmd("vsp")
	vim.cmd("vertical resize 20")
	vim.cmd("terminal " .. cmd)
	vim.cmd("wincmd h")
end

vim.keymap.set("n", "<leader>tc", typst_watch, { silent = true })

vim.keymap.set("n", "<leader>tr", function()
	local pdf = vim.fn.expand("%:p:r") .. ".pdf"
	vim.fn.jobstart({ "zathura", "--fork", pdf }, { detach = true })
end, { silent = true })
