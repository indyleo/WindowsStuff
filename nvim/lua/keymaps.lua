-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", ":Bdelete!<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Better paste
keymap("v", "p", "P", opts)

-- Toggle spellcheck off and on
keymap("n", "<leader>sp", ":lua ToggleSpellCheck()<CR>", opts)

-- Source the main conf file
keymap("n", "<leader>so", ":lua SourceConf()<CR>", opts)

-- Transparent background toggle
keymap("n", "<C-t>", ":lua ToggleTransparent()<CR>", opts)

-- File managment
keymap("n", "<leader>e", ":lua CustomNetrw(50)<CR>", opts)

-- Increment/Decrement numbers
keymap("n", "a", "<C-a>", opts)
keymap("n", "z", "<C-x>", opts)

-- Number Options
keymap("n", "<C-n>", ":lua ToggleLineNumbers()<CR>", opts)
 
-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
