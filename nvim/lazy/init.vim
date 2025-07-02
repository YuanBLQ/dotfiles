" Plug
call plug#begin('~/.config/nvim/plugs')
" commit: 2d7c2db2507fa3c4956142ee607431ddb2828639
Plug 'stevearc/dressing.nvim'
" commit: 8d3bce9764e627b62b07424e0df77f680d47ffdb
Plug 'MunifTanjim/nui.nvim'
" commit: 08e1fa4e281e48ee4aa892428de9fb91e66edca6
Plug 'MeanderingProgrammer/render-markdown.nvim'




" commit: b8b60c7f1d0d95ad74ee215b2291280b30482476
Plug 'nvim-lualine/lualine.nvim'

" commit: 39bb4cda9e658d053a43919b10ca52c0a4d738e1
Plug 'FabijanZulj/blame.nvim'


" commit: d9ba6b7bfe29b3119a610892af67602641da778e
Plug 'j-hui/fidget.nvim'


" Plug 'luozhiya/fittencode.nvim'
" commit: f60f150a21e2a32f1b0ee194abd7f2be3bab92db
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

call plug#end()




lua << EOF
    require("basic")




    require('blame').setup({
        width = 47,
    })


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


EOF




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






command! ALECspellOnly call s:ALECspellOnly()
function! s:ALECspellOnly()
    let b:ale_linters = ['cspell']
    ALELint
    unlet b:ale_linters
endfunction





command! DC :call copilot#Dismiss()

