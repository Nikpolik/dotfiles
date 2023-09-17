vim.g.t_Co=256   -- This is may or may not needed.

vim.opt.termguicolors = true
vim.opt.number = true


vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_transparent_background = true
vim.g.sonokai_enable_italic = true
-- vim.cmd [[ colorscheme sonokai ]]
local nightfox = require("nightfox")
nightfox.setup({
  options = {
    transparent = false
  }
})
-- vim.cmd [[ colorscheme nightfox ]]

require("catppuccin").setup({
  flavour = "frappe",
})
vim.cmd [[ colorscheme catppuccin-frappe ]]

-- local dracula = require("dracula")
-- dracula.setup({
--   show_end_of_buffer = true, -- default false
--   -- use transparent background
--   transparent_bg = true, -- default false
-- })
-- vim.cmd [[ colorscheme dracula ]]
-- vim.cmd [[ colorscheme dogrun ]]
-- vim.cmd [[ colorscheme spring-night ]]
--
-- vim.api.nvim_set_var("ayucolor", "dark")
-- vim.cmd [[ colorscheme ayu ]]
--

-- vim.api.nvim_set_var("spacegray_use_italics", 1)
-- vim.api.nvim_set_var("spacegray_low_contrast", 0)
-- vim.cmd [[ colorscheme spacegray ]]

-- vim.g.oh_lucy_evening_transparent_background = true
-- vim.g.oh_lucy_transparent_background = true
-- vim.cmd[[colorscheme oh-lucy]] -- for oh-lucy

-- vim.cmd [[ colorscheme purify ]]

-- vim.cmd [[colorscheme challenger_deep]]
-- vim.cmd[[ colorscheme nord ]]
--
-- vim.g.tokyonight_italic_functions = true
-- vim.cmd[[ colorscheme tokyonight ]]
--

vim.cmd [[ syntax on ]]

-- Transparency settings
-- vim.cmd [[hi Normal guibg=none ctermbg=none]]
vim.cmd [[hi LineNr guibg=none ctermbg=none]]
-- vim.cmd [[hi Folded guibg=none ctermbg=none]]
-- vim.cmd [[hi NonText guibg=none ctermbg=none]]
-- vim.cmd [[hi SpecialKey guibg=none ctermbg=none]]
-- vim.cmd [[hi VertSplit guibg=none ctermbg=none]]
vim.cmd [[hi SignColumn guibg=none ctermbg=none]]
-- vim.cmd [[hi EndOfBuffer guibg=none ctermbg=none]]
-- vim.cmd [[hi TelescopeNormal guibg=none ctermbg=none]]

