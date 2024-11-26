-- Asking for file name
function AskNewFileName()
  local current_dir = vim.fn.getcwd()
  vim.ui.input({ prompt = "Enter new file name: " }, function(filename)
    if filename ~= nil and filename ~= "" then
      local filepath = current_dir .. "/" .. filename
      vim.cmd("e " .. filepath)
    else
      vim.notify("No file created", vim.log.levels.ERROR)
    end
  end)
end
