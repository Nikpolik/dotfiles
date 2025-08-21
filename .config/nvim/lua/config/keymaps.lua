local wk = require("which-key")

wk.add({
  { "<leader>h",  "<CMD>noh<CR>",                             desc = "Clear highlight" },
  { "<leader>bb", "<CMD>b#<CR>",                              desc = "Prev buff" },
  { "gl",         "<CMD>lua vim.diagnostic.open_float()<CR>", desc = "Get line diagnostics" },
})
