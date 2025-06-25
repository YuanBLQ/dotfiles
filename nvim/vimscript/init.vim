" load basic config
source ~/.config/nvim/base.vim


" Plug
call plug#begin('~/.config/nvim/plugs')
" commit: 2d7c2db2507fa3c4956142ee607431ddb2828639
Plug 'stevearc/dressing.nvim'
" commit: 8d3bce9764e627b62b07424e0df77f680d47ffdb
Plug 'MunifTanjim/nui.nvim'
" commit: 24c13df08e3fe66624bed5350a2a780f77f1f65b
Plug 'HakonHarnes/img-clip.nvim'
" commit: 08e1fa4e281e48ee4aa892428de9fb91e66edca6
Plug 'MeanderingProgrammer/render-markdown.nvim'
" commit: 857c5ac632080dba10aae49dba902ce3abf91b35
Plug 'nvim-lua/plenary.nvim'
" commit: d0cafff5c4347a604a07edf7bb9a91fda7eb577e
Plug 'nvim-tree/nvim-web-devicons'

" commit: 9bd559a03ccec98a458e60c705547119eb5350f3
Plug 'simeji/winresizer' " <c-e> + hhh jjj kkk lll for resize window
" commit: 1e4bf00b264e0f1541401c28c4b63ace5bb3d2be
Plug 'yssl/QFEnter'
" commit: 68f0e5c3dab23261a945272032ee6700af86227a
Plug 'windwp/nvim-autopairs'
" commit: 3c942666f115e2811e959eabbdd361a025db8b63
Plug 'folke/flash.nvim'
" commit: e30b7f2008e52442154b66f7c519bfd2f1e32acb
Plug 'numToStr/Comment.nvim'
" commit: 9637670896b68805430e2f72cf5d16be5b97a22a
Plug 'lukas-reineke/indent-blankline.nvim', {'tag': 'v2.20.8'}
" commit: 304a8d204ee787d2544d8bc23cd38d2f929e7cc5
Plug 'folke/todo-comments.nvim'
" commit: a6975e7c1ee157615bbc80fc25e4392f71c344d4
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" commit: e20aeafb07c6184727b29f7674530150f7ab2036
Plug 'yuttie/comfortable-motion.vim'

" commit: c09ff35de503a41fa62465c6b4ae72d96e7a7ce4
Plug 'nvim-tree/nvim-tree.lua', {'on': ['NvimTreeToggle', 'NvimTreeFindFile']}

" commit: b8b60c7f1d0d95ad74ee215b2291280b30482476
Plug 'nvim-lualine/lualine.nvim'

" commit: 011dc6718bcebdf92a5336bb0da79189c3afe621
Plug 'lewis6991/gitsigns.nvim'
" commit: 4516612fe98ff56ae0415a259ff6361a89419b0a
Plug 'sindrets/diffview.nvim'
" commit: 39bb4cda9e658d053a43919b10ca52c0a4d738e1
Plug 'FabijanZulj/blame.nvim'

" commit: 057ef5d260c1931f1dffd0f052c685dcd14100a3
Plug 'folke/tokyonight.nvim'

" 'do': 'sudo npm install -g swagger-ui-watcher'
" commit: 9b9bc21096890a1bd0f221a940d04dbab87a38aa
Plug 'vinnymeller/swagger-preview.nvim', {'on': ['SwaggerPreview', 'SwaggerPreviewToggle']}

" commit: 3f3d1ef8f57b11b244c73d7f3d70f7233ec02776
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" commit: 245eaf8e50fe440729056ce8d4e7e2bb5b1ff9c9
Plug 'junegunn/fzf.vim'

" commit: 1e1900b0769324a9675ef85b38f99cca29e203b3
Plug 'hrsh7th/nvim-cmp'
" commit: 99290b3ec1322070bcfb9e846450a46f6efa50f0
Plug 'hrsh7th/cmp-nvim-lsp'
" commit: 8a1529e46eef5efc86c34c8d9bdd313abc2ecba0
Plug 'neovim/nvim-lspconfig'
" commit: 3022dbc9166796b644a841a02de8dd1cc1d311fa
Plug 'hrsh7th/cmp-buffer'
" commit: 91ff86cd9c29299a64f968ebb45846c485725f23
Plug 'hrsh7th/cmp-path'
" commit: d250c63aa13ead745e3a40f61fdd3470efde3923
Plug 'hrsh7th/cmp-cmdline'
" commit: d9ba6b7bfe29b3119a610892af67602641da778e
Plug 'j-hui/fidget.nvim'
" commit: 2204cf08791449a6a2fd2ef187a29112eeefd989
Plug 'stevearc/aerial.nvim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" commit: 845356a256ed6ff5868da582cb62a31d762e1804
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" commit: 995d78435ac9a49e04a703ca5b2f60bfde31a84a
Plug 'dense-analysis/ale'
Plug 'stevearc/conform.nvim'
" commit: 8172d0ce83d730820d9497fd2e988046022d0b99
Plug 'ranelpadon/python-copy-reference.vim'

