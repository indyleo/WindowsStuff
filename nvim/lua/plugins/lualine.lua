return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = 'vscode',
      },
      sections = {
        lualine_x = {
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
