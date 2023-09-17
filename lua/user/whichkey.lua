local options = { noremap = true, silent = true }

set_key_n = function(key, action)
  vim.api.nvim_set_keymap('n', key, action, options)
end

set_key_n('<C-d>', '<C-d>zz')
set_key_n('<C-u>', '<C-u>zz')
set_key_n('<C-k>', ':UndotreeToggle<CR>')

vim.cmd[[ set clipboard+=unnamedplus ]]
