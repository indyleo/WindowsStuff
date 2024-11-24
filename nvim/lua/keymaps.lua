-- Shorten function name
local keymap = vim.keymap.set
-- Keymap option
local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end
local opt = { noremap = true, silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opt)
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
keymap({ "n", "i", "v", "x" }, "<RightMouse>", "<Nop>", opt)

-- Normal --

-- Better window managment
keymap("n", "<C-h>", "<C-w>h", opt)
keymap("n", "<C-j>", "<C-w>j", opt)
keymap("n", "<C-k>", "<C-w>k", opt)
keymap("n", "<C-l>", "<C-w>l", opt)
keymap("n", "<C-S-h>", ":resize -2<CR>", opt)
keymap("n", "<C-S-l>", ":resize +2<CR>", opt)
keymap("n", "<C-S-j>", ":vertical resize -2<CR>", opt)
keymap("n", "<C-S-k>", ":vertical resize +2<CR>", opt)

-- Buffer managment
keymap("n", "<S-l>", ":bnext<CR>", opt)
keymap("n", "<S-h>", ":bprevious<CR>", opt)
keymap("n", "<S-q>", ":Bdelete!<CR>", opt)

-- Clear highlights
keymap("n", "<leader>hl", ":nohlsearch<CR>", opts("Clear highlights"))

-- Better paste
keymap("v", "p", "P", opt)

-- Toggle spellcheck off and on
keymap("n", "<leader>sp", ":lua ToggleSpellCheck()<CR>", opts("Toggles spell check"))

-- Source the main conf file and current file
keymap("n", "<leader>so", ":lua SourceConf(Main)<CR>", opts("Source init.lua"))
keymap("n", "<leader>se", ":lua SourceConf(Current)<CR>", opts("Source current file in buffer"))

-- Increment/Decrement numbers
keymap("n", "a", "<C-a>", opt)
keymap("n", "z", "<C-x>", opt)

-- Number Options
keymap("n", "<C-n>", ":lua ToggleLineNumbers()<CR>", opt)

-- Format File
keymap("n", "<C-s>", "gg=G", opt)

-- Http Server
keymap("n", "<leader>hn", ":lua HttpServer(Start)<CR>", opts("Start http server"))
keymap("n", "<leader>hf", ":lua HttpServer(Stop)<CR>", opts("Stop http server"))

-- Insert file header
keymap("n", "<leader>hi", ":lua InsertFileHeader()<CR>", opts("Insert a file header"))

-- Insert --

-- Press jk fast to enter
keymap("i", "jk", "<esc>", opt)

-- Visual --

-- Stay in indent mode
keymap("v", "<", "<gv", opt)
keymap("v", ">", ">gv", opt)

---- Plugins ----

-- Normal mode --

-- Todo Comments
keymap("n", "<C-d>", function() require("todo-comments").jump_next() end, opt)
keymap("n", "<C-c>", function() require("todo-comments").jump_prev() end, opt)

-- Trouble
keymap("n", "<leader>xw", ":Trouble diagnostics toggle<CR>", opts("Open trouble workspace diagnostics"))
keymap("n", "<leader>xd", ":Trouble diagnostics toggle filter.buf=0<CR>", opts("Open trouble document diagnostics"))
keymap("n", "<leader>xq", ":Trouble quickfix toggle<CR>", opts("Open trouble quickfix list"))
keymap("n", "<leader>xl", ":Trouble loclist toggle<CR>", opts("Open trouble location list"))
keymap("n", "<leader>xt", ":Trouble todo toggle<CR>", opts("Open todos in trouble"))

