-- This files hosts all generic options needed to setup basic 
-- functionality and keymaps

local api = vim.api
local cmd = vim.cmd

-- Default TAB_WIDTH
local TAB_WIDTH = 2
vim.opt.tabstop = TAB_WIDTH
vim.opt.shiftwidth = TAB_WIDTH
vim.opt.expandtab = true


-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})


-- Navigate to previous file
api.nvim_set_keymap('n', '<leader>bb', ':b#<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>h', ':noh<CR>', { noremap = true, silent = true })

-- Enable mouse support
vim.cmd [[set mouse=a]]
