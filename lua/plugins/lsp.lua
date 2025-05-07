return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config = function()
      require('mason-lspconfig').setup({
        ensure_intalled = { 'lua_ls', 'ts_ls', 'html', 'cssls', 'emmet_ls', 'nimls', 'ocamllsp', 'gopls' },
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      end
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.emmet_ls.setup({})
      lspconfig.cssls.setup({})
      lspconfig.nimls.setup({})
      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.ocamllsp.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'goto definition' })
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'goto reference' })
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'code action' })
    end,
  },
}
