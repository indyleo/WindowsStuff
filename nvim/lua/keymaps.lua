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

-- Modes:
--   normal_mode       = "n"  -- Normal mode
--   insert_mode       = "i"  -- Insert mode
--   visual_mode       = "v"  -- Visual mode
--   visual_block_mode = "x"  -- Visual block mode
--   select_mode       = "s"  -- Select mode
--   term_mode         = "t"  -- Terminal mode
--   command_mode      = "c"  -- Command-line mode
--   operator_pending  = "o"  -- Operator-pending mode
--   replace_mode      = "R"  -- Replace mode
--   virtual_replace   = "gR" -- Virtual Replace mode
--   ex_mode           = "!"  -- Ex mode
--   hit-enter         = "r"  -- Hit-enter prompt
--   confirm_mode      = "cv" -- Confirm mode
--   more_mode         = "rm" -- More prompt
--   shell_mode        = "!"  -- Shell or external command execution
--   lang_arg_mode     = "l"  -- Language-specific argument completion
--   lang_map_mode     = "L"  -- Language-specific mappings

---- Non-Plugin ----

-- Normal --

-- Better window managment
keymap("n", "<C-h>", "<C-w>h", opt)
keymap("n", "<C-j>", "<C-w>j", opt)
keymap("n", "<C-k>", "<C-w>k", opt)
keymap("n", "<C-l>", "<C-w>l", opt)

-- Resize splits
keymap("n", "<C-S-h>", ":resize -2<CR>", opt)
keymap("n", "<C-S-l>", ":resize +2<CR>", opt)
keymap("n", "<C-S-j>", ":vertical resize -2<CR>", opt)
keymap("n", "<C-S-k>", ":vertical resize +2<CR>", opt)

-- Making splits
keymap("n", "<leader>sv", ":vsplit<CR>", opts("Makes a Vertical Spilt"))
keymap("n", "<leader>sh", ":split<CR>", opts("Makes a Horizontal Spilt"))
keymap("n", "<leader>sq", ":close!<CR>", opts("Kill a Spilt"))

-- Buffer managment
keymap("n", "<S-l>", ":bnext<CR>", opt)
keymap("n", "<S-h>", ":bprevious<CR>", opt)
keymap("n", "<S-q>", ":Bdelete!<CR>", opt)

-- Clear highlights
keymap("n", "<leader>hl", ":nohlsearch<CR>", opts("Clear highlights"))

-- Run current line (Only in lua)
keymap("n", "<leader>rc", ":.lua<CR>", opts("Runs line under cursor"))

-- Increment/Decrement numbers
keymap("n", "a", "<C-a>", opt)
keymap("n", "q", "<C-x>", opt)

-- Http Server
keymap("n", "<leader>hn", function()
	HttpServer(Start)
end, opts("Start http server"))
keymap("n", "<leader>hf", function()
	HttpServer(Stop)
end, opts("Stop http server"))

-- Insert --

-- Press jk fast to enter
keymap("i", "jk", "<esc>", opt)

-- Visual --

-- Moving text around
keymap("v", "<", "<gv", opt)
keymap("v", ">", ">gv", opt)
keymap("v", "J", ":m '>+1<CR>gv=gv", opt)
keymap("v", "K", ":m '<-2<CR>gv=gv", opt)

-- Better paste
keymap("v", "p", "P", opt)

-- Run current selection (Only in lua)
keymap("v", "<leader>rc", ":lua<CR>", opts("Runs selection"))

---- Plugins ----

-- Normal mode --

-- Todo Comments
keymap("n", "<C-d>", function()
	require("todo-comments").jump_next()
end, opt)
keymap("n", "<C-c>", function()
	require("todo-comments").jump_prev()
end, opt)

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
keymap("n", "<leader>cn", function()
	require("nvim-tree.api").tree.change_root_to_node()
end, opts("Cd into a child directory"))
keymap("n", "<leader>cp", function()
	require("nvim-tree.api").tree.change_root_to_parent()
end, opts("Cd into a parent directory"))

-- Harpoon
keymap("n", "<leader>a", function()
	require("harpoon"):list():add()
end, opts("Marks a file"))
keymap("n", "<C-e>", function()
	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, opts("Opens Harpoon Menu"))
