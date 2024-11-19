-- Asking for file name
function AskNewFileName()
  local current_dir = vim.fn.getcwd()
  vim.ui.input({ prompt = "Enter new file name: " }, function(filename)
    if filename ~= nil and filename ~= "" then
      local filepath = current_dir .. "/" .. filename
      vim.cmd("e " .. filepath)
    else
      print("No file created")
    end
  end)
end
