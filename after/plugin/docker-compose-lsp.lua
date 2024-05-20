vim.filetype.add({
    pattern = {
        ['.*docker%-compose.*%.yml'] = 'yaml.docker-compose',
        ['.*docker%-compose.*%.yaml'] = 'yaml.docker-compose',
    },
})

vim.api.nvim_create_autocmd("filetype", {
    pattern = "yaml.docker-compose",
    callback = function()
        vim.treesitter.language.register("yaml", "yaml.docker-compose") -- register the filetype with treesitter for the `angular` language/parser
    end,
})
