-- Source cwf is nvim conf file
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.lua",
	callback = function()
		-- Normalize path separators for comparison
		local function normalize_path(path)
			return path:gsub("\\", "/")
		end

		-- Get the full path of the current file and normalize it
		local current_file = normalize_path(vim.fn.expand("%:p"))
		local current_filename = vim.fn.expand("%:t")
		local config_path = normalize_path(vim.fn.stdpath("config") .. "/lua")
		local plugins_path = normalize_path(vim.fn.stdpath("config") .. "/lua/plugins")
		local wezterm_config_path = normalize_path(vim.fn.expand("~") .. "/.config/wezterm")

		-- List of files to exclude
		local excluded_files = { "autocommand.lua", "options.lua", "init.lua" }

		-- Check if the current file is in the exclusion list
		for _, excluded_file in ipairs(excluded_files) do
			if current_filename == excluded_file then
				vim.notify("Skipping reloading for excluded file: " .. current_filename, vim.log.levels.WARN)
				return -- Exit the callback if the file is excluded
			end
		end

		-- Check if the current file is within the Neovim config directory and not in plugins folder
		if
			current_file:sub(1, #config_path) == config_path
			and current_file:sub(1, #plugins_path) ~= plugins_path
			and current_file:sub(1, #wezterm_config_path) ~= wezterm_config_path
		then
			-- Debugging: Print normalized paths (only if not in plugins folder or wezterm config)
			vim.notify("Normalized Current File: " .. current_file, vim.log.levels.DEBUG)
			vim.notify("Normalized Config Path: " .. config_path, vim.log.levels.DEBUG)
			vim.notify("Normalized Plugins Path: " .. plugins_path, vim.log.levels.DEBUG)
			vim.notify("Normalized WezTerm Config Path: " .. wezterm_config_path, vim.log.levels.DEBUG)

			-- Try to source the file
			local ok, err = pcall(function()
				vim.cmd.source(current_file)
			end)
			if ok then
				vim.notify("Reloaded: " .. current_filename, vim.log.levels.INFO)
			else
				vim.notify("Failed to Reloaded: " .. err, vim.log.levels.WARN)
			end
		elseif
			current_file:sub(1, #plugins_path) == plugins_path
			or current_file:sub(1, #wezterm_config_path) == wezterm_config_path
		then
			-- Don't print anything if in plugins folder or WezTerm config directory
			return
		else
			vim.notify("Not in Neovim configuration directory.", vim.log.levels.WARN)
		end
	end,
})

-- Automatically add the header on new file creation
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*",
	callback = function()
		-- Delay execution to ensure filetype is set
		vim.defer_fn(function()
			InsertFileHeader()
		end, 10) -- Delay of 10ms
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("Highlight-Yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Hides the "[Process exited 0]" call whenever you close a terminal
vim.api.nvim_create_autocmd("TermClose", {
	callback = function()
		vim.cmd("silent! bd!") -- Close the buffer silently
	end,
})
