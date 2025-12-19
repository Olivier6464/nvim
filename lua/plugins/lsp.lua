return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        opts = {
          ensure_installed = {
            'clangd',
            'clang-format',
          },
        },
      })
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config = function()
      require('mason-lspconfig').setup()
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP Manager Plugins
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Useful status updates for LSP
      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim' },
    },
    config = function()
      lspconfig = require('lspconfig')
      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
      end
      lspconfig.tinymist.setup({
        settings = {
          formatterMode = 'typstyle',
          -- exportPdf = 'onType',
          semanticTokens = 'disable',
        },
      })
      lspconfig.ts_ls.setup({})
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
          },
        },
      })
      lspconfig.clangd.setup({
        cmd = { 'clangd', '--background-index', '--compile-commands-dir', 'D:/systemc/excersies/build' },
        init_options = {
          clangdFileStatus = true,

          clangdSemanticHighlighting = true,
        },
        filetypes = { 'c', 'cpp', 'cxx', 'cc' },
        root_dir = function()
          vim.fn.getcwd()
        end,
        settings = {
          ['clangd'] = {
            ['compilationDatabasePath'] = 'build',
            ['fallbackFlags'] = { '-std=c++17' },
          },
        },
      })
      lspconfig.emmet_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.ccls.setup({})
      lspconfig.cssls.setup({})
      lspconfig.nimls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.marksman.setup({})
      lspconfig.ocamllsp.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, {})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = 'goto definition' })
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = 'goto reference' })
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'code action' })

      -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
      local open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        -- opts = opts or {}
        opts.border = opts.border or 'rounded' -- Set border to rounded
        return open_floating_preview(contents, syntax, opts, ...)
      end
    end,
  },
}
