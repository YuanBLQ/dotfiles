return {
    {
        "lewis6991/gitsigns.nvim",
        config = {},
    },
    {
        "simeji/winresizer",
        config = function()
        end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            -- set termguicolors to enable highlight groups
            vim.opt.termguicolors = true


            vim.api.nvim_create_user_command("NT", ":NvimTreeFocus", {})
            vim.api.nvim_create_user_command("NR", ":NvimTreeResize 30", {})

            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = false,
                },
                update_focused_file = {
                    enable = false,
                },
            })
        end
    },
}
