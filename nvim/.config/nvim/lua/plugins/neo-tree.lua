return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        window = {
          width = 25, -- Set your desired width
        },
      },
    })
  end,
}
