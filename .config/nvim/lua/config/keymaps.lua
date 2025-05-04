local wk = require("which-key")

wk.add({
  { "<leader>h",  "<cmd>noh<cr>", desc = "Clear highlight" },
  { "<leader>bb", "<cmd>b#<cr>",  desc = "Prev buff" },
})
