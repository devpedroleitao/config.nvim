vim.keymap.set("n", "<leader>gr", ":Git for-each-ref --format='%(refname:short)' refs/remotes/origin<CR>", { noremap = true, silent = true })
