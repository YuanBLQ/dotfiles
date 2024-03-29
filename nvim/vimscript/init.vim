" load basic config
source ~/.config/nvim/base.vim


" Plug
call plug#begin('~/.config/nvim/plugs')
" commit: 366b0837486f60ae0e7550c15de8ff66d057c4cd
Plug 'nvim-lua/plenary.nvim'

" commit: 9bd559a03ccec98a458e60c705547119eb5350f3
Plug 'simeji/winresizer' " <c-e> + hhh jjj kkk lll for resize window
" commit: 426c04312ae67ac28dce38ccc5fafdd1ed4a3d9f
Plug 'yssl/QFEnter'
" commit: 0f04d78619cce9a5af4f355968040f7d675854a1
Plug 'windwp/nvim-autopairs'
" commit: 48817af25f51c0590653bbc290866e4890fe1cbe
Plug 'folke/flash.nvim'
" commit: 0236521ea582747b58869cb72f70ccfa967d2e89
Plug 'numToStr/Comment.nvim'
" commit: 9637670896b68805430e2f72cf5d16be5b97a22a
Plug 'lukas-reineke/indent-blankline.nvim', {'tag': 'v2.20.8'}
" commit: 4a6737a8d70fe1ac55c64dfa47fcb189ca431872
Plug 'folke/todo-comments.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" commit: 5efb8bd06841f91f97c90e16de85e96d57e9c862
Plug 'nvim-tree/nvim-web-devicons'
" commit: 05f55c1fd6470b31627655c528245794e3cd4b2c
Plug 'nvim-tree/nvim-tree.lua', {'on': ['NvimTreeToggle', 'NvimTreeFindFile']}

" commit: 2248ef254d0a1488a72041cfb45ca9caada6d994
Plug 'nvim-lualine/lualine.nvim'

" commit: 6ef8c54fb526bf3a0bc4efb0b2fe8e6d9a7daed2
Plug 'lewis6991/gitsigns.nvim'
" commit: 3dc498c9777fe79156f3d32dddd483b8b3dbd95f
Plug 'sindrets/diffview.nvim'
Plug 'FabijanZulj/blame.nvim'

" commit: f247ee700b569ed43f39320413a13ba9b0aef0db
Plug 'folke/tokyonight.nvim'

" 'do': 'sudo npm install -g swagger-ui-watcher'
" commit: 4e1db32e7934c57d653846d5d297f7ea9ddb6ee8
Plug 'vinnymeller/swagger-preview.nvim', {'on': ['SwaggerPreview', 'SwaggerPreviewToggle']}

" commit: 6b99399c41d9818ee4b4fa8968a1249100008e4c
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" commit: 1e054c1d075d87903647db9320116d360eb8b024
Plug 'junegunn/fzf.vim'

" commit: 7b9e1ef0a1399907c51d23b6080b94a5aba4a654
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" commit: 8f16c39f5b439bd9540336c4d5da705d180e34b9
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" commit: 1ccd99e113324602b4eca41fd24ba6f991e8f05d
Plug 'dense-analysis/ale'
" commit: 8172d0ce83d730820d9497fd2e988046022d0b99
Plug 'ranelpadon/python-copy-reference.vim'
call plug#end()


colorscheme tokyonight-storm


lua << EOF
    require("todo-comments").setup({
        -- keywords recognized as todo comments
        keywords = {
            FIX = {
                icon = " ", -- icon used for the sign, and in search results
                color = "error", -- can be a hex color, or a named color (see below)
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                -- signs = false, -- configure signs for some keywords individually
            },
            TODO = { icon = " ", color = "error" },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
            TEST = { icon = "⏲ ", color = "test", alt = { "TESTING" } },
        },
        -- list of named colors where we try to extract the guifg from the
        -- list of highlight groups or use the hex color if hl not found as a fallback
        colors = {
            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
            info = { "DiagnosticInfo", "#2563EB" },
            hint = { "DiagnosticHint", "#10B981" },
            default = { "Identifier", "#7C3AED" },
            test = { "Identifier", "#FF00FF" },
        },
    })

    require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = false,
    }

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
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

    require('blame').setup({
        width = 47,
    })

    require("nvim-autopairs").setup {}

    require('nvim-treesitter.configs').setup {
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

    require("Comment").setup({})

    require("swagger-preview").setup({
        -- The port to run the preview server on
        port = 8730,
        -- The host to run the preview server on
        host = "localhost",
    })
EOF


" start window resize mode by `<Leader>+e`
let g:winresizer_start_key = '<a-w>'


" flash key map
nnoremap <a-j> <cmd>lua require('flash').jump()<cr>
nnoremap <a-J> <cmd>lua require('flash').jump({search = { forward = false }})<cr>


" Only run linters named in ale_linters settings.
let g:ale_disable_lsp = 1
let g:ale_use_neovim_diagnostics_api = 1

let g:ale_linters_explicit = 1
let g:ale_linters = {
  \  'proto': [ 'buf-lint' ],
  \  'go': ['gopls'],
\}
"  \  'python': ['ruff', 'mypy'],
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
" hi CocHighlightText cterm=underline gui=underline guisp=#ebdbb2
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
au FileType go,python,c,javascript nmap <silent> gT :call CocAction('jumpDefinition', 'tabnew')<CR>
au FileType go,python,c,javascript nmap <silent> gl :call CocAction('jumpDefinition')<CR>
au FileType go,python,c,javascript nmap <silent> rf <Plug>(coc-refactor)
au FileType go,python,c,javascript nmap <silent> rn <Plug>(coc-rename)
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
" select some results to the quickfix list: https://github.com/junegunn/fzf.vim/issues/192#issuecomment-249217695
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }    " 浮窗形式展示
" let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'none' } }  " 底部窗口
let $FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'
    \ --bind ctrl-j:preview-down,ctrl-k:preview-up
    \ --color hl:underline,hl+:underline"

nmap <a-p> :Files<CR>
nmap <a-f> :Rg<CR>
" nmap <a-w> :Windows<CR>


" QFEnter
let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['<CR>']
let g:qfenter_keymap.vopen = ['<c-v>']
let g:qfenter_keymap.hopen = ['<c-x>']

" todo-comment
" list todo-comment of current file in quickfix
" Ref: https://github.com/folke/todo-comments.nvim/issues/110
nmap <a-d> :exe ":TodoQuickFix cwd=" .. fnameescape(expand("%"))<CR>

" mg979/vim-visual-multi
let g:VM_maps = {}
" disable backspace mapping to solve the problem:
"   https://github.com/mg979/vim-visual-multi/issues/172#issuecomment-1092293500
let g:VM_maps["I BS"]               = ''
let g:VM_maps["Exit"]               = '<C-c>'
let g:VM_maps["Find Under"]         = '<C-n>'
let g:VM_maps["Find Subword Under"] = '<C-n>'
let g:VM_maps["Add Cursor Down"]    = '<C-j>'
let g:VM_maps["Add Cursor Up"]      = '<C-k>'

" custom defined command
command! NT :NvimTreeToggle
command! NR :NvimTreeResize 30
command! NF :NvimTreeFindFile | :NvimTreeResize 30

command! DC :call copilot#Dismiss()

" command! -range AD <line1>,<line2> :CocCommand cSpell.addWordToDictionary
