return {
  {
    'mason-org/mason.nvim',
    config = function()
      require('mason').setup({
        opts = {
          ensure_installed = {
            'clangd',
            'clang-format',
            'gopls',
            'zls',
            'oxlint',
            'oxfmt',
          },
        },
      })
    end,
  },
  {
    'mason-org/mason-lspconfig.nvim',
    lazy = false,
    config = function()
      require('mason-lspconfig').setup()
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- LSP Manager Plugins
      { 'mason-org/mason.nvim' },
      { 'mason-org/mason-lspconfig.nvim' },

      -- Useful status updates for LSP
      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim' },
    },
    config = function()
      -- 1. On récupère les capacités pour nvim-cmp
      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- local has_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
      -- if has_cmp then
      --   capabilities = cmp_lsp.default_capabilities(capabilities)
      -- end
      --
      -- 2. Configuration des serveurs avec options spécifiques
      vim.lsp.config('tinymist', {
        -- capabilities = capabilities,
        flags = { formatterMode = 'typstyle', semanticTokens = 'disable' },
      })

      vim.lsp.config('lua_ls', {
        -- capabilities = capabilities,
        settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
      })

      vim.lsp.config('ts_ls', {
        -- capabilities = capabilities,
        flags = { debounce_text_changes = 300 },
      })

      vim.lsp.config('clangd', {
        -- capabilities = capabilities,
        cmd = { 'clangd', '--background-index', '--compile-commands-dir', 'D:/systemc/excersies/build' },
        init_options = { clangdFileStatus = true, clangdSemanticHighlighting = true },
        filetypes = { 'c', 'cpp', 'cxx', 'cc' },
        root_dir = function()
          return vim.fn.getcwd()
        end,
        settings = {
          ['clangd'] = {
            ['compilationDatabasePath'] = 'build',
            ['fallbackFlags'] = { '-std=c++17' },
          },
        },
      })

      -- 3. Configuration gr    -- local servers = { 'emmet_ls', 'html', 'ccls', 'cssls', 'nimls', 'gopls' }
      -- for _, lsp in ipairs(servers) do
      --   vim.lsp.config(lsp, { capabilities = capabilities })
      -- end

      -- Cas particulier de ZLS
      -- vim.lsp.config('zls', { capabilities = capabilities })
      vim.lsp.config('zls')
      vim.lsp.enable('zls') -- Nécessaire sur NVIM 0.11+

      -- 4. Autocmd pour les keymaps
      -- vim.api.nvim_create_autocmd('LspAttach', {
      --   callback = function(args)
      --     local opts = { buffer = args.buf }
      --     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      --     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      --     vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, opts)
      --     vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
      --     vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      --   end,
      -- })
    end,
  },
}
