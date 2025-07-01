return {
	{
		"yuttie/comfortable-motion.vim",
		config = function()
			vim.g.comfortable_motion_friction = 180.0
			vim.g.comfortable_motion_air_drag = 1.0
		end,
	},
	{
		"mg979/vim-visual-multi",
		init = function()
			vim.g.VM_maps = {
				["I BS"] = "",
				["Exit"] = "<C-c>",
				["Find Under"] = "<C-n>",
				["Find Subword Under"] = "<C-n>",
				["Add Cursor Down"] = "<C-j>",
				["Add Cursor Up"] = "<C-k>",
			}
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<A-j>",
				function()
					require("flash").jump()
				end,
				mode = "n",
				desc = "Flash Jump Forward",
			},
			{
				"<A-J>",
				function()
					require("flash").jump({ search = { forward = false } })
				end,
				mode = "n",
				desc = "Flash Jump Backward",
			},
		},
	},
}
