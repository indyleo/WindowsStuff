return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- Define Dark+ inspired colors for different modes
		local colors = {
			normal = { bg = "#0E639C", fg = "#d4d4d4" }, -- Blue
			insert = { bg = "#B5A200", fg = "#d4d4d4" }, -- Yellow
			visual = { bg = "#68217A", fg = "#d4d4d4" }, -- Purple
			replace = { bg = "#D16969", fg = "#d4d4d4" }, -- Red
			command = { bg = "#6A9955", fg = "#d4d4d4" }, -- Green
			inactive = { bg = "#1e1e1e", fg = "#d4d4d4" }, -- Default inactive
		}

		-- Configure lualine with dynamic mode color changing based on Dark+ colors
		lualine.setup({
			options = {
				theme = {
					normal = {
						a = colors.normal,
						b = { bg = "#1e1e1e", fg = "#d4d4d4" },
						c = { bg = "#1e1e1e", fg = "#d4d4d4" },
					},
					insert = {
						a = colors.insert,
						b = { bg = "#1e1e1e", fg = "#d4d4d4" },
						c = { bg = "#1e1e1e", fg = "#d4d4d4" },
					},
					visual = {
						a = colors.visual,
						b = { bg = "#1e1e1e", fg = "#d4d4d4" },
						c = { bg = "#1e1e1e", fg = "#d4d4d4" },
					},
					replace = {
						a = colors.replace,
						b = { bg = "#1e1e1e", fg = "#d4d4d4" },
						c = { bg = "#1e1e1e", fg = "#d4d4d4" },
					},
					command = {
						a = colors.command,
						b = { bg = "#1e1e1e", fg = "#d4d4d4" },
						c = { bg = "#1e1e1e", fg = "#d4d4d4" },
					},
					inactive = {
						a = colors.inactive,
						b = { bg = "#1e1e1e", fg = "#d4d4d4" },
						c = { bg = "#1e1e1e", fg = "#d4d4d4" },
					},
				},
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#D97D28" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_c = {
					{ "filename" },
					{ "aerial", dense = true },
				},
			},
		})
	end,
}
