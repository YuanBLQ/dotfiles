return {
    {
        "nvim-treesitter/nvim-treesitter",
        main = "nvim-treesitter.configs",
        build = ":TSUpdate",
        opts = {
            auto_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        }
    }
}
