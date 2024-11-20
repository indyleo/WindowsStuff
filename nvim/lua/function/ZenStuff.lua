-- Zen Toggles
local state = 0
function ToggleZen()
  state = (state + 1) % 2
  if state == 0 then
    vim.cmd("ZenMode")
    vim.cmd("ColorizerToggle")
    vim.opt.number = true
    vim.opt.foldcolumn = '1'
    vim.cmd("e")
    print("Zen Mode Off")
  elseif state == 1 then
    vim.cmd("ZenMode")
    vim.cmd("ColorizerToggle")
    vim.opt.number = false
    vim.opt.foldcolumn = '0'
    print("Zen Mode On")
  end
end
