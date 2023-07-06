" Ref: https://github.com/neovim/neovim/issues/2437
let g:python_host_prog  = '~/.pyenv/shims/python'
let g:python3_host_prog = '~/.pyenv/shims/python'


" Plug
call plug#begin('~/.config/nvim/plugs')
Plug 'vim-airline/vim-airline'                          " 状态栏添加 git 相关信息
Plug 'joshdick/onedark.vim'                             " 配色

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'simeji/winresizer' " <c-e> + hhh jjj kkk lll for resize window

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dense-analysis/ale'

Plug 'lewis6991/gitsigns.nvim'
call plug#end()


" Basic
syntax on

set mouse=

set noswapfile
set undodir=~/.config/nvim/undodir              " 历史记录文件地址
set undofile                                    " 历史记录记录到文件中

" tab宽度
set tabstop=4                                   " tab 的可视化宽度
set softtabstop=4                               " tab 的空格数
set shiftwidth=4                                " 缩进的空格数
set expandtab                                   " tab 的时候转为空格
set smartindent                                 " tab respect 'tabstop', 'shiftwidth', 'softtabstop'
set autoindent                                  " 新行自动缩进
autocmd FileType go setlocal noexpandtab        " golang 文件中 tab 不要转为空格

set showmatch
set hlsearch
set incsearch                                   " 增量式搜索
set scrolloff=8                                 " 滚动的时候永远会和最上最下隔8行
set number                                      " 显示行号
set laststatus=2                                " 总是显示状态栏
set clipboard=unnamed                           " 共享系统剪切板
set cursorline                                  " 高亮光标所在行
set cursorcolumn                                " 高亮光标所在列
set backspace=2
set foldmethod=indent                           " 按照缩进折叠
set foldlevel=999

set list "Show tabs via listchars below, and display end sign after endo fline.
set listchars=space:·,tab:▸\ ,eol:¬,extends:❯,precedes:❮ "Chars that to display list.


" set max height and width to current window
nnoremap <c-l> <c-w>_ <c-w><bar>


" one-dark
colorscheme onedark
" let g:airline_theme='onedark'
let g:lightline = {
\ 'colorscheme': 'onedark',
\ }



" cmp
lua << EOF
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    -- empty setup using defaults
    require("nvim-tree").setup()
    -- OR setup with some options
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
    })

    -- Hook VimEnter for open nvim tree
    -- local function open_nvim_tree()
    --     -- open the tree
    --     require("nvim-tree.api").tree.open()
    --     -- move cursor to left window
    --     vim.cmd("wincmd l")
    -- end
    -- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

    -- A better solution based on QuitPre that checks if it's the last window
    -- Ref: https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#ppwwyyxx
    -- vim.api.nvim_create_autocmd("QuitPre", {
    --     callback = function()
    --         local invalid_win = {}
    --         local wins = vim.api.nvim_list_wins()
    --         for _, w in ipairs(wins) do
    --             local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
    --             if bufname:match("NvimTree_") ~= nil then
    --                 table.insert(invalid_win, w)
    --             end
    --         end
    --         if #invalid_win == #wins - 1 then
    --             -- Should quit, so we close all invalid windows.
    --             for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
    --         end
    --     end
    -- })


    require("gitsigns").setup()
EOF


" Only run linters named in ale_linters settings.
" let g:ale_disable_lsp = 1
" let g:ale_linters_explicit = 1
" let g:ale_linters = {
"   \   'python': ['mypy'],
"   \   'go': ['gopls'],
" \}
" let g:ale_fixers_explicit = 1
" let g:ale_fixers = {
"   \   'python': ['black', 'isort'],
"   \   'go': ['gofmt'],
" \}
" let g:ale_fix_on_save = 1
" let g:python_mypy_show_notes = 1
" let g:ale_python_isort_options = '--profile black --ca'


set updatetime=300

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

au FileType go,python,c,cpp,javascript,rust nmap <silent> gd :call CocAction('jumpDefinition', 'split')<CR>
au FileType go,python,c,cpp,javascript,rust nmap <silent> gl :call CocAction('jumpDefinition')<CR>
au FileType go,python,c,cpp,javascript,rust nmap <silent> rn <Plug>(coc-rename)
au FileType go,python,c,cpp,javascript,rust nmap <silent> rf <Plug>(coc-refactor)
au FileType go,python,c,cpp,javascript,rust nmap <silent> gr <Plug>(coc-references)
au FileType go,python,c,cpp,javascript,rust nmap <silent> gi <Plug>(coc-implementation)
au FileType go,python,c,cpp,javascript,rust nmap <silent> gt <Plug>(coc-type-definition)
au FileType go,python,c,cpp,javascript,rust nmap <silent>  K :call ShowDocumentation()<CR>
au FileType go,python,c,cpp,javascript,rust nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" fzf 配置
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }    " 窗口形式展示
let $FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'
    \ --bind ctrl-d:preview-down,ctrl-u:preview-up,
    \ctrl-f:preview-page-down,
    \ctrl-b:preview-page-up"

" ProjectFiles tries to locate files relative to the git root contained in
" NerdTree, falling back to the current NerdTree dir if not available
" see https://github.com/junegunn/fzf.vim/issues/47#issuecomment-160237795
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'FZF' s:find_git_root()

" 文件搜索
nmap <c-p> :Files<CR>
" 文件内容搜索
nmap <c-j> :Rg<CR>

" custom defined command
:command NT :NvimTreeFocus
