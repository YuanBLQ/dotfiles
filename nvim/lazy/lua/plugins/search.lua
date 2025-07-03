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
						show_columns = "both",
					},
				},
			})
			-- load_extension, after setup function:
			telescope.load_extension("fzf")
			telescope.load_extension("aerial")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<a-p>", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<a-f>", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<a-b>", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<a-h>", builtin.help_tags, { desc = "Telescope help tags" })

			vim.keymap.set("n", "gR", builtin.lsp_references, { desc = "Telescope list lsp references" })
			vim.keymap.set("n", "gS", builtin.git_status, { desc = "Telescope list git status" })

			vim.keymap.set("n", "<a-o>", "<Cmd>Telescope aerial<CR>", { desc = "Telescope find code symbols" })

			require("config.highlights").load_telescope()
		end,
	},
}
