require("config.options")

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    }
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}
