local M = {}

function M.setup(enable_format_on_save)
    require("conform").setup({
        formatters_by_ft = {
            -- Conform will run multiple formatters sequentially
            python = { "black", "isort" },
            go = { "gofmt" },
            proto = { "clang-format" },
            json = { "clang-format" },
            sql = { "pg_format" },
            css = { "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
        },
        formatters = {
            isort = {
                prepend_args = {
                    "--profile", "black",
                    "--line-length", "128",
                    "--ca",
                    "--atomic",            -- 如果格式错误则不更改文件
                },
            },
        },
        format_on_save = enable_format_on_save and {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = "fallback",
        } or nil,
    })
end

return M
