-- Var
Start = "Start"
Stop = "Stop"
local server_pid = nil  -- Variable to store the server process ID

function HttpServer(action)
    if action == Start then
        -- Check if a server is already running
        if server_pid then
            print("Server is already running.")
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
                print("HTTP server stopped.")
                server_pid = nil  -- Reset PID when server stops
            end
        })

        if server_pid > 0 then
            print("HTTP server started.")
        else
            print("Failed to start the HTTP server.")
            server_pid = nil
        end
    elseif action == Stop then
        -- Stop the server if it's running
        if server_pid then
            vim.fn.jobstop(server_pid)
            print("Stopping the HTTP server...")
            server_pid = nil
        else
            print("No server is currently running.")
        end
    else
        print("Invalid action. Use 'Start' or 'Stop'.")
    end
end

return HttpServer
