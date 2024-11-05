-- Always be in ~ directorywhen launched
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("cd $HOME")
    end,
})
