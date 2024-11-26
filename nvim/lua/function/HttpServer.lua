-- Var
Start = "Start"
Stop = "Stop"
local server_pid = nil  -- Variable to store the server process ID

function HttpServer(action)
  if action == Start then
    -- Check if a server is already running
    if server_pid then
      vim.notify("Server is already running.", vim.log.levels.WARN)
      return
    end

    -- Get the current working directory of Neovim
    local cwd = vim.fn.getcwd()

    -- Path to the Python script
    local python_script_path = vim.fn.expand(vim.fn.stdpath("config") .. "/scripts/httpserver.py")
    -- Construct the command to run the Python script
    local python_command = string.format("python %s %s 8000", python_script_path, cwd)

    -- Start the server asynchronously and store the process ID
    server_pid = vim.fn.jobstart(python_command, {
      detach = true,
      on_exit = function()
        vim.notify("HTTP server stopped.", vim.log.levels.INFO)
        server_pid = nil  -- Reset PID when server stops
      end
    })

    if server_pid > 0 then
      vim.notify("HTTP server started.", vim.log.levels.INFO)
    else
      vim.notify("Failed to start the HTTP server.", vim.log.levels.ERROR)
      server_pid = nil
    end
  elseif action == Stop then
    -- Stop the server if it's running
    if server_pid then
      vim.fn.jobstop(server_pid)
      vim.notify("Stopping the HTTP server...", vim.log.levels.INFO)
      server_pid = nil
    else
      vim.notify("No server is currently running.", vim.log.levels.INFO)
    end
  else
    vim.notify("Invalid action. Use 'Start' or 'Stop'.", vim.log.levels.WARN)
  end
end

return HttpServer
