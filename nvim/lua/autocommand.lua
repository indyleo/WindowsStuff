-- Format file on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("normal! gg=G")
    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end,
})

-- Automatically add the header on new file creation
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*",
  callback = function()
    InsertFileHeader()
  end,
})
