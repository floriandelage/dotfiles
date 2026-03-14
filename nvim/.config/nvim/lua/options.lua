local opt = vim.opt -- Set options

-- Indent
opt.expandtab = true -- use spaces when <Tab> is inserted
opt.autoindent = true -- auto indenting
opt.shiftround = true -- round indent to multiple of shiftwidth
opt.shiftwidth = 4 -- number of spaces to use for (auto)indent step
opt.softtabstop = 4 -- number of spaces that <Tab> use while editing
opt.tabstop = 4 -- number of spaces that <Tab> in files uses

-- Search
opt.ignorecase = true -- ignore case in search patterns
opt.incsearch = true -- highlight match while typing search pattern
opt.smartcase = true -- no ignore case when pattern has uppercase

-- Customizations

opt.colorcolumn = "80" -- columns to highlight
opt.cursorline = true -- highlight the screen line of the cursor
opt.number = true -- print the line number in front of each line
opt.relativenumber = true -- show relative line number
opt.termguicolors = true -- enable 24-bit RGB color in the TUI
opt.signcolumn = "yes" -- keep sign column enabled
opt.list = true -- set how to display certain whitespace char
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.winborder = "rounded" -- use rounded borders for windows
opt.showmode = false

-- System

opt.belloff = "all" -- disable ring bell
opt.confirm = true -- ask what to do about unsaved/read-only files
opt.mouse = "a" -- enable the use of mouse clicks
opt.splitbelow = true -- new window from split is below the current one
opt.splitright = true -- new window is put right of the current one
opt.swapfile = false -- whether to use a swapfile for a buffer
opt.undodir = os.getenv("HOME") .. "/.vim/undodir/"
opt.undofile = true -- save undo information in a file
opt.completeopt = { "menuone", "popup", "noinsert" } -- options for completion
opt.inccommand = "nosplit" -- shows the effects of a command incrementally
opt.scrolloff = 8 -- keep 8 lines above and below the cursor
opt.wrap = false -- disable line wrapping
opt.clipboard = "unnamedplus" -- system clipboard