keymap("n", "<leader>1", function()
	require("harpoon"):list():select(1)
end, opts("Open file 1"))
keymap("n", "<leader>2", function()
	require("harpoon"):list():select(2)
end, opts("Open file 2"))
keymap("n", "<leader>3", function()
	require("harpoon"):list():select(3)
end, opts("Open file 3"))
keymap("n", "<leader>4", function()
	require("harpoon"):list():select(4)
end, opts("Open file 4"))
keymap("n", "<leader>5", function()
	require("harpoon"):list():select(5)
end, opts("Open file 5"))

-- Markdown Preview
keymap("n", "<leader>hp", ":MarkdownPreviewToggle<CR>", opts("Toggles Markdown Preview"))

-- ToggleTerm
keymap("n", "<C-q>", ":ToggleTerm<CR>", opt)

-- Alpha Nvim
keymap("n", "<C-z>", ":Alpha<CR>", opt)

-- Alpha Nvim
keymap("n", "<C-g>", ":LazyGit<CR>", opt)

-- Comment
keymap("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.current()
end, opts("Comments line"))
keymap(
	{ "x", "v" },
	"<leader>/",
	"<esc><:lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
	opts("Comments multi-line")
)

-- Flash
keymap({ "n", "x", "o" }, "<leader>jj", function()
	require("flash").jump()
end, opts("Flash jump"))
keymap({ "n", "x", "o" }, "<leader>jt", function()
	require("flash").treesitter()
end, opts("Flash treesiter jump"))
keymap("o", "<leader>jr", function()
	require("flash").remote()
end, opts("Flash remote"))
keymap({ "x", "o" }, "<leader>jR", function()
	require("flash").treesitter_search()
end, opts("Flash remote"))
keymap("c", "<leader>js", function()
	require("flash").toggle()
end, opts("Flash toggle search"))

-- Nvim Ufo
keymap("n", "<leader>zr", function()
	require("ufo").openAllFolds()
end, opts("Opens all folds"))
keymap("n", "<leader>zm", function()
	require("ufo").closeAllFolds()
end, opts("Closes all folds"))
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

-- Aerial
keymap("n", "<leader>tt", ":AerialToggle! right<CR>", opts("Aerial Toggle Tree Tags"))
keymap("n", "<leader>tu", ":AerialNavToggle<CR>", opts("Aerial Toggle Nav Tags"))
keymap("n", "<leader>tp", ":AerialPrev<CR>", opts("Aerial Prev Tag"))
keymap("n", "<leader>tn", ":AerialNext<CR>", opts("Aerial Next Tags"))

-- Formatter and Linters
keymap("n", "<leader>ml", function()
	require("lint").try_lint()
end, opts("Trigger linting for current file"))
keymap({ "n", "v" }, "<leader>mf", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, opts("Format file or range (in visual mode)"))

-- Lsp
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		local lspopts = function(desc)
			return { desc = desc, buffer = bufnr, noremap = true, silent = true }
		end

		-- Keymaps for LSP
		vim.keymap.set("n", "gR", ":Telescope lsp_references<CR>", lspopts("Show definition, references"))
		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end, lspopts("Go to declaration"))
		vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", lspopts("Show LSP definitions"))
		vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", lspopts("Show LSP implementations"))
		vim.keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", lspopts("Show LSP type definitions"))
		vim.keymap.set({ "n", "v" }, "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, lspopts("See available code actions; applies to selection in visual mode"))
		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
		end, lspopts("Smart rename"))
		vim.keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", lspopts("Show diagnostics for file"))
		vim.keymap.set("n", "<leader>d", function()
			vim.diagnostic.open_float()
		end, lspopts("Show diagnostics for line"))
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_prev()
		end, lspopts("Jump to previous diagnostic in buffer"))
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_next()
		end, lspopts("Jump to next diagnostic in buffer"))
		vim.keymap.set("n", "gK", function()
			vim.lsp.buf.hover()
		end, lspopts("Show documentation for what is under cursor"))
		vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", lspopts("Restart LSP if necessary"))

		-- Showing lsp is attached current file
		vim.notify("Lsp Attached to: " .. vim.fn.expand("%:t"), vim.log.levels.INFO)
	end,
})

-- Zen Mode
keymap("n", "<leader>zz", function()
	ToggleZen()
end, opts("Toggle zen mode"))
