return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
          local configs = require("nvim-treesitter.configs")

          configs.setup({
              auto_install = true,
              ensure_installed = { "lua", "vim", "vimdoc","javascript", "html", "python" },
              sync_install = false,
              highlight = { enable = true, additional_vim_regex_highlighting = false },
              indent = { enable = true },
            })
        end
    }
}
