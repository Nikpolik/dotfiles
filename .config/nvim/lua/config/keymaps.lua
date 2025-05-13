local wk = require("which-key")

wk.add({
  { "<leader>h",  "<cmd>noh<cr>", desc = "Clear highlight" },
  { "<leader>bb", "<cmd>b#<cr>",  desc = "Prev buff" },
  { "gl", "<CMD>lua vim.diagnostic.open_float()<CR>", desc = "Get line diagnostics" },
})
