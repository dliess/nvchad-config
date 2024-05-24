local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n', "<leader>a", mark.add_file)
vim.keymap.set('n', "<C-e>", ui.toggle_quick_menu)
-- vim.keymap.set('n', "<C-h>", ui.nav_file(1))
-- vim.keymap.set('n', "<C-j>", ui.nav_file(2))
-- vim.keymap.set('n', "<C-k>", ui.nav_file(3))
-- vim.keymap.set('n', "<C-l>", ui.nav_file(4))


-- require("harpoon").setup({
--     menu = {
--         width = vim.api.nvim_win_get_width(0) - 4,
--     }
-- })
