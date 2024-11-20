return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    local hooks = require "ibl.hooks"

    -- Define highlight groups for darker rainbow colors
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    -- Register a hook to set highlight colors according to the desired darker theme
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#A85C5C" })        -- Darker VS Code Red
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#AFAF6C" })     -- Darker VS Code Yellow
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#3F6B96" })       -- Darker VS Code Blue
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#A75B45" })     -- Darker VS Code Orange
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#4E7A4C" })      -- Darker VS Code Green
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#8C4E8B" })     -- Darker VS Code Violet
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#3B7B84" })       -- Darker VS Code Cyan

      -- Set normal gray for the in-scope line
      vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#808080" }) -- Normal gray
    end)

    -- Setup ibl with the highlight settings
    require("ibl").setup {
      indent = { 
        char = "▎", 
        highlight = highlight,
      },
      scope = { 
        char = "▎", 
        highlight = "IndentBlanklineContextChar", -- Use the normal gray highlight here
      },
    }
  end,
}
