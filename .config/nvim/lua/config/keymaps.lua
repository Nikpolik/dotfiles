local wk = require("which-key")

wk.add({
  { "<leader>h",  "<CMD>noh<CR>",                             desc = "Clear highlight" },
  { "<leader>bb", "<CMD>b#<CR>",                              desc = "Prev buff" },
  { "gl",         "<CMD>lua vim.diagnostic.open_float()<CR>", desc = "Get line diagnostics" },
  { "<leader>yp", function()
      local relative_path = vim.fn.expand('%:p:.')
      vim.fn.setreg('+', relative_path)
      vim.notify('Copied: ' .. relative_path, vim.log.levels.INFO)
    end, desc = "Copy cwd-relative path" },
})
