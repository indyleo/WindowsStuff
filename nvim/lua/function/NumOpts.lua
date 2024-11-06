-- Function to toggle between relative only, number only, and both
local state = 0
function ToggleLineNumbers()
  state = (state + 1) % 4
  if state == 0 then
    vim.wo.number = true
    vim.wo.relativenumber = false
    print("Num On, Realitive Off")
  elseif state == 1 then
    vim.wo.number = false
    vim.wo.relativenumber = true
    print("Num Off, Realitive On")
  elseif state == 2 then
    vim.wo.number = true
    vim.wo.relativenumber = true
    print("Num On, Realitive On")
  elseif state == 3 then
    vim.wo.number = false
    vim.wo.relativenumber = false
    print("Num Off, Realitive Off")
  end
end
