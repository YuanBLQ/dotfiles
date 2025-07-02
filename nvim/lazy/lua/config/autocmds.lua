vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "#EC7063" })
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.buftype ~= "terminal" then
			vim.cmd([[match ExtraWhitespace /\s\+$/]])
		end
	end,
})

-- 保存时自动清理行尾空白
vim.api.nvim_create_user_command("WS", [[:%s/\s\+$//e]], {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = ":WS",
})

-- golang 文件中 tab 不要转为空格
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.opt_local.expandtab = false
	end,
})
