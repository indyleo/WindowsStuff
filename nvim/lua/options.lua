-- Var
local opt = vim.opt

-- Vim Commands
vim.cmd("let g:netrw_liststyle = 3")

-- Disabling NetRW
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Gui Setup
vim.o.guifont = "CaskaydiaCove NF:h12"

-- Options
opt.backup = false
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.mouse = ""
opt.mousemodel = ""
opt.pumheight = 10
opt.showmode = false
opt.showtabline = 0
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.timeout = true
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 300
opt.writebackup = false
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.cursorline = true
opt.relativenumber = false
opt.number = true
opt.laststatus = 3
opt.showcmd = false
opt.ruler = false
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.fillchars = { eob = " ", foldopen = "▾", foldclose = "▸" }
opt.shortmess:append("c")
opt.whichwrap:append("<,>,[,],h,l")
opt.iskeyword:append("-")
opt.formatoptions:remove({ "c", "r", "o" })
opt.linebreak = true
opt.spelllang = "en_us"
opt.spell = false
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Neovide Opts
if vim.g.neovide then
	vim.g.neovide_padding_top = 15
	vim.g.neovide_padding_bottom = 15
	vim.g.neovide_padding_right = 15
	vim.g.neovide_padding_left = 15
	vim.g.neovide_fullscreen = true
	vim.g.neovide_cursor_vfx_mode = "pixiedust"
	vim.cmd("cd $HOME")
end
