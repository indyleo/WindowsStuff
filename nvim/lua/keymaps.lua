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

---- Non-Plugin ----

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

---- Plugins ----

-- Normal mode --

-- Auto Session 
keymap("n", "<leader>wr", ":SessionRestore<CR>", { desc = "Restore session for cwd" }, opts)
keymap("n", "<leader>ws", ":SessionSave<CR>", { desc = "Save session for auto session root dir" }, opts)

-- Todo Comments
keymap("n", "<C-d>", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" }, opts)

keymap("n", "<C-c>", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" }, opts)

-- Trouble
keymap("n", "<leader>xw", ":Trouble diagnostics toggle<CR>", { desc = "Open trouble workspace diagnostics" }, opts)
keymap("n", "<leader>xd", ":Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Open trouble document diagnostics" }, opts)
keymap("n", "<leader>xq", ":Trouble quickfix toggle<CR>", { desc = "Open trouble quickfix list" }, opts)
keymap("n", "<leader>xl", ":Trouble loclist toggle<CR>", { desc = "Open trouble location list" }, opts)
keymap("n", "<leader>xt", ":Trouble todo toggle<CR>", { desc = "Open todos in trouble" }, opts)

-- Nvim Tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" }, opts)

-- Undotree
vim.keymap.set('n', '<leader>dt', ":UndotreeToggle<CR>", {desc = "Toggles Undotreee"}, opts)

-- ToggleTerm
keymap("n", "<C-q>", ":ToggleTerm<CR>", { desc = "Toggles Terminal" }, opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" }, opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" }, opts)
keymap("n", "<leader>fs", ":Telescope live_grep<cr>", { desc = "Find string in cwd" }, opts)
keymap("n", "<leader>fc", ":Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" }, opts)
keymap("n", "<leader>ft", ":TodoTelescope<cr>", { desc = "Find todos" }, opts)

-- Zen Mode
keymap("n", "<leader>zz", ":ZenMode<CR>", {desc = "Toggle zen mode"}, opts)
