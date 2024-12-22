-- Cd into dir and open Oil in that dir
function OilDir(path)
	local dirpath = path:gsub("\\", "/") .. "/"
	vim.cmd("cd " .. vim.fn.fnameescape(dirpath))
	vim.cmd("Oil --float")
end

-- Cd into dir and open file
function EditFile(dirpath, filename)
	local escaped_dirpath = dirpath:gsub("\\", "/") .. "/"
	local filepath = escaped_dirpath .. filename
	vim.cmd("cd " .. vim.fn.fnameescape(escaped_dirpath))
	vim.cmd("edit " .. vim.fn.fnameescape(filepath))
end

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
