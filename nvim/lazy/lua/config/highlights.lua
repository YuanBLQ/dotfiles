local M = {}

function M.load_telescope()
	local set_hl = vim.api.nvim_set_hl
	local ns = 0 -- 0 表示全局

	set_hl(ns, "TelescopeNormal", { bg = "#1e1e2e", fg = "#cdd6f4" })
	set_hl(ns, "TelescopeBorder", { bg = "#1e1e2e", fg = "#89b4fa" })
	set_hl(ns, "TelescopePromptBorder", { bg = "#1e1e2e", fg = "#f38ba8" })
	set_hl(ns, "TelescopePromptNormal", { bg = "#1e1e2e", fg = "#f38ba8" })
	set_hl(ns, "TelescopePromptPrefix", { bg = "#1e1e2e", fg = "#f38ba8" })
	set_hl(ns, "TelescopeSelection", { bg = "#313244", fg = "#f9e2af" })
	set_hl(ns, "TelescopeMatching", { fg = "#a6e3a1" })
end

return M
