return {
  {
    'saghen/blink.cmp',
    lazy = false, -- Blink doit être chargé pour injecter les capacités
    version = 'v0.*',
    opts = {
      keymap = { preset = 'default' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp', -- On ajoute blink ici
      { 'mason-org/mason.nvim' },
      { 'mason-org/mason-lspconfig.nvim' },
      { 'folke/neodev.nvim' },
    },
    config = function()
      -- 1. On récupère les capacités via Blink
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- 2. Configuration des serveurs
      -- Note : Sur Neovim 0.11+, tu peux passer les capabilities globalement
      -- ou par serveur via vim.lsp.config

      vim.lsp.config('tinymist', {
        capabilities = capabilities,
        flags = { formatterMode = 'typstyle', semanticTokens = 'disable' },
      })

      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
      })

      vim.lsp.config('clangd', {
        capabilities = capabilities,
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

      -- ZLS et autres
      vim.lsp.config('zls', { capabilities = capabilities })

      -- N'oublie pas d'activer tes serveurs s'ils ne le sont pas via mason-lspconfig
      vim.lsp.enable('zls')
      vim.lsp.enable('clangd')
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('tinymist')
    end,
  },
}
