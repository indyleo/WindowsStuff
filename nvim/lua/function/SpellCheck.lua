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
