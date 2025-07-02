vim.cmd("source ~/.config/nvim/base.vim")

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("config.lsp")
require("config.lazy")
