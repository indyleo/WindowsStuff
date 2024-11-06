-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

-- Remap space as leader key
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

-- Mouse keymaps 
keymap({"n", "i", "v", "x"}, "<RightMouse>", "<Nop>", { desc = "Disables Right Click Menu" }, opts)

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

-- Source the main conf file and current file
keymap("n", "<leader>so", ":lua SourceConf(Main)<CR>", { desc = "Source init.lua" }, opts)
keymap("n", "<leader>se", ":lua SourceConf(Current)<CR>", { desc = "Source current file ini buffer" }, opts)

-- Transparent background toggle
keymap("n", "<C-t>", ":lua ToggleTransparent()<CR>", opts)

-- Increment/Decrement numbers
keymap("n", "a", "<C-a>", opts)
keymap("n", "z", "<C-x>", opts)

-- Number Options
keymap("n", "<C-n>", ":lua ToggleLineNumbers()<CR>", { desc = "Switches between line numbers" }, opts)

-- Https server
keymap("n", "<leader>hn", ":lua HttpServer(Start)<CR>", { desc = "Turns on Https server" }, opts)
keymap("n", "<leader>hf", ":lua HttpServer(Stop)<CR>", { desc = "Turns off Https server" }, opts)

-- Format File
keymap("n", "<C-s>", "gg=G", { desc = "Formats the file" }, opts)

-- Insert --

-- Press jk fast to enter
keymap("i", "jk", "<esc>", opts)

-- Visual --

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

---- Plugins ----

-- Normal mode --

-- Todo Comments
keymap("n", "<C-d>", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" }, opts)
keymap("n", "<C-c>", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" }, opts)

-- Trouble
keymap("n", "<leader>xw", ":Trouble diagnostics toggle<CR>", { desc = "Open trouble workspace diagnostics" }, opts)
keymap("n", "<leader>xd", ":Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Open trouble document diagnostics" }, opts)
keymap("n", "<leader>xq", ":Trouble quickfix toggle<CR>", { desc = "Open trouble quickfix list" }, opts)
keymap("n", "<leader>xl", ":Trouble loclist toggle<CR>", { desc = "Open trouble location list" }, opts)
keymap("n", "<leader>xt", ":Trouble todo toggle<CR>", { desc = "Open todos in trouble" }, opts)

-- Nvim Tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" }, opts)

-- ToggleTerm
keymap("n", "<C-q>", ":ToggleTerm<CR>", { desc = "Toggles Terminal" }, opts)

-- Comment
keymap("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>", { desc = "Comments Line" }, opts)
keymap({ "x", "v" }, "<leader>/", "<esc><:lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Comments Multi" }, opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" }, opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" }, opts)
keymap("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find string in cwd" }, opts)
keymap("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" }, opts)
keymap("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Find todos" }, opts)
keymap("n", "<leader>fu", ":Telescope undo<CR>", { desc = "Opens undo managment" }, opts)

-- Lsp
keymap("n", "gR", ":Telescope lsp_references<CR>", { desc = "show definition, references" }, opts)
keymap("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration" }, opts)
keymap("n", "gd", ":Telescope lsp_definitions<CR>", { desc = "show lsp definitions" }, opts)
keymap("n", "gi", ":Telescope lsp_implementations<CR>", { desc = "show lsp implementations" }, opts)
keymap("n", "gt", ":Telescope lsp_type_definitions<CR>", { desc = "show lsp type definitions" }, opts)
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "see available code actions, in visual mode will apply to selection" }, opts) 
keymap("n", "<leader>rn", vim.lsp.buf.rename, { desc = "smart rename" }, opts)
keymap("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", { desc = "show  diagnostics for file" }, opts)
keymap("n", "<leader>d", vim.diagnostic.open_float, { desc = "show diagnostics for line" }, opts)
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "jump to previous diagnostic in buffer" }, opts)
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "jump to next diagnostic in buffer" }, opts)
keymap("n", "K", vim.lsp.buf.hover, { desc = "show documentation for what is under cursor" }, opts)
keymap("n", "<leader>rs", ":LspRestart<CR>", { desc = "mapping to restart lsp if necessary" }, opts)

-- Zen Mode
keymap("n", "<leader>zz", ":ZenMode<CR>", { desc = "Toggle zen mode" }, opts)
