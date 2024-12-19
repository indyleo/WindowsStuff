return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		if vim.g.neovide then
			dashboard.section.header.val = {
				"                                                          ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███████╗ ███████╗",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║██╔═══██╗██╔════╝",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██║   ██║█████╗  ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║   ██║██╔══╝  ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║███████╔╝███████╗",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚══════╝ ╚══════╝",
				"                                                          ",
			}
		else
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
		end
		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", ":lua AskNewFileName()<CR>"),
			dashboard.button("SPC ee", "  > Toggle file explorer", ":Oil --float<CR>"),
			dashboard.button("SPC ff", "󰱼  > Find File", ":Telescope find_files<CR>"),
			dashboard.button("ce", "  > Config Nvim", ":Oil --float " .. vim.fn.stdpath("config") .. "<CR>"),
			dashboard.button(
				"ct",
				"  > Config WezTerm",
				":Oil --float " .. vim.loop.os_homedir() .. "/.config/wezterm/wezterm.lua<CR>"
			),
			dashboard.button(
				"cf",
				"  > Config FastFetch",
				":e " .. vim.loop.os_homedir() .. "/.config/fastfetch/config.jsonc<CR>"
			),
			dashboard.button(
				"cp",
				"  > Config Powershell",
				":Oil --float " .. vim.loop.os_homedir() .. "/Documents/Powershell<CR>"
			),
			dashboard.button(
				"cs",
				"  > Config Starship",
				":Oil --float " .. vim.loop.os_homedir() .. "/.config/starship.toml<CR>"
			),
			dashboard.button(
				"md",
				"  > Opens My Markdown Folder",
				":Oil --float " .. vim.loop.os_homedir() .. "/Documents/Markdown<CR>"
			),
			dashboard.button("q", "  > Quit Nvim", ":qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
