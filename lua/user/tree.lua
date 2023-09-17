local HEIGHT_RATIO = 0.85
local WIDTH_RATIO = 0.65

require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
  },
  filters = {
    dotfiles = false
  },
  view = {
    float = {
      enable = true,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = 'rounded',
          relative = 'editor',
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
        end,
    },
    width = function()
      return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    end,
  },
})

--
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- require("telescope").load_extension "file_browser"
--
-- vim.api.nvim_set_keymap(
--   "n",
--   "<space>fb",
--   ":Telescope file_browser path=%:p:h<CR>",
--   { noremap = true }
-- )
