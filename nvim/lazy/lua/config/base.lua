local opt = vim.opt
local g = vim.g

-- python host
-- Ref: https://github.com/neovim/neovim/issues/2437
g.python_host_prog = vim.fn.expand("~/.pyenv/shims/python")
g.python3_host_prog = vim.fn.expand("~/.pyenv/shims/python")

opt.syntax = "on"
opt.mouse = ""
opt.wrap = false
opt.ignorecase = true

opt.swapfile = false
opt.undodir = vim.fn.expand("~/.config/nvim/undodir")
opt.undofile = true

-- tab 的可视化宽度
opt.tabstop = 4
-- tab 的空格数
opt.softtabstop = 4
-- 缩进的空格数
opt.shiftwidth = 4
-- tab 的时候转为空格
opt.expandtab = true
-- tab respect 'tabstop', 'shiftwidth', 'softtabstop'
opt.smartindent = true
-- 新行自动缩进
opt.autoindent = true

opt.showmatch = true
opt.hlsearch = true
-- 增量式搜索
opt.incsearch = true
-- 滚动的时候永远会和最上最下隔8行
opt.scrolloff = 8
opt.number = true
-- 总是显示状态栏
opt.laststatus = 2
-- 共享系统剪切板
opt.clipboard = "unnamed"
-- 高亮光标所在行
opt.cursorline = true
-- 高亮光标所在列
opt.cursorcolumn = true

-- indent：允许退格删除自动缩进的空白字符
-- eol（end of line）：允许退格删除换行符，即可以将当前行和上一行合并
-- 允许退格删除插入模式开始之前的字符
opt.backspace = "indent,eol,start"
-- 按照缩进折叠
opt.foldmethod = "indent"
opt.foldlevel = 999

-- 空白符可视化
opt.list = true
opt.listchars = { tab = "▸ ", eol = "¬", extends = "❯", precedes = "❮" }

opt.updatetime = 300

-- optionally enable 24-bit colour
opt.termguicolors = true
