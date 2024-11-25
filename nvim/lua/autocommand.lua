-- Format file on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("normal! gg=G")
    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end,
})

-- Test
-- -- Source cwf is nvim conf file
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*.lua",
--   callback = function()
--     -- Get the full path of the current file
--     local current_file = vim.fn.expand("%:p")
--     local config_lua_path = vim.fn.stdpath("config") .. "/lua"
--
--     -- Check if the file is inside the Neovim config Lua directory
--     if current_file:sub(1, #config_lua_path) == config_lua_path then
--       vim.cmd("luafile " .. current_file)
--       print("Sourced: " .. current_file)
--     else
--       print("Not in Neovim configuration directory: " .. current_file)
--     end
--   end,
-- })

-- Automatically add the header on new file creation
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*",
  callback = function()
    InsertFileHeader()
  end,
})
