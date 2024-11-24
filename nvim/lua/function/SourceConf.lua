-- Source function
function SourceConf(target)
  local config_path
  local source_type

  if target == Main then
    config_path = vim.fn.stdpath("config") .. "/init.lua"
    source_type = "Main configuration"
  elseif target == Current then
    config_path = vim.api.nvim_buf_get_name(0)
    source_type = "Current file"
  else
    print("Invalid target. Use Main or Current.")
    return
  end

  local success, err = pcall(vim.cmd, "source " .. config_path)  -- Use pcall for error handling

  if success then
    print("Reloaded " .. source_type .. " successfully")
  else
    print("Error reloading " .. source_type .. ": " .. err)
  end
end

-- Define `Main` and `Current` as global variables for convenience
Main = "Main"
Current = "Current"
