local option = vim.opt
local buffer = vim.b
local global = vim.g

-- option settings --
option.syntax = "on"
option.mouse = ""
option.wrap = false
option.swapfile = false
option.undofile = true
option.undodir = vim.fn.expand("~/.config/nvim/undodir")
option.tabstop = 4
option.softtabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.smartindent = true
option.autoindent = true
option.showmatch = true
option.hlsearch = true
option.incsearch = true                             -- 增量式搜索
option.scrolloff = 8
option.number = true
option.laststatus = 2                                -- 总是显示状态栏
option.clipboard = "unnamed"                           -- 共享系统剪切板
option.cursorline = true                                  -- 高亮光标所在行
option.cursorcolumn = true                                -- 高亮光标所在列
option.backspace = {"indent", "eol", "start"}
option.foldmethod = "indent"                           -- 按照缩进折叠
option.foldlevel = 999
-- option.exrc = true  -- 如果当前nvim打开的目录下有 .nvim.lua 类似文件 nvim 会去执行这种文件
option.splitright = false

option.list = true
option.listchars = "space:·,tab:▸ ,eol:¬,extends:❯,precedes:❮"

option.updatetime = 300

-- buffer settings --
buffer.fileencoding = "utf-8"

-- global settings --

-- key mappings --
vim.keymap.set({"n"}, "<c-l>", "<c-w>_ <c-w><bar>")

