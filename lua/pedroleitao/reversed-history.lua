-- Define a function to display command history in reverse order
function _G.show_reversed_history()
  local history = vim.fn.execute('history :')
  local lines = vim.split(history, '\n')
  for i = #lines, 1, -1 do
    print(lines[i])
  end
end

-- Map the function to a key, for example, <Leader>rh
vim.api.nvim_set_keymap('n', '<Leader>rh', ':lua show_reversed_history()<CR>', { noremap = true, silent = true })
