return {
	"Mofiqul/vscode.nvim",
	priority = 1000,
	config = function()
		local vscode = require("vscode")
		local c = vscode.colors or {} -- Safely access colors or use an empty table
		vscode.setup({
			-- Enable transparent background
			transparent = true,

			-- Enable italic comment
			italic_comments = true,

			-- Underline `@markup.link.*` variants
			underline_links = true,

			-- Disable nvim-tree background color
			disable_nvimtree_bg = true,

			-- Override colors (see ./lua/vscode/colors.lua)
			color_overrides = {
				vscLineNumber = "#FFFFFF",
			},

			-- Override highlight groups (see ./lua/vscode/theme.lua)
			group_overrides = {
				-- Use colors from the vscode colors table
				Cursor = { fg = c.vscDarkBlue or "#0000FF", bg = c.vscLightGreen or "#00FF00", bold = true },
			},
		})
		-- Load the theme without affecting devicon colors.
		vim.cmd.colorscheme("vscode")
	end,
}
