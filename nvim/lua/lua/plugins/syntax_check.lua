return {
    "dense-analysis/ale",
    config = function()
        vim.g.ale_disable_lsp = 1
        vim.g.ale_use_neovim_diagnostics_api = 1

        vim.g.ale_linters_explicit = 1
        -- vim.g.ale_linters = {
        --     python = { 'pyright', 'ruff', 'mypy' }
        -- }

        vim.g.ale_fix_on_save = 1
        vim.g.ale_python_isort_options = "--profile black --ca"
        vim.g.ale_fixers = {
            python = { "black", "isort" },
        }
    end
}
