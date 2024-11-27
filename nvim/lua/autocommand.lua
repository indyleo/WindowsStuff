-- Format file on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("normal! gg=G")
    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end,
})

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

    -- List of files to exclude
    local excluded_files = { "autocommand.lua", "options.lua" }

    -- Check if the current file is in the exclusion list
    for _, excluded_file in ipairs(excluded_files) do
      if current_filename == excluded_file then
        vim.notify("Skipping reloading for excluded file: " .. current_filename, vim.log.levels.WARN)
        return -- Exit the callback if the file is excluded
      end
    end

    -- Debugging: Print normalized paths
    vim.notify("Normalized Current File: " .. current_file, vim.log.levels.DEBUG)
    vim.notify("Normalized Config Path: " .. config_path, vim.log.levels.DEBUG)

    -- Check if the current file is within the Neovim config directory
    if current_file:sub(1, #config_path) == config_path then
      -- Try to source the file
      local ok, err = pcall(function()
        vim.cmd.source(current_file)
      end)
      if ok then
        vim.notify("Reloaded: " .. current_filename, vim.log.levels.INFO)
      else
        vim.notify("Failed to Reloaded: " .. err, vim.log.levels.WARN)
      end
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
