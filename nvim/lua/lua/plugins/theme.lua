return {
    {
        "folke/tokyonight.nvim",
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            -- "utilyre/barbecue.nvim",
            -- "SmiteshP/nvim-navic",
        },
        config = function()
            vim.cmd[[colorscheme tokyonight-storm]]
            require("lualine").setup({
                options = {
                    theme = 'tokyonight',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                },
                sections = {
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {
                        {
                            'filename',
                            path = 1,
                        },
                    },
                    lualine_x = {'selectioncount', 'encoding'}
                }
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = true,
    }
}
