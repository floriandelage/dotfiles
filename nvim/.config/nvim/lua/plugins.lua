--- =======================================================
--- Plugins
--- =======================================================

vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/zapling/mason-conform.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/kylechui/nvim-surround" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/lervag/vimtex" },
})

--- =======================================================
--- Colorscheme
--- =======================================================

require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
})

vim.cmd.colorscheme("catppuccin-nvim")

--- =======================================================
--- Git Signs
--- =======================================================

require("gitsigns").setup({ signcolumn = true })

--- =======================================================
--- Status Line
--- =======================================================

require("lualine").setup({})

--- =======================================================
--- Treesitter
--- =======================================================

local parsers = {
	"lua",
	"c",
	"python",
	"javascript",
	"typescript",
	"html",
	"css",
	"jsdoc",
	"typst",
}

require("nvim-treesitter").install(parsers)
require("nvim-treesitter").setup({})

--- =======================================================
--- Telescope
--- =======================================================

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

--- =======================================================
--- Language Server Protocol
--- =======================================================

local servers = {
	"lua_ls",
	"stylua",
	"clangd",
	"pyright",
	"vtsls",
	"html",
	"cssls",
	"ts_ls",
	"tinymist",
}

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({ ensure_installed = servers })

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim", "require" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})

vim.diagnostic.config({ virtual_text = true })

--- =======================================================
--- Completions
--- =======================================================

require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = false, auto_show_delay_ms = 500 },
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
	},
})

--- =======================================================
--- Formatting
--- =======================================================

require("conform").setup({
	format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "clang-format" },
		python = { "black" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		html = { "prettierd" },
		css = { "prettierd" },
		typst = { "prettypst" },
	},
})

require("mason-conform").setup({})

--- =======================================================
--- Autopairs
--- =======================================================

require("nvim-autopairs").setup({})

--- =======================================================
--- Text Preview
--- =======================================================

require("typst-preview").setup({})
