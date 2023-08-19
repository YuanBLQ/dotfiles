return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig",
            "folke/neodev.nvim", -- fix vim lsp
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                event = "LspAttach",
                opts = {},
            },
        },
        config = function()
            vim.lsp.set_log_level("debug")

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }

                    vim.keymap.set('n', 'gl', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gd', function()
                        vim.cmd("split")
                        vim.lsp.buf.definition()
                    end, opts)
                    vim.keymap.set('n', 'gv', function()
                        vim.cmd("vsplit")
                        vim.lsp.buf.definition()
                    end, opts)

                    vim.keymap.set("n", "<space>a", vim.diagnostic.setloclist, opts)
                    vim.keymap.set("n", "<space>j", vim.diagnostic.goto_next, opts)
                    vim.keymap.set("n", "<space>k", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)

                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })

            require("neodev").setup()
            require("mason").setup()

            local auto_installed_servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            workspace = { checkThirdParty = false },
                            telemetry = { enable = false },
                        }
                    }
                },
                jsonls = {},
            }
            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(auto_installed_servers),
            })

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            for server, config in pairs(auto_installed_servers) do
                require("lspconfig")[server].setup(
                    vim.tbl_deep_extend("keep",
                        {
                            capabilities = capabilities,
                        },
                        config
                    )
                )
            end
        end
    },
}
