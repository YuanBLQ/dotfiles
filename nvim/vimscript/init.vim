" load basic config
source ~/.config/nvim/base.vim


" Plug
call plug#begin('~/.config/nvim/plugs')
Plug 'stevearc/dressing.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'HakonHarnes/img-clip.nvim'

" commit: 663246936325062427597964d81d30eaa42ab1e4
Plug 'nvim-lua/plenary.nvim'

" commit: 9bd559a03ccec98a458e60c705547119eb5350f3
Plug 'simeji/winresizer' " <c-e> + hhh jjj kkk lll for resize window
" commit: 426c04312ae67ac28dce38ccc5fafdd1ed4a3d9f
Plug 'yssl/QFEnter'
" commit: eac31b4797ce4fa9dd546f7b98ec32305527b19e
Plug 'windwp/nvim-autopairs'
" commit: 48817af25f51c0590653bbc290866e4890fe1cbe
Plug 'folke/flash.nvim'
" commit: 0236521ea582747b58869cb72f70ccfa967d2e89
Plug 'numToStr/Comment.nvim'
" commit: 9637670896b68805430e2f72cf5d16be5b97a22a
Plug 'lukas-reineke/indent-blankline.nvim', {'tag': 'v2.20.8'}
" commit: 833d8dd8b07eeda37a09e99460f72a02616935cb
Plug 'folke/todo-comments.nvim'
" commit: aec289a9fdabaa0ee6087d044d75b32e12084344
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'yuttie/comfortable-motion.vim'

" commit: 5efb8bd06841f91f97c90e16de85e96d57e9c862
Plug 'nvim-tree/nvim-web-devicons'
" commit: 7bdb220d0fe604a77361e92cdbc7af1b8a412126
Plug 'nvim-tree/nvim-tree.lua', {'on': ['NvimTreeToggle', 'NvimTreeFindFile']}

" commit: 566b7036f717f3d676362742630518a47f132fff
Plug 'nvim-lualine/lualine.nvim'

" commit: c5ff7628e19a47ec14d3657294cc074ecae27b99
Plug 'lewis6991/gitsigns.nvim'
" commit: 3dc498c9777fe79156f3d32dddd483b8b3dbd95f
Plug 'sindrets/diffview.nvim'
" commit: 562661972085a273914c8f702b11924f8aa573ea
Plug 'FabijanZulj/blame.nvim'

" commit: 67c6050e1ca41260c919236a098ba278472c7520
Plug 'folke/tokyonight.nvim'

" 'do': 'sudo npm install -g swagger-ui-watcher'
" commit: 4e1db32e7934c57d653846d5d297f7ea9ddb6ee8
Plug 'vinnymeller/swagger-preview.nvim', {'on': ['SwaggerPreview', 'SwaggerPreviewToggle']}

" commit: 09b0958b5f2b4ab0337f0c5125edba505462d162
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" commit: f6cb5b17897ff0c38f60fecd4b529678bcfec259
Plug 'junegunn/fzf.vim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'j-hui/fidget.nvim'
Plug 'stevearc/aerial.nvim'

" commit: 7b9e1ef0a1399907c51d23b6080b94a5aba4a654
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" commit: 97997c928bb038457f49343ffa5304d931545584
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" commit: 8922478a83cd06bfe5b82eb45279649adc4ec046
Plug 'dense-analysis/ale'
" commit: 8172d0ce83d730820d9497fd2e988046022d0b99
Plug 'ranelpadon/python-copy-reference.vim'

