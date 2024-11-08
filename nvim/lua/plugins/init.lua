return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "ap/vim-css-color",
  "famiu/bufdelete.nvim",
  "karb94/neoscroll.nvim",
  config = function ()
    require('neoscroll').setup({})
  end
}
