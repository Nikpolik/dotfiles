return {
  {
    "tiagovla/tokyodark.nvim",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  {
    "loctvl842/monokai-pro.nvim",
    name = "monokai-pro",
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        filter = "pro",
        transparent_background = true,
        terminal_colors = true,
        devicons = true,
      })
      vim.cmd [[colorscheme monokai-pro]]
    end,
  }
}
