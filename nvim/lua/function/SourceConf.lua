-- Source function
function SourceConf()
    local config_path = vim.fn.expand("$HOME/AppData/Local/nvim/init.lua")  -- Use vim.fn.expand for better compatibility
    local success, err = pcall(vim.cmd, "source " .. config_path)  -- Use pcall for error handling

    if success then
        print("Reloaded configuration successfully")
    else
        print("Error reloading configuration: " .. err)
    end
end
