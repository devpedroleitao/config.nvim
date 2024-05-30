local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pfh', function()
    builtin.find_files({ hidden = true, no_ignore = true })
end, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>psh', '<CMD>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--no-heading,--line-number,--column,--smart-case,--hidden,--no-ignore<CR>')

-- vim.keymap.set('n', '<leader>psh', function()
--     builtin.grep_string({ search = vim.fn.input("Grep Hidden> "), additional_args = { "--hidden" } });
-- end)
