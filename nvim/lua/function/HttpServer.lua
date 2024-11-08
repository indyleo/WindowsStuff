-- Http Server 
function HttpServer(target)
  -- Start the server
  if target == "Start" then
    -- Only start the server if it's not already running
    if not vim.g.server_pid then
      -- Get the current directory where Neovim is opened
      local current_directory = vim.fn.getcwd()

      -- Command to run the Python HTTP server with the current directory
      local command = "python3 -m http.server --directory " .. current_directory

      -- Start the server in the background without keeping the terminal open
      local job = vim.fn.jobstart(command, {
        detach = true,
        stdout_buffered = false,  -- Don't capture stdout
        stderr_buffered = false,  -- Don't capture stderr
      })

      -- Check if the server started successfully
      if job > 0 then
        vim.g.server_pid = job  -- Store the server job ID (PID)
        print("Server started in the background.")
      else
        print("Failed to start server.")
      end
    else
      print("Server is already running.")
    end

  -- Stop the server
  elseif target == "Stop" then
    if vim.g.server_pid then
      -- Stop the HTTP server using the stored PID
      vim.fn.jobstop(vim.g.server_pid)
      vim.g.server_pid = nil  -- Reset the server PID
      print("Server stopped.")
    else
      print("No server is running.")
    end
  end
end

-- Vars
Start = "Start"
Stop = "Stop"