-- Nvim Tree
keymap("n", "<leader>ee", ":NvimTreeToggle<CR>", opts("Toggle file explorer"))
keymap("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>", opts("Toggle file explorer on current file"))
keymap("n", "<leader>ec", ":NvimTreeCollapse<CR>", opts("Collapse file explorer"))
keymap("n", "<leader>er", ":NvimTreeRefresh<CR>", opts("Refresh file explorer"))
keymap("n", "<leader>eb", ":NvimTreeClipboard<CR>", opts("Show whats in Nvim-tree clipboard"))
keymap("n", "<leader>cn", ":lua require('nvim-tree.api').tree.change_root_to_node()<CR>", opts("Cd into a child directory"))
keymap("n", "<leader>cp", ":lua require('nvim-tree.api').tree.change_root_to_parent()<CR>", opts("Cd into a parent directory"))

-- Harpoon
keymap("n", "<leader>a", function() require("harpoon"):list():add() end, opts("Marks a file"))
keymap("n", "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, opts("Opens Harpoon Menu"))
keymap("n", "<leader>1", function() require("harpoon"):list():select(1) end, opts("Open file 1"))
keymap("n", "<leader>2", function() require("harpoon"):list():select(2) end, opts("Open file 2"))
keymap("n", "<leader>3", function() require("harpoon"):list():select(3) end, opts("Open file 3"))
keymap("n", "<leader>4", function() require("harpoon"):list():select(4) end, opts("Open file 4"))
keymap("n", "<leader>5", function() require("harpoon"):list():select(5) end, opts("Open file 5"))

-- ToggleTerm
keymap("n", "<C-q>", ":ToggleTerm<CR>", opt)

-- Alpha Nvim
keymap("n", "<C-z>", ":Alpha<CR>", opt)

-- Comment
keymap("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>", opts("Comments line"))
keymap({ "x", "v" }, "<leader>/", "<esc><:lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts("Comments multi-line"))

-- Nvim Ufo
keymap("n", "<leader>zr", function() require("ufo").openAllFolds() end, opts("Opens all folds"))
keymap("n", "<leader>zm", function() require("ufo").closeAllFolds() end, opts("Closes all folds"))
keymap("n", "<leader>zf", ":foldopen<CR>", opts("Opens folds"))
keymap("n", "<leader>zc", ":foldclose<CR>", opts("Closes folds"))
keymap("n", "<leader>zk", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, opts("Peek closed folds"))

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts("Fuzzy find files in cwd"))
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts("Fuzzy find recent files"))
keymap("n", "<leader>fs", ":Telescope live_grep<CR>", opts("Find string in cwd"))
keymap("n", "<leader>fc", ":Telescope grep_string<CR>", opts("Find string under cursor in cwd"))
keymap("n", "<leader>ft", ":TodoTelescope<CR>", opts("Find todos"))
keymap("n", "<leader>fu", ":Telescope undo<CR>", opts("Opens undo managment"))
keymap("n", "<leader>fn", ":Telescope notify<CR>", opts("Opens notification histroy"))
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts("Fuzzy find help pages"))

-- Lsp
keymap("n", "gR", ":Telescope lsp_references<CR>", opts("Show definition, references"))
keymap("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
keymap("n", "gd", ":Telescope lsp_definitions<CR>", opts("Show lsp definitions"))
keymap("n", "gi", ":Telescope lsp_implementations<CR>", opts("Show lsp implementations"))
keymap("n", "gt", ":Telescope lsp_type_definitions<CR>", opts("Show lsp type definitions"))
keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("See available code actions, in visual mode will apply to selection"))
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts("Smart rename"))
keymap("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", opts("Show  diagnostics for file"))
keymap("n", "<leader>d", vim.diagnostic.open_float, opts("Show diagnostics for line"))
keymap("n", "[d", vim.diagnostic.goto_prev, opts("Jump to previous diagnostic in buffer"))
keymap("n", "]d", vim.diagnostic.goto_next, opts("Jump to next diagnostic in buffer"))
keymap("n", "K", vim.lsp.buf.hover, opts("Show documentation for what is under cursor"))
keymap("n", "<leader>rs", ":LspRestart<CR>", opts("Mapping to restart lsp if necessary"))

-- Zen Mode
keymap("n", "<leader>zz", ":lua ToggleZen()<CR>", opts("Toggle zen mode"))
