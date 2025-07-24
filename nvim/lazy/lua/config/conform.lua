local M = {}

local current = "ale"

function M.setup(enable_format_on_save)
	require("conform").setup({
		formatters_by_ft = {
			-- Conform will run multiple formatters sequentially
			python = { "black", "isort" },
			-- brew install stylua
			lua = { "stylua" },
			rust = { "rustfmt" },
			go = { "gofmt" },
			proto = { "clang-format" },
			json = { "clang-format" },
			-- https://github.com/stevearc/conform.nvim/blob/master/lua/conform/formatters/pg_format.lua
			-- brew install pgformatter
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
					"--profile",
					"black",
					"--line-length",
					"128",
					"--ca",
					"--atomic", -- 如果格式错误则不更改文件
				},
			},
		},
		format_on_save = enable_format_on_save
				and {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			or nil,
	})
end

function M.switch(formatter)
	if formatter == "ale" then
		vim.g.ale_fix_on_save = 1
		M.setup(false)
		print("Switched to ALE")
		current = "ale"
	elseif formatter == "conform" then
		vim.g.ale_fix_on_save = 0
		M.setup(true)
		print("Switched to conform.nvim")
		current = "conform"
	else
		vim.api.nvim_err_writeln("Unknown formatter: " .. formatter)
	end
end

function M.complete(arglead, cmdline, cursorpos)
	return { "conform", "ale" }
end

return M
