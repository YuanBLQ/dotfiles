return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-path",

            -- vsnip
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",

            -- "neovim/nvim-lspconfig",
        },

        config = function()
            local cmp = require 'cmp'
            cmp.setup {
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                sources = cmp.config.sources {
                    { name = "nvim_lsp" },
                    { name = "vsnip" },
                    { name = "path" },
                    { name = "buffer" },
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ['<A-CR>'] = cmp.mapping.complete(),
                }),
            }

            vim.diagnostic.config({
                -- virtual_text = true,
                virtual_text = false,
                signs = true,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
            })

            -- lsp server config
            local servers = {
                pyright = {},
            }
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            for server, config in pairs(servers) do
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
