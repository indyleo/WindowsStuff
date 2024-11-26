-- Source function
function SourceConf(target)
  local config_path
  local source_type
  local current_filename = vim.fn.expand("%:t")

  if target == Main then
    config_path = vim.fn.stdpath("config") .. "/init.lua"
    source_type = "init.lua"
  elseif target == Current then
    config_path = vim.api.nvim_buf_get_name(0)
    source_type = current_filename
  else
    vim.notify("Invalid target. Use Main or Current.", vim.log.levels.WARN)
    return
  end

  local success, err = pcall(function() vim.cmd("source " .. config_path) end)

  if success then
    vim.notify("Reloaded: " .. source_type .. " successfully", vim.log.levels.INFO)
  else
    vim.notify("Error reloading " .. source_type .. ": " .. err, vim.log.levels.ERROR)
  end
end

-- Define `Main` and `Current` as global variables for convenience
Main = "Main"
Current = "Current"
