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
      vim.lsp.config('tinymist', {
        flags = {
          formatterMode = 'typstyle',
          -- exportPdf = 'onType',
          semanticTokens = 'disable',
        },
      })
      -- lspconfig.ts_ls.setup({})
      -- nouvelle syntax
      vim.lsp.config('ts_ls', {
        flags = { debounce_text_changes = 300 },
      })
      vim.lsp.config('clangd', {
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
      vim.lsp.config('emmet_ls', {})
      vim.lsp.config('html', {})
      vim.lsp.config('ccls', {})
      vim.lsp.config('cssls', {})
      vim.lsp.config('nimls', {})
      vim.lsp.config('gopls', {})
      vim.lsp.config('marksman', {})
      vim.lsp.config('ocamllsp', {})
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
