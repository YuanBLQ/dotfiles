-- ftplugin installs a buffer-local mapping for Ctrl-C
-- reconfigure it to use <C-j> instead
-- ref: https://unix.stackexchange.com/questions/150093/vim-delay-when-using-ctrlc-but-only-in-sql-files
vim.g.ftplugin_sql_omni_key = "<C-j>"
