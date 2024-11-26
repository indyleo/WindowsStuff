-- Function to toggle between relative only, number only, and both
local state = 0
function ToggleLineNumbers()
  state = (state + 1) % 4
  if state == 0 then
    vim.wo.number = true
    vim.wo.relativenumber = false
    vim.notify("Num On, Realitive Off", vim.log.levels.INFO)
  elseif state == 1 then
    vim.wo.number = false
    vim.wo.relativenumber = true
    vim.notify("Num Off, Realitive On", vim.log.levels.INFO)
  elseif state == 2 then
    vim.wo.number = true
    vim.wo.relativenumber = true
    vim.notify("Num On, Realitive On", vim.log.levels.INFO)
  elseif state == 3 then
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.notify("Num Off, Realitive Off", vim.log.levels.INFO)
  end
end
