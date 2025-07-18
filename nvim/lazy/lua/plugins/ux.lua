return {
	{
		"folke/tokyonight.nvim",
		-- "EdenEast/nightfox.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-storm")
			-- vim.cmd.colorscheme("nordfox")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		cmd = {
			"NT",
			"NF",
			"NR",
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
		keys = {
			{
				"<A-w>",
				"<Cmd>WinResizerStartResize<CR>",
				mode = "n",
				desc = "Start WinResizer",
			},
		},
		init = function()
			vim.g.winresizer_vert_resize = 3
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {
			notification = {
				override_vim_notify = true,
				filter = vim.log.levels.DEBUG,
			},
			logger = {
				level = vim.log.levels.DEBUG,
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_b = { "branch", "diff" },
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_x = { "selectioncount", "diagnostics", "encoding" },
			},
			inactive_sections = {
				lualine_c = {
					{
						"filename",
						path = 1,
						color = { fg = "#c0caf5" },
					},
				},
			},
		},
	},
}
