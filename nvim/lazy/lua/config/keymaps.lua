local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader
vim.g.mapleader = " "

-- 窗口最大化 & 自动调整宽度
keymap("n", "<C-l>", "<C-w>_<C-w><Bar>", opts)
keymap("n", "+", "<C-w>=:NvimTreeResize 30<CR>", opts)

-- 行首行尾
keymap("n", "H", "0", opts)
keymap("n", "L", "$", opts)

-- tab 移动
keymap("n", "<A-l>", ":tabn<CR>", opts)
keymap("n", "<A-h>", ":tabp<CR>", opts)
keymap("n", "<A-n>", ":tabnew<CR>", opts)
keymap("n", "<A-N>", function()
	local line = vim.fn.line(".")
	vim.cmd("tabnew +" .. line .. " %")
end, opts)

-- emacs 风格插入模式
keymap({ "i", "c" }, "<C-a>", "<Home>", opts)
keymap({ "i", "c" }, "<C-e>", "<End>", opts)
keymap({ "i", "c" }, "<C-f>", "<Right>", opts)
keymap({ "i", "c" }, "<C-b>", "<Left>", opts)
keymap({ "i", "c" }, "<C-d>", "<Del>", opts)
keymap({ "i", "c" }, "<C-h>", "<BS>", opts)
keymap({ "i", "c" }, "<A-b>", "<S-Left>", opts)
keymap({ "i", "c" }, "<A-f>", "<S-Right>", opts)

-- 复制相对路径
keymap("n", "cp", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
end, opts)

-- 删除/改动不复制
keymap("n", "c", '"_d', opts)
keymap("v", "c", '"_di', opts)
keymap("n", "s", '"_d', opts)
keymap("v", "s", '"_di', opts)

-- visual 模式粘贴不复制原内容
keymap("v", "p", '"_dP', opts)

-- :W 保存所有
vim.api.nvim_create_user_command("W", ":wa", {})
