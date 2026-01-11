-- In your plugins folder, create/edit a file
-- ~/.config/nvim/lua/plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = function()
    require("nvim-tree").setup(
        {
            view = {
                width = 10,
            },
        })
  end,
}

