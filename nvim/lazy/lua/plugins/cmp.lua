return {
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		-- dependencies = { 'rafamadriz/friendly-snippets' },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				-- set to 'none' to disable the 'default' preset
				preset = "none",

				["<a-cr>"] = { "show", "show_documentation", "hide_documentation" },
				["<c-e>"] = { "hide" },
				["<cr>"] = { "accept", "fallback" },
				["<c-p>"] = { "select_prev", "fallback" },
				["<c-n>"] = { "select_next", "fallback" },

				-- ['<Tab>'] = { 'snippet_forward', 'fallback' },
				-- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

				-- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "normal",
			},

			completion = {
				documentation = { auto_show = true },
				list = {
					selection = {
						preselect = true,
					},
				},
				menu = {},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "buffer" },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"dense-analysis/ale",
		config = function()
			-- Configuration goes here.
			local g = vim.g

			-- Only run linters named in ale_linters settings.
			g.ale_disable_lsp = 1
			g.ale_use_neovim_diagnostics_api = 1

			-- linter
			g.ale_linters_explicit = 1
			g.ale_virtualtext_cursor = "disabled"
			g.ale_linters = {
				proto = { "buf-lint" },
				go = { "gopls" },
				-- python = {'ruff', 'mypy'}
			}
			-- g.ale_python_mypy_show_notes = 1

			-- fixer
			g.ale_fix_on_save = 1
			g.ale_fixers = {
				python = { "black", "isort" },
				-- brew install stylua
				lua = { "stylua" },
				rust = { "rustfmt" },
				go = { "gofmt" },
				proto = { "clang-format" },
				json = { "clang-format" },
				-- https://github.com/dense-analysis/ale/blob/master/doc/ale-sql.txt
				-- brew install pgformatter
				sql = { "pgformatter" },
				css = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
			}
			g.ale_python_isort_options = "--profile black --ca"
			g.ale_javascript_prettier_options = ""
		end,
	},
}