" Plug 'luozhiya/fittencode.nvim'
" commit: f60f150a21e2a32f1b0ee194abd7f2be3bab92db
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

call plug#end()


colorscheme tokyonight-storm


lua << EOF
    require("basic")

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
            add          = { text = '█' },
            change       = { text = '░' },
            delete       = { text = '▶' },
            topdelete    = { text = '▶' },
            changedelete = { text = '▶' },
            untracked    = { text = '‖' },
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

    require("lsp")

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


    require("aerial").setup({
      -- optionally use on_attach to set keymaps when aerial has attached to a buffer
      on_attach = function(bufnr)
      end,
    })

    -----------------------------------------------
    -- require('fittencode').setup({
    --     completion = 'source'
    -- })
    --
    -- vim.api.nvim_create_user_command('DC',
    --     function()
    --         require('fittencode').dismiss_suggestions()
    --     end, {}
    -- )

    require('img-clip').setup ({})
    require('avante_lib').load()
    require('avante').setup({
        ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
        provider = "openai", -- Recommend using Claude
        auto_suggestions_provider = "openai", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
        providers = {
            openai = {
                endpoint = "https://api.deepseek.com",
                model = "deepseek-coder", -- your desired model (or use gpt-4o, etc.)
                extra_request_body = {
                    timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
                    temperature = 0.75,
                    max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
                    --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
                },
            },
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



" switch formatter
function! SwitchFmt(formatter) abort
  if a:formatter ==# 'ale'
    let g:ale_fix_on_save = 1
    lua require("conform_config").setup(false)
    echo "Switched to ALE"
  elseif a:formatter ==# 'conform'
    let g:ale_fix_on_save = 0
    lua require("conform_config").setup(true)
    echo "Switched to conform.nvim"
  else
    echoerr "Unknown formatter: " . a:formatter
  endif
endfunction

function! SwitchFmtComplete(A, L, P) abort
  return ['conform', 'ale']
endfunction

command! -nargs=1 -complete=customlist,SwitchFmtComplete SwitchFmt call SwitchFmt(<f-args>)


" Only run linters named in ale_linters settings.
let g:ale_disable_lsp = 1
let g:ale_use_neovim_diagnostics_api = 1

let g:ale_linters_explicit = 1
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_linters = {
  \  'proto': [ 'buf-lint' ],
  \  'go': [ 'gopls' ],
\}
"  \  'python': [ 'cspell' ],
"  \  'python': ['ruff', 'mypy'],
"let g:ale_python_mypy_show_notes = 1

"""""" install plugs """"""
"""""" https://github.com/dense-analysis/ale/blob/master/doc/ale-sql.txt
"""""" brew install pgformatter
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \  'python': [ 'black', 'isort' ],
  \  'go': [ 'gofmt' ],
  \  'rust': [ 'rustfmt' ],
  \  'proto': [ 'clang-format' ],
  \  'json': [ 'clang-format' ],
  \  'sql': [ 'pgformatter' ],
  \  'css': [ 'prettier' ],
  \  'javascript': ['prettier'],
  \  'javascriptreact': ['prettier'],
  \  'typescript': [ 'prettier' ],
  \  'typescriptreact': [ 'prettier' ],
\}
let g:ale_python_isort_options = '--profile black --ca'
let g:ale_javascript_prettier_options = ''


command! ALECspellOnly call s:ALECspellOnly()
function! s:ALECspellOnly()
    let b:ale_linters = ['cspell']
    ALELint
    unlet b:ale_linters
endfunction


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

command! DC :call copilot#Dismiss()

" command! DC lua require('fittencode').dismiss_suggestions()

" command! -range AD <line1>,<line2> :CocCommand cSpell.addWordToDictionary
