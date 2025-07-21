return {
	{
		"ranelpadon/python-copy-reference.vim",
		config = function()
			vim.keymap.set("n", "<a-c>", "<Cmd>PythonCopyReferenceDotted<CR>", {})
			-- nnoremap <Leader>rp :PythonCopyReferencePytest<CR>
			-- format like: from app.foo import bar
			-- nnoremap <Leader>ri :PythonCopyReferenceImport<CR>
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"yssl/QFEnter",
		config = function()
			vim.g.qfenter_keymap = {
				open = { "<CR>" },
				vopen = { "<c-v>" },
				hopen = { "<c-x>" },
			}
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		version = "v2.20.8",
		opts = {
			show_current_context = true,
			show_current_context_start = false,
		},
	},
	{
		"folke/todo-comments.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<A-d>", function()
				local file = vim.fn.expand("%")
				local escaped = vim.fn.fnameescape(file)
				vim.cmd("TodoQuickFix cwd=" .. escaped)
			end, { desc = "Todo in current file" })

			require("todo-comments").setup({
				keywords = {
					FIX = {
						icon = " ", -- icon used for the sign, and in search results
						color = "error", -- can be a hex color, or a named color (see below)
						alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
						-- signs = false, -- configure signs for some keywords individually
					},
					TODO = { icon = " ", color = "error" },
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
					TEST = { icon = "⏲ ", color = "test", alt = { "TESTING" } },
				},
				-- list of named colors where we try to extract the guifg from the
				-- list of highlight groups or use the hex color if hl not found as a fallback
				colors = {
					error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
					warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
					info = { "DiagnosticInfo", "#2563EB" },
					hint = { "DiagnosticHint", "#10B981" },
					default = { "Identifier", "#7C3AED" },
					test = { "Identifier", "#FF00FF" },
				},
			})
		end,
	},
}
