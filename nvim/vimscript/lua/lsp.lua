vim.lsp.enable('pyright')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('gopls')
vim.lsp.enable('ts_ls')


vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        -- obtain LSP Client
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- keymaps
        local opts = { buffer = event.buf, noremap = true, silent = true }
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
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('i', '<a-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('i', '<a-cr>', function()
            vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<space>k', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', '<space>j', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<space>a', vim.diagnostic.setloclist, opts)

        -- diagnostic
        vim.diagnostic.config({
            virtual_text = false,
        })

        -- folding
        -- if client and client:supports_method "textDocument/foldingRange" then
        --     local win = vim.api.nvim_get_current_win()
        --     vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        -- end

        -- highlight words under cursor
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })
        end

        -- offload upon detachment
        vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(dt_event)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = dt_event.buf }
            end
        })
    end
})
