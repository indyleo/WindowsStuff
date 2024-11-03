-- Function to toggle spell checker
function ToggleSpellCheck()
    if vim.opt.spell:get() then
        vim.opt.spell = false
        print("Spell checker turned off")
    else
        vim.opt.spell = true
        print("Spell checker turned on")
    end
end

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

-- Function to toggle transparent background
local is_transparent = true
function ToggleTransparent()
    if is_transparent then
        vim.cmd("set background=dark")
        vim.cmd("hi Normal guibg=#1e1e2f")
        print("Transparent Off")
    else
        vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
        print("Transparent On")
    end
    is_transparent = not is_transparent
end

-- Custom Netrw
function CustomNetrw(resize_width, resize_height)
    -- Check if Netrw is already open
    local is_netrw_open = false
    local netrw_bufnr = vim.fn.bufnr("Netrw")

    -- Iterate through all open windows and check for Netrw buffer
    for _, win in ipairs(vim.fn.getwininfo()) do
        if win.bufnr == netrw_bufnr then
            is_netrw_open = true
            break
        end
    end

    if is_netrw_open then
        -- If Netrw is already open, close it
        vim.cmd("Lexplore")  -- This will toggle Netrw off
        print("Netrw closed.")
    else
        -- If Netrw is not open, open it
        vim.cmd("Lexplore")
        
        -- Resize the width if specified
        if resize_width then
            vim.cmd("vertical resize " .. resize_width)
        end
        
        -- Set height to maximum if not specified
        if resize_height then
            vim.cmd("resize " .. resize_height)
        else
            vim.cmd("resize " .. vim.o.lines)  -- Set height to maximum
        end
        
        print("Netrw opened with width " .. (resize_width or "default") .. " and height " .. (resize_height or "max") .. ".")
    end
end

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
