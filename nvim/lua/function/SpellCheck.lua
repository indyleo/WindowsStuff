-- Function to toggle spell checker
function ToggleSpellCheck()
  if vim.opt.spell:get() then
    vim.opt.spell = false
    vim.notify("Spell checker turned off", vim.log.levels.INFO)
  else
    vim.opt.spell = true
    vim.notify("Spell checker turned on", vim.log.levels.INFO)
  end
end
