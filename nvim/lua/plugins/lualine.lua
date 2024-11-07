-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   config = function()
--     local lualine = require("lualine")
--     -- configure lualine with modified theme
--     lualine.setup({
--       options = {
--         theme = 'vscode',
--       },
--       sections = {
--         lualine_x = {
--           { "encoding" },
--           { "fileformat" },
--           { "filetype" },
--         },
--       },
--     })
--   end,
-- }

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    -- Configure lualine with modified theme and colors
    lualine.setup({
      options = {
        theme = {
          normal = {
            a = { bg = "#2980B9", fg = "#d4d4d4" },
            b = { bg = "#1e1e1e", fg = "#d4d4d4" },
            c = { bg = "#1e1e1e", fg = "#d4d4d4" },
            x = { bg = "#1e1e1e", fg = "#d4d4d4" },
            y = { bg = "#1e1e1e", fg = "#d4d4d4" },
            z = { bg = "#2980B9", fg = "#d4d4d4" },
          },
          inactive = {
            a = { bg = "#1e1e1e", fg = "#d4d4d4" },
            b = { bg = "#1e1e1e", fg = "#d4d4d4" },
            c = { bg = "#1e1e1e", fg = "#d4d4d4" },
            x = { bg = "#1e1e1e", fg = "#d4d4d4" },
            y = { bg = "#1e1e1e", fg = "#d4d4d4" },
            z = { bg = "#1e1e1e", fg = "#d4d4d4" },
          },
        },
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