" Plug 'luozhiya/fittencode.nvim'
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
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

    -- require("flash").setup({
    --     mode = "exact",
    --     continue = true,
    --     search = {
    --         incremental = true,
    --     },
    --     modes = {
    --         char = {
    --             enabled = true,
    --             autohide = true,
    --             jump_labels = true,
    --             keys = { "f", "F" },
    --         }
    --     }
    -- })

    require("Comment").setup({})

    require("swagger-preview").setup({
        -- The port to run the preview server on
        port = 8730,
        -- The host to run the preview server on
        host = "localhost",
    })

    ------------------ cmp & lsp ------------------
    require("fidget").setup {
        notification = {
            override_vim_notify = true,
            filter = vim.log.levels.DEBUG,
        },
        logger = {
            level = vim.log.levels.DEBUG,
        }
    }

    local cmp = require 'cmp'
    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<a-cr>'] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'path' },
        }, {
            {
                name = 'buffer',
                option = {
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                    end
                }
            },
        })
    })
    -- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    -- cmp.setup.cmdline({ '/', '?' }, {
    --     mapping = cmp.mapping.preset.cmdline(),
    --     sources = {
    --         { name = 'buffer' }
    --     }
    -- })
    -- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    -- cmp.setup.cmdline(':', {
    --     mapping = cmp.mapping.preset.cmdline(),
    --     sources = cmp.config.sources({
    --         { name = 'path' }
    --         }, {
    --         { name = 'cmdline' }
    --     }),
    --     matching = { disallow_symbol_nonprefix_matching = false }
    -- })

    local capablities = require('cmp_nvim_lsp').default_capabilities()
    local on_lsp_attach = function(_, bufnr)
        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set(
            'n', 'gD',
            function()
                vim.cmd('split')
                vim.lsp.buf.declaration()
            end, opts
        )
        vim.keymap.set(
            'n', 'gd',
            function()
                vim.cmd('split')
                vim.lsp.buf.definition()
            end, opts
        )
        vim.keymap.set(
            'n', 'gv',
            function()
                vim.cmd('vsplit')
                vim.lsp.buf.definition()
            end, opts
        )
        vim.keymap.set(
            'n', 'gT',
            function()
                vim.cmd('tabnew')
                vim.lsp.buf.definition()
            end, opts
        )
        vim.keymap.set('n', 'gl', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('i', '<a-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<space>k', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<space>j', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<space>a', vim.diagnostic.setloclist, opts)
    end

    -- Python
    require'lspconfig'.pyright.setup{
        cmd = { 'pyright-langserver', '--stdio' },
        on_attach = on_lsp_attach,
        capabilities = capabilities,
    }
    -- Golang
    require('lspconfig').gopls.setup({
        on_attach = on_lsp_attach,
        capabilities = capabilities,
    })
    -- TypeScript
    require('lspconfig').ts_ls.setup{
        cmd = { 'typescript-language-server', '--stdio' },
        on_attach = on_lsp_attach,
        capabilities = capabilities,
    }

    vim.diagnostic.config({
        virtual_text = false,
    })

    require("aerial").setup({
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
      end,
    })
    -----------------------------------------------
    -- require('fittencode').setup({
    --     completion = 'source'
    -- })

    -- vim.api.nvim_create_user_command('DC',
    --     function()
    --         require('fittencode').dismiss_suggestions()
    --     end, {}
    -- )

    vim.opt.laststatus = 3

    require('img-clip').setup ({

    })
    require('avante_lib').load()
    require('avante').setup({
        ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
        provider = "openai", -- Recommend using Claude
        auto_suggestions_provider = "openai", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
        openai = {
            endpoint = "https://api.deepseek.com",
            model = "deepseek-coder",
            temperature = 0,
            max_tokens = 4096,
        },
        ---Specify the special dual_boost mode
        ---1. enabled: Whether to enable dual_boost mode. Default to false.
        ---2. first_provider: The first provider to generate response. Default to "openai".
        ---3. second_provider: The second provider to generate response. Default to "claude".
        ---4. prompt: The prompt to generate response based on the two reference outputs.
        ---5. timeout: Timeout in milliseconds. Default to 60000.
        ---How it works:
        --- When dual_boost is enabled, avante will generate two responses from the first_provider and second_provider respectively. Then use the response from the first_provider as provider1_output and the response from the second_provider as provider2_output. Finally, avante will generate a response based on the prompt and the two reference outputs, with the default Provider as normal.
        ---Note: This is an experimental feature and may not work as expected.
        dual_boost = {
            enabled = false,
            first_provider = "openai",
            second_provider = "claude",
            prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
            timeout = 60000, -- Timeout in milliseconds
        },
        behaviour = {
            auto_suggestions = false, -- Experimental stage
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = false,
            minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
        },
        mappings = {
            --- @class AvanteConflictMappings
            diff = {
                ours = "co",
                theirs = "ct",
                all_theirs = "ca",
                both = "cb",
                cursor = "cc",
                next = "]x",
                prev = "[x",
            },
            suggestion = {
                accept = "<M-l>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
            jump = {
                next = "]]",
                prev = "[[",
            },
            submit = {
                normal = "<CR>",
                insert = "<C-s>",
            },
            sidebar = {
                apply_all = "A",
                apply_cursor = "a",
                switch_windows = "<Tab>",
                reverse_switch_windows = "<S-Tab>",
            },
        },
        hints = { enabled = true },
        windows = {
            ---@type "right" | "left" | "top" | "bottom"
            position = "right", -- the position of the sidebar
            wrap = true, -- similar to vim.o.wrap
            width = 30, -- default % based on available width
            sidebar_header = {
                enabled = true, -- true, false to enable/disable the header
                align = "center", -- left, center, right for title
                rounded = true,
            },
            input = {
                prefix = "> ",
                height = 8, -- Height of the input window in vertical layout
            },
            edit = {
                border = "rounded",
                start_insert = true, -- Start insert mode when opening the edit window
            },
            ask = {
                floating = false, -- Open the 'AvanteAsk' prompt in a floating window
                start_insert = true, -- Start insert mode when opening the ask window
                border = "rounded",
                ---@type "ours" | "theirs"
                focus_on_apply = "ours", -- which diff to focus after applying
            },
        },
        highlights = {
            ---@type AvanteConflictHighlights
            diff = {
                current = "DiffText",
                incoming = "DiffAdd",
            },
        },
        --- @class AvanteConflictUserConfig
        diff = {
            autojump = true,
            ---@type string | fun(): any
            list_opener = "copen",
            --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
            --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
            --- Disable by setting to -1.
            override_timeoutlen = 500,
        },
    })
EOF


let g:comfortable_motion_friction = 180.0
let g:comfortable_motion_air_drag = 1.0

" start window resize mode by `<Leader>+e`
let g:winresizer_start_key = '<a-w>'
let g:winresizer_vert_resize = 3


" zerial outline
function! AerialNoPreviewFzf()
  let saved_fzf_opts = $FZF_DEFAULT_OPTS
  let $FZF_DEFAULT_OPTS = '--no-preview'

  let saved_fzf_layout = g:fzf_layout
  let g:fzf_layout = { 'window': { 'width': 0.3, 'height': 0.6 } }

  call aerial#fzf()

  let $FZF_DEFAULT_OPTS = saved_fzf_opts
  let g:fzf_layout = saved_fzf_layout
endfunction
nmap <silent> <a-o> <cmd>call AerialNoPreviewFzf()<cr>


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

"""""" install plugs """"""
" https://github.com/dense-analysis/ale/blob/master/doc/ale-sql.txt
" brew install pgformatter
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \  'python': [ 'black', 'isort' ],
  \  'go': [ 'gofmt' ],
  \  'proto': [ 'clang-format' ],
  \  'json': [ 'clang-format' ],
  \  'sql': [ 'pgformatter' ],
\}
let g:ale_python_isort_options = '--profile black --ca'


" coc config
" Highlight the symbol and its references when holding the cursor
" hi CocHighlightText cterm=underline gui=underline guisp=#ebdbb2
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" inoremap <silent><expr> <a-cr> coc#refresh()
" nnoremap <silent><nowait> <space>a :CocDiagnostics<cr>
" nnoremap <silent><nowait> <space>k <Plug>(coc-diagnostic-prev)
" nnoremap <silent><nowait> <space>j <Plug>(coc-diagnostic-next)
"
" au FileType go,python,c,javascript nmap <silent> gd :call CocAction('jumpDefinition', 'split')<CR>
" au FileType go,python,c,javascript nmap <silent> gv :call CocAction('jumpDefinition', 'vsplit')<CR>
" au FileType go,python,c,javascript nmap <silent> gT :call CocAction('jumpDefinition', 'tabnew')<CR>
" au FileType go,python,c,javascript nmap <silent> gl :call CocAction('jumpDefinition')<CR>
" au FileType go,python,c,javascript nmap <silent> rf <Plug>(coc-refactor)
" au FileType go,python,c,javascript nmap <silent> rn <Plug>(coc-rename)
" au FileType go,python,c,javascript nmap <silent> gr <Plug>(coc-references)
" au FileType go,python,c,javascript nmap <silent> gi <Plug>(coc-implementation)
" au FileType go,python,c,javascript nmap <silent> gt <Plug>(coc-type-definition)
" au FileType go,python,c,javascript inoremap <silent> <A-k> <C-r>=CocActionAsync('showSignatureHelp')<CR>
" au FileType go,python,c,javascript nmap <silent>  K :call ShowDocumentation()<CR>
" function! ShowDocumentation()
"   if CocAction('hasProvider', 'hover')
"     call CocActionAsync('doHover')
"   else
"     call feedkeys('K', 'in')
"   endif
" endfunction


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

" command! DC :call copilot#Dismiss()

command! DC lua require('fittencode').dismiss_suggestions()

" command! -range AD <line1>,<line2> :CocCommand cSpell.addWordToDictionary
