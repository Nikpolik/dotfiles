-- local wk = require('which-key')
-- local chatgpt = require("chatgpt")
--
-- require("chatgpt").setup({
--     api_key_cmd = "op read op://Personal/vpt5nflxxyebpp37yrncocds6q/credential --no-newline"
-- })
--
-- wk.register({
--     p = {
--         name = "ChatGPT",
--         e = {
--             function()
--                 chatgpt.edit_with_instructions()
--             end,
--             "Edit with instructions",
--             mode = "v",
--         },
--         c = {
--             function()
--                 chatgpt.openChat()
--             end,
--             "Open chat",
--             mode = "n"
--         },
--     },
-- }, {
--     prefix = "<leader>",
-- })
