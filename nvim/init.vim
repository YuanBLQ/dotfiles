" Ref: https://github.com/neovim/neovim/issues/2437
let g:python_host_prog  = '~/.pyenv/shims/python'
let g:python3_host_prog = '~/.pyenv/shims/python'


" Plug
call plug#begin('~/.config/nvim/plugs')
Plug 'vim-airline/vim-airline'                          " 状态栏添加 git 相关信息
Plug 'joshdick/onedark.vim'                             " 配色
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " 交互终端文件管理器

Plug 'neovim/nvim-lspconfig'
" Plug 'tamago324/nlsp-settings.nvim'
" Plug 'williamboman/nvim-lsp-installer'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'dense-analysis/ale'
call plug#end()

" one-dark
colorscheme onedark
" let g:airline_theme='onedark'
let g:lightline = {
\ 'colorscheme': 'onedark',
\ }


" Basic
syntax on

set noswapfile
set undodir=~/.config/nvim/undodir  " 历史记录文件地址
set undofile						" 历史记录记录到文件中

" tab宽度
set tabstop=4                       " tab 的可视化宽度
set softtabstop=4                   " tab 的空格数
set shiftwidth=4                    " 缩进的空格数
set expandtab                       " tab 的时候转为空格
set smartindent                     " tab respect 'tabstop', 'shiftwidth', 'softtabstop'
set autoindent                      " 新行自动缩进

set showmatch
set hlsearch
set incsearch                       " 增量式搜索
set scrolloff=8                     " 滚动的时候永远会和最上最下隔8行
set number                          " 显示行号
set laststatus=2                    " 总是显示状态栏
set clipboard=unnamed               " 共享系统剪切板
set cursorline                      " 高亮光标所在行
set cursorcolumn                    " 高亮光标所在列
set backspace=2

set list "Show tabs via listchars below, and display end sign after endo fline.
set listchars=space:·,tab:▸\ ,eol:¬,extends:❯,precedes:❮ "Chars that to display list.


" cmp
lua << EOF
    -- Set up nvim-cmp.
    local cmp = require'cmp'

    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
        }, {
            { name = 'buffer' },
        })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = 'buffer' },
        })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
    })

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['pyright'].setup {
        capabilities = capabilities
    }
EOF


" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'python': ['black', 'mypy'],
\}
let g:ale_fixers_explicit = 1
let g:ale_fixers = {
  \   'python': ['black', 'isort'],
\}
let g:ale_fix_on_save = 1
let g:python_mypy_show_notes = 1
let g:ale_python_isort_options = '--profile black --ca'


"Split a horizontal window and Go to definition
au FileType go,python,c,javascript,swift,typescript nmap <silent> gd :split<cr> :lua vim.lsp.buf.definition()<CR>
" no window split and Go to definition
au FileType go,python,c,javascript,swift,typescript nmap <silent> gl :lua vim.lsp.buf.definition()<CR>
"Split a vertical window and Go to definition
au FileType go,python,c,javascript,swift,typescript nmap <silent> gv :vsplit<cr> :lua vim.lsp.buf.definition()<CR>
"Split a horizontal window and Go to declaration (many lsp servers don't implement this, check gd instead)
au FileType go,python,c,javascript,swift,typescript nmap <silent> gD :split<cr> :lua vim.lsp.buf.declaration()<CR>
"Split a window and show all references to this symbol under the cursor in the quickfix window
au FileType go,python,c,javascript,swift,typescript nmap <silent> gr :split<cr> :lua vim.lsp.buf.references()<CR>
"Split a window and show all implementations of this symbol under the cursor in the quickfix window
au FileType go,python,c,javascript,swift,typescript nmap <silent> gi :split<cr> :lua vim.lsp.buf.implementation()<CR>
"Show the documentation of the signature help message of this symbol under the cursor.
au FileType go,python,c,javascript,swift,typescript nmap <silent> <C-k> :lua vim.lsp.buf.signature_help()<CR>


" fzf 配置
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }    " 窗口形式展示
" let $FZF_DEFAULT_OPTS='--reverse'                                   " 往下展开

" ctrl-p 打开搜索框
" ProjectFiles tries to locate files relative to the git root contained in
" NerdTree, falling back to the current NerdTree dir if not available
" see https://github.com/junegunn/fzf.vim/issues/47#issuecomment-160237795
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'FZF' s:find_git_root()
nmap <c-p> :ProjectFiles<CR>
