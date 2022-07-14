
local toggleterm = require("toggleterm")

toggleterm.setup {
  open_mapping = [[<c-t>]],
  direction = 'float'
}

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  local set_buf_key = vim.api.nvim_buf_set_keymap

  set_buf_key(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  set_buf_key(0, 't', 'jk', [[<C-\><C-n>]], opts)
  set_buf_key(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  set_buf_key(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  set_buf_key(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  set_buf_key(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
