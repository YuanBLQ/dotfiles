return {
	{
		"stevearc/aerial.nvim",
		event = "VeryLazy",
		config = function()
			require("aerial").setup({
				-- optionally use on_attach to set keymaps when aerial has attached to a buffer
				on_attach = function(bufnr) end,
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			local function smart_enter(prompt_bufnr)
				local picker = action_state.get_current_picker(prompt_bufnr)
				local num_selections = #(picker:get_multi_selection())

				if num_selections == 0 then
					actions.select_default(prompt_bufnr)
				elseif num_selections == 1 then
					-- 只选中一个时默认也进入，不进入 quickfix
					actions.select_default(prompt_bufnr)
				else
					-- 选中多个时发送到 quickfix 并打开
					actions.send_selected_to_qflist(prompt_bufnr)
					actions.open_qflist(prompt_bufnr)
				end
			end

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
							["<CR>"] = smart_enter,
							["<C-k>"] = actions.preview_scrolling_up,
							["<C-j>"] = actions.preview_scrolling_down,
						},
					},
					layout_config = {
						width = 0.6,
						height = 0.6,
						horizontal = {
							preview_width = 0.45,
							results_width = 0.55,
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
					aerial = {
						-- Set the width of the first two columns (the second
						-- is relevant only when show_columns is set to 'both')
						col1_width = 4,
						col2_width = 30,
						-- How to format the symbols
						format_symbol = function(symbol_path, filetype)
							if filetype == "json" or filetype == "yaml" then
								return table.concat(symbol_path, ".")
							else
								return symbol_path[#symbol_path]
							end
						end,
						-- Available modes: symbols, lines, both
						show_columns = "lines",
					},
				},
			})
			-- load_extension, after setup function:
			telescope.load_extension("fzf")
			telescope.load_extension("aerial")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<a-p>", builtin.find_files, { desc = "Telescope find files" })
			-- vim.keymap.set("n", "<a-f>", function()
			-- 	require("telescope.builtin").live_grep({
			-- 		path_display = { "smart" },
			-- 	})
			-- end, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<a-b>", builtin.buffers, { desc = "Telescope buffers" })
			-- vim.keymap.set("n", "<a-h>", builtin.help_tags, { desc = "Telescope help tags" })

			vim.keymap.set("n", "gR", builtin.lsp_references, { desc = "Telescope list lsp references" })
			vim.keymap.set("n", "gS", builtin.git_status, { desc = "Telescope list git status" })

			-- vim.keymap.set("n", "<a-o>", "<Cmd>Telescope aerial<CR>", { desc = "Telescope find code symbols" })
			vim.keymap.set("n", "<a-o>", function()
				require("telescope").extensions.aerial.aerial({
					previewer = false,
					layout_config = {
						width = 0.3,
					},
				})
			end, { desc = "Telescope find code symbols" })

			require("config.highlights").load_telescope()
		end,
	},
	{
		"ibhagwan/fzf-lua",
		config = function()
			local FzfLua = require("fzf-lua")

			local fzf_colors
			-- Reuse Tokyonight's palette when available so fzf-lua follows the active theme
			local ok, tn_colors = pcall(require, "tokyonight.colors")
			if ok then
				local palette = tn_colors.setup()
				local set_hl = vim.api.nvim_set_hl

				set_hl(0, "FzfLuaNormal", { fg = palette.fg, bg = palette.bg_float })
				set_hl(0, "FzfLuaBorder", { fg = palette.border, bg = palette.bg_float })
				set_hl(0, "FzfLuaCursorLine", { fg = palette.fg, bg = palette.bg_highlight })
				set_hl(0, "FzfLuaMatch", { fg = palette.blue })
				set_hl(0, "FzfLuaPrompt", { fg = palette.cyan })
				set_hl(0, "FzfLuaPointer", { fg = palette.magenta })

				fzf_colors = {
					["fg"] = { "fg", "FzfLuaNormal" },
					["bg"] = { "bg", "FzfLuaNormal" },
					["hl"] = { "fg", "FzfLuaMatch" },
					["fg+"] = { "fg", "FzfLuaNormal" },
					["bg+"] = { "bg", "FzfLuaCursorLine" },
					["hl+"] = { "fg", "FzfLuaMatch" },
					["info"] = { "fg", "FzfLuaPrompt" },
					["prompt"] = { "fg", "FzfLuaPrompt" },
					["pointer"] = { "fg", "FzfLuaPointer" },
					["marker"] = { "fg", "FzfLuaPointer" },
					["spinner"] = { "fg", "FzfLuaPrompt" },
					["header"] = { "fg", "Comment" },
					["gutter"] = { "bg", "FzfLuaNormal" },
				}
			end
			FzfLua.setup({
				fzf_colors = fzf_colors,
				keymap = {
					builtin = {
						["<a-space>"] = "toggle-preview",
						["<c-j>"] = "preview-down",
						["<c-k>"] = "preview-up",
					},
					fzf = {
						["alt-a"] = "toggle-all",
						["ctrl-u"] = "unix-line-discard",
						["ctrl-d"] = false,
						["ctrl-f"] = false,
						["ctrl-b"] = false,
					},
				},
				actions = {
					files = {
						["enter"] = FzfLua.actions.file_edit_or_qf,
						["ctrl-x"] = FzfLua.actions.file_split,
						["ctrl-v"] = FzfLua.actions.file_vsplit,
						["ctrl-t"] = FzfLua.actions.file_tabedit,
						["alt-f"] = false,
					},
				},
				grep = {
					rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e",
					actions = {
						-- actions inherit from 'actions.files' and merge
						-- this action toggles between 'grep' and 'live_grep'
						["ctrl-f"] = { FzfLua.actions.grep_lgrep },
						-- '.gitignore' toggle for grep
						["ctrl-r"] = { FzfLua.actions.toggle_ignore },
					},
				},
			})

			-- keymaps
			vim.keymap.set("n", "<a-f>", FzfLua.live_grep, { desc = "FzfLua live grep" })
		end,
	},
}
