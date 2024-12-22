---@diagnostic disable: undefined-field
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}
		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", ":lua AskNewFileName()<CR>"),
			dashboard.button("SPC ee", "  > Toggle file explorer", ":Oil --float<CR>"),
			dashboard.button("SPC ff", "󰱼  > Find File", ":Telescope find_files<CR>"),
			dashboard.button("ce", "  > Config Nvim", ':lua OilDir(vim.fn.stdpath("config"))<CR>'),
			dashboard.button(
				"ct",
				"  > Config WezTerm",
				':lua EditFile(vim.loop.os_homedir() .. "/.config/wezterm/", "wezterm.lua")<CR>'
			),
			dashboard.button(
				"cs",
				"  > Config Powershell",
				':lua OilDir(vim.loop.os_homedir() .. "/Documents/PowerShell")<CR>'
			),
			dashboard.button(
				"cp",
				"  > Config Starship",
				':lua EditFile(vim.loop.os_homedir() .. "/.config/", "starship.toml")<CR>'
			),
			dashboard.button(
				"cf",
				"  > Config FastFetch",
				':lua EditFile(vim.loop.os_homedir() .. "/.config/fastfetch/", "config.jsonc")<CR>'
			),
			dashboard.button(
				"md",
				"  > Opens My Markdown Folder",
				':lua OilDir(vim.loop.os_homedir() .. "/Documents/Markdown")<CR>'
			),
			dashboard.button("q", "  > Quit Nvim", ":qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
