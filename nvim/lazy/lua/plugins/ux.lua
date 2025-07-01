return {
	{
		"folke/tokyonight.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-lua/plenary.nvim" },
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-storm")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

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

			-- custom command
			vim.api.nvim_create_user_command("NT", "NvimTreeToggle", { desc = "Toggle NvimTree" })
			vim.api.nvim_create_user_command("NR", "NvimTreeResize 30", { desc = "Resize NvimTree to 30" })
			vim.api.nvim_create_user_command(
				"NF",
				"NvimTreeFindFile | NvimTreeResize 30",
				{ desc = "Find file and resize" }
			)
		end,
	},
	{
		"simeji/winresizer",
		config = function()
			vim.keymap.set("n", "<a-w>", "<Cmd>WinResizerStartResize<CR>", {})
			vim.g.winresizer_vert_resize = 3
		end,
	},
}
