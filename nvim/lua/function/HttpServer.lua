-- Http Server 
function HttpServer(target)
  -- Start the server
  if target == "Start" then
    -- Only start the server if it's not already running
    if not vim.g.server_pid then
      -- Redirect server output to a log file in the current directory
      local job = vim.fn.jobstart("python3 -m http.server > http_server.log 2>&1", {
        detach = true,
      })
      -- Check if the server started successfully
      if job > 0 then
        vim.g.server_pid = job  -- Store the server job ID (PID)
        print("Server started. Logging to http_server.log.")
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
