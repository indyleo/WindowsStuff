-- Zen Toggles
local state = 0
function ToggleZen()
	state = (state + 1) % 2
	if state == 0 then
		vim.cmd("ZenMode")
		vim.cmd("ColorizerToggle")
		vim.opt.number = true
		vim.opt.foldcolumn = "1"
		vim.lsp.start_client()
		vim.cmd("e")
		vim.notify("Zen Mode Off", vim.log.levels.INFO)
	elseif state == 1 then
		vim.cmd("ZenMode")
		vim.cmd("ColorizerToggle")
		vim.opt.number = false
		vim.opt.foldcolumn = "0"
		vim.lsp.stop_client()
		vim.notify("Zen Mode On", vim.log.levels.INFO)
	end
end
