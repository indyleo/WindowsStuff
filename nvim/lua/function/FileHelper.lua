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

-- Ask what file to open then opens it in a horizontal split
function NewHSplit()
	local current_dir = vim.fn.getcwd()
	vim.ui.input({ prompt = "Enter file path: " }, function(filename)
		if filename ~= nil and filename ~= "" then
			local filepath = current_dir .. "\\" .. filename
			if vim.fn.filereadable(filepath) == 1 then
				vim.cmd("split " .. filename)
			else
				vim.notify("File does not exist in cwd", vim.log.levels.ERROR)
			end
		else
			vim.notify("No file created", vim.log.levels.WARN)
		end
	end)
end

-- Ask what file to open then opens it in a vertical split
function NewVSplit()
	local current_dir = vim.fn.getcwd()
	vim.ui.input({ prompt = "Enter file path: " }, function(filename)
		if filename ~= nil and filename ~= "" then
			local filepath = current_dir .. "\\" .. filename
			if vim.fn.filereadable(filepath) == 1 then
				vim.cmd("vsplit " .. filename)
			else
				vim.notify("File does not exist in cwd", vim.log.levels.ERROR)
			end
		else
			vim.notify("No file created", vim.log.levels.WARN)
		end
	end)
end
