-- Header Function
function InsertFileHeader()
  -- Get system username, date/time, and file type
  local user = os.getenv("USER") or os.getenv("USERNAME") or "unknown"
  local date_time = os.date("%A %B %d, %Y, %I:%M %p")
  local file_type = vim.bo.filetype or "unknown"

  -- Define a table mapping file types to comment styles
  local comment_styles = {
    -- "#" Comments
    python = "#",
    bash = "#",
    zsh = "#",
    fish = "#",
    sh = "#",
    jsonc = "#",
    yaml = "#",
    toml = "#",

    -- "//" Comments
    javascript = "//",
    c = "//",
    cpp = "//",

    -- Wrap Around Comments
    html = { "<!--", "-->" },
    css = { "/*", "*/" },

    -- "Other" Comments
    lua = "--",
    vim = "\"",
    autohotkey = ";",
  }

  -- Determine the comment style for the current file type
  local comment_symbol = comment_styles[file_type] or "#"

  -- Construct the comment string
  local comment
  if type(comment_symbol) == "table" then
    -- If comment_symbol is a table, use it as opening and closing comment
    comment = string.format("%s By: %s | %s | %s %s", comment_symbol[1], user, date_time, file_type, comment_symbol[2])
  else
    -- For single-line comments
    comment = string.format("%s By: %s | %s | %s", comment_symbol, user, date_time, file_type)
  end

  -- Insert the comment at the top of the file
  vim.api.nvim_buf_set_lines(0, 0, 0, false, { comment })
end

-- Create an autocommand to automatically add the header on new file creation
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*", -- Applies to all new files
  callback = InsertFileHeader,
})
