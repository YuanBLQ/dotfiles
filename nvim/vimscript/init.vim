" Ref: https://github.com/neovim/neovim/issues/2437
let g:python_host_prog  = '~/.pyenv/shims/python'
let g:python3_host_prog = '~/.pyenv/shims/python'


" Plug
call plug#begin('~/.config/nvim/plugs')
Plug 'nvim-tree/nvim-web-devicons'
Plug 'simeji/winresizer' " <c-e> + hhh jjj kkk lll for resize window
Plug 'windwp/nvim-autopairs'
Plug 'folke/flash.nvim'
Plug 'numToStr/Comment.nvim'

Plug 'nvim-tree/nvim-tree.lua'

Plug 'nvim-lualine/lualine.nvim'

Plug 'lewis6991/gitsigns.nvim'

Plug 'folke/tokyonight.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'dense-analysis/ale'
Plug 'ranelpadon/python-copy-reference.vim'
call plug#end()


" Basic
syntax on

set mouse=
set nowrap
set ignorecase

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

set updatetime=300


function! HighlightExtraWhitespace()
  highlight ExtraWhitespace ctermbg=red guibg=#EC7063
  match ExtraWhitespace /\s\+$/
endfunction

autocmd BufWinEnter * if &buftype != 'terminal' | call HighlightExtraWhitespace() | endif

"保存时自动清理行尾空白
command! WS :%s/\s\+$//e
autocmd BufWrite * :WS


""""""""""" key map """""""""""
" set max height and width to current window
nnoremap <c-l> <c-w>_<c-w><bar>
nnoremap + <c-w>=:NvimTreeResize 30<CR>

" move to the begining/end of the line
noremap H 0
noremap L $

" emacs-style key bindings in cmd & ins mode
noremap! <c-a> <Home>
noremap! <c-e> <End>
noremap! <c-f> <Right>
noremap! <c-b> <Left>
noremap! <c-d> <Del>
noremap! <c-h> <BS>
noremap! <a-b> <S-Left>
noremap! <a-f> <S-Right>

" copy relative file path of current buffer
nmap cp :let @+ = expand("%")<cr>
"""""""""""""""""""""""""""""""

" " joshdick/onedark.vim
" colorscheme onedark
" " let g:airline_theme='onedark'
" let g:lightline = {
" \ 'colorscheme': 'onedark',
" \ }


colorscheme tokyonight-storm


lua << EOF
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true
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
        update_focused_file = {
            enable = false,
        },
    })

    require("gitsigns").setup({
        signs = {
            add          = { text = '+' },
            change       = { text = '~' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        current_line_blame = true,
        current_line_blame_opts = {
            delay = 300,
            ignore_whitespace = true,
        }
    })

    require("nvim-autopairs").setup {}

    require'nvim-treesitter.configs'.setup {
        auto_install = false,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
    }

    require('lualine').setup{
        options = {
            theme = 'auto',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
        },
        sections = {
            lualine_b = {'branch', 'diff'},
            lualine_c = {
                {
                   'filename',
                    path = 1,
                },
            },
            lualine_x = {'selectioncount', 'diagnostics', 'encoding'}
        },
        inactive_sections = {
            lualine_c = {
                {
                   'filename',
                    path = 1,
                    color = { fg = '#c0caf5' }
                },
            },
        }
    }

    require("flash").setup({
        mode = "exact",
        continue = true,
        search = {
            incremental = true,
        },
        modes = {
            char = {
                enabled = true,
                autohide = true,
                jump_labels = true,
                keys = { "f", "F" },
            }
        }
    })

    require("telescope").setup({})

    require("Comment").setup({})
EOF


" flash key map
nnoremap <a-j> <cmd>lua require('flash').jump()<cr>
nnoremap <a-J> <cmd>lua require('flash').jump({search = { forward = false }})<cr>


" Only run linters named in ale_linters settings.
let g:ale_disable_lsp = 1
let g:ale_use_neovim_diagnostics_api = 1

let g:ale_linters_explicit = 1
let g:ale_linters = {
  \  'proto': [ 'buf-lint' ],
\}
"  \  'python': ['ruff', 'mypy'],
"  \  'go': ['gopls'],
"let g:ale_python_mypy_show_notes = 1

let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \  'python': [ 'black', 'isort' ],
  \  'go': [ 'gofmt' ],
  \  'proto': [ 'clang-format' ],
\}
let g:ale_python_isort_options = '--profile black --ca'


" coc config
" Highlight the symbol and its references when holding the cursor
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <a-cr> coc#refresh()
nnoremap <silent><nowait> <space>a :CocDiagnostics<cr>
nnoremap <silent><nowait> <space>k <Plug>(coc-diagnostic-prev)
nnoremap <silent><nowait> <space>j <Plug>(coc-diagnostic-next)

au FileType go,python,c,javascript nmap <silent> gd :call CocAction('jumpDefinition', 'split')<CR>
au FileType go,python,c,javascript nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>
au FileType go,python,c,javascript nmap <silent> gl :call CocAction('jumpDefinition')<CR>
au FileType go,python,c,javascript nmap <silent> rf <Plug>(coc-refactor)
au FileType go,python,c,javascript nmap <silent> gr <Plug>(coc-references)
au FileType go,python,c,javascript nmap <silent> gi <Plug>(coc-implementation)
au FileType go,python,c,javascript nmap <silent> gt <Plug>(coc-type-definition)
au FileType go,python,c,javascript inoremap <silent> <A-k> <C-r>=CocActionAsync('showSignatureHelp')<CR>
au FileType go,python,c,javascript nmap <silent>  K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" copy python reference
nnoremap <A-c> :PythonCopyReferenceDotted<CR>
" nnoremap <Leader>rp :PythonCopyReferencePytest<CR>
" format like: from app.foo import bar
" nnoremap <Leader>ri :PythonCopyReferenceImport<CR>


" fzf 配置
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }    " 窗口形式展示
let $FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'
    \ --bind ctrl-d:preview-down,ctrl-u:preview-up,
    \ctrl-f:preview-page-down,
    \ctrl-b:preview-page-up"

" ProjectFiles tries to locate files relative to the git root contained in
" NerdTree, falling back to the current NerdTree dir if not available
" see https://github.com/junegunn/fzf.vim/issues/47#issuecomment-160237795
" function! s:find_git_root()
"     return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
" endfunction
" command! ProjectFiles execute 'FZF' s:find_git_root()

nmap <a-p> :Files<CR>
nmap <a-f> :Rg<CR>
nmap <a-w> :Windows<CR>


" custom defined command
command! NT :NvimTreeToggle
command! NR :NvimTreeResize 30
command! NF :NvimTreeFindFile | :NvimTreeResize 30

command! DC :call copilot#Dismiss()


