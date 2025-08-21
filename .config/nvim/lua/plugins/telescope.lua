-- plugins/telescope.lua:
return {
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      extensions = {
        file_browser = {
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          initial_mode = "normal",
          hidden = true,
        },
      },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",             desc = "Find files" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",                desc = "Find buffers" },
      { "<leader>fr", "<cmd>Telescope oldfiles cwd_only=true<cr>", desc = "Find recent files" },
      { "<leader>st", "<cmd>Telescope live_grep<cr>",              desc = "Search text" },
      { "gd",         "<cmd>Telescope lsp_definitions<cr>",        desc = "Go to definition" },
      { "grr",        "<cmd>Telescope lsp_references<cr>",         desc = "Find references" }
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
}
