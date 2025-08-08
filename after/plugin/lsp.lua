local lspconfig = require('lspconfig')
local neodev = require('neodev');
local lsp_zero = require('lsp-zero')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lsp_signature = require('lsp_signature')
local conform = require('conform')


neodev.setup({
    -- add any options here, or leave empty to use the default settings
})

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gtd", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    vim.keymap.set({ 'n', 'x', 'v' }, 'gq', function()
        local mode = vim.fn.mode()

        if mode == 'v' or mode == 'V' or mode == "\22" then
            local start_line = vim.fn.line("v")
            local end_line = vim.fn.line(".")
            if start_line > end_line then
                start_line, end_line = end_line, start_line
            end
            conform.format({
                range = { start = { start_line - 1, 0 }, ['end'] = { end_line - 1, math.huge } },
                lsp_fallback = true
            })
        else
            conform.format({ bufnr = opts.buffer, lsp_fallback = true })
        end
    end, opts)


    local cmp = require('cmp')
    cmp.setup({
        preselect = 'item',
        completion = {
            completeopt = 'menu,menuone,noinsert',
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-Space>'] = cmp.mapping.complete()
        }),
    })
end)

mason.setup({})
mason_lspconfig.setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    automatic_installation = true,
    ensure_installed = {
        "eslint",
        "lua_ls",
        "emmet_ls",
        "angularls",
        "ansiblels",
        "docker_compose_language_service",
        "eslint",
        "dockerls",
        "jdtls",
        "cssls",
        "somesass_ls",
        "yamlls",
        "bashls",
    },
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({})
        end,
        ts_ls = function()
            lspconfig.ts_ls.setup({
                capabilities = {
                    renameProvider = false
                },
                filetypes = { 'javascript', 'jsonc', 'typescript', 'html', 'typescriptreact', 'typescript.tsx', 'css', 'scss', 'angular.html' },
            })
        end,
        snyk_ls = function()
            lspconfig.snyk_ls.setup({
                init_options = {
                    integrationName = "NEOVIM",
                    authenticationMethod = "token",
                    token = os.getenv("SNYK_TOKEN"),
                    activateSnykOpenSource = "false",
                    activateSnykCode = "true",
                },
            })
        end,
        bashls = function()
            lspconfig.bashls.setup({
                filetypes = { 'sh', 'bash' },
            })
        end,
        lua_ls = function()
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    },
                },
            })
        end,
        emmet_ls = function()
            lspconfig.emmet_ls.setup({
                filetypes = { 'html', 'angular.html' },
            })
        end,
        angularls = function()
            lspconfig.angularls.setup({
                -- root_dir = lspconfig.util.root_pattern(".git"),
                filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx', 'css', 'scss', 'angular.html' },

            })
        end,
        ansiblels = function()
            lspconfig.ansiblels.setup({
                settings = {
                    ansible = {
                        ansible = {
                            path = "ansible"
                        },
                        executionEnvironment = {
                            enabled = false
                        },
                        python = {
                            interpreterPath = "python"
                        },
                        validation = {
                            enabled = true,
                            lint = {
                                enabled = true,
                                path = "ansible-lint"
                            }
                        }
                    }
                }
            })
        end,
        docker_compose_language_service = function()
            lspconfig.docker_compose_language_service.setup({
                filetypes = { 'yaml.docker-compose' }
            })
        end,
        eslint = function()
            lspconfig.eslint.setup({
                settings = {
                    experimental = {
                        useFlatConfig = true
                    },
                }
            })
        end,
        groovyls = function()
            lspconfig.groovyls.setup({
                cmd = { "java", "-jar", "/home/pedro/.local/lib/groovy-language-server-all.jar" },
            })
        end,
    },
})

lsp_signature.setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded"
    },
    close_timeout = 1000
})

vim.filetype.add({
    pattern = {
        [".*docker-compose.*"] = "yaml.docker-compose", -- sets the filetype to `angular.html` if it matches the pattern
    },
})

vim.api.nvim_create_autocmd("filetype", {
    pattern = "yaml.docker-compose",
    callback = function()
        vim.treesitter.language.register("yaml", "yaml.docker-compose") -- register the filetype with treesitter for the `angular` language/parser
    end,
})
