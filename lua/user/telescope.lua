local tabs = require('telescope-tabs')
local actions = require('telescope.actions')

local options = { noremap = true, silent = true }

function set_key(combo, action)
  vim.api.nvim_set_keymap("n", combo, action, options)
end

set_key('<leader>st', ':Telescope live_grep<CR>')
set_key('<leader>sr', ':Telescope lsp_references<CR>')
set_key("<Leader>fr", ":Telescope oldfiles only_cwd=true<CR>")
set_key('<leader>ff', ':Telescope find_files<CR>')
set_key('<leader>fd', ":lua require('telescope.builtin').grep_string({search = 'TODO(nikpolik):'})<CR>")
set_key("<leader>sg", "<cmd>Telescope resume<cr>")
set_key("<leader>ft", ":Telescope telescope-tabs list_tabs<CR>")

set_key("<leader>xx", "<cmd>TroubleToggle<cr>")
set_key("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
set_key("<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")



require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
   },
})




require("telescope").load_extension("fzy_native")
 
