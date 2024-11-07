return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

    -- Shorten function name
    local keymap = vim.keymap.set
    -- Silent keymap option
    local opts = { noremap = true, silent = true }

    -- Harpoon add file
		keymap("n", "<leader>a", function()
			harpoon:list():add()
		end, {desc = "Marks a file"}, opts)
    
    -- Harpoon menu
		keymap("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, {desc = "Opens Harpoon Menu"}, opts)
	
  end,
}
