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

    vim.keymap.set({ 'n', 'x' }, 'gq', function()
        conform.format({ bufnr = opts.buffer, lsp_fallback = true })
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
    ensure_installed = {
        "tsserver",
        "eslint",
        "lua_ls",
        "angularls",
        "ansiblels",
        "docker_compose_language_service",
        "dockerls",
        "jdtls",
    },
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({})
        end,
        tsserver= function()
            lspconfig.tsserver.setup({
                capabilities = {
                    renameProvider = false
                },
                commands = {
                    OrganizeImports = {
                        function()
                            local params = {
                                command = "_typescript.organizeImports",
                                arguments = { vim.api.nvim_buf_get_name(0) },
                                title = ""
                            }
                            vim.lsp.buf.execute_command(params)
                        end
                    }
                },
                on_attach = function(client, bufnr)
                    local opts = { buffer = bufnr, remap = false }
                    vim.keymap.set("n", "<leader>oi", ':OrganizeImports<CR>', opts)
                end,
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
        jdtls = noop,
        -- jdtls = function()
        --     lspconfig.jdtls.setup({
        --         capabilities = jdtls.capabilities,
        --         init_options = {
        --             extendedClientCapabilities = {
        --                 classFileContentsSupport = true
        --             }
        --         }
        --     })
        -- end,
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
