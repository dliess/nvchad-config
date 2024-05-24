vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""
vim.keymap.set('i', '<leader><CR>', 'copilot#Accept("\\<CR>")', {
   expr = true,
   replace_keycodes = false
})
