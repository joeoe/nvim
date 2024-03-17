return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  config = function()
    vim.diagnostic.config {
      virtual_text = true,
    }

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local tsc = require 'telescope.builtin'

        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
        end

        -- Buffer local mappings.
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('gd', tsc.lsp_definitions, '[G]oto [D]efinition')
        map('gr', tsc.lsp_references, '[G]oto [R]eferences')
        map('gi', tsc.lsp_implementations, '[G]oto [I]mplementations')
        map('<leader>D', tsc.lsp_type_definitions, 'Type [D]efinition')
        map('<leader>ds', tsc.lsp_document_symbols, '[D]ocument [S]ymbols')

        map('<leader>rn', vim.lsp.buf.rename, 'Rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
        map('gh', vim.lsp.buf.hover, 'Hover documentation')
        map('K', vim.lsp.buf.hover, 'Hover documentation')
        map('<M-k>', vim.lsp.buf.signature_help, 'Signature help')
        map('<leader>rs', ':LspRestart<cr>', 'Restart LSP')

        map('<leader>ws', tsc.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add workspace folder')
        map('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder')
        map('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, 'List workspace folder')

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = ev.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = ev.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })
  end,
}
