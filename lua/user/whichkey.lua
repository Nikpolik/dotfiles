local options = { noremap = true, silent = true }

set_key_n = function(key, action)
  vim.api.nvim_set_keymap('n', key, action, options)
end

set_key_n('<C-d>', 'C-d>zz')
set_key_n('<C-u>', '<C-u>zz')
set_key_n('<C-k>', ':UndotreeToggle<CR>')

set_key_n('<Leader>gdf', ':DiffviewOpen<CR>');
set_key_n('<Leader>gdc', ':DiffviewClose<CR>');

vim.api.nvim_set_keymap("v", "<Leader>gf", ":OpenInGHFileLines <CR>", { silent = true, noremap = true })

set_key_n('<Leader>cp', ':let @+ = expand("%")<CR>')


vim.cmd[[ set clipboard+=unnamedplus ]]
