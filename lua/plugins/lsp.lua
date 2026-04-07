return {
  {
<<<<<<< HEAD
    'mason-org/mason.nvim',
    config = function()
      require('mason').setup({
        opts = {
          ensure_installed = {
            'clangd',
            'clang-format',
            'gopls',
            'zls',
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
      vim.lsp.config('tinymist', {
        flags = {
          formatterMode = 'typstyle',
          -- exportPdf = 'onType',
          semanticTokens = 'disable',
        },
      })
      -- lspconfig.ts_ls.setup({})
      -- nouvelle syntax
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })
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
      vim.lsp.config('zls', {})
      vim.lsp.enable('zls')

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Go to definition
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Hover info
          vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        end,
      })
      local open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        -- opts = opts or {}
        opts.border = opts.border or 'rounded' -- Set border to rounded
        return open_floating_preview(contents, syntax, opts, ...)
      end
=======
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      local lspconfig = require('lspconfig')

      require('mason-lspconfig').setup({
        ensure_installed = { 'clangd', 'zls', 'lua_ls' },
      })

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      end

      -- Fonction magique pour Windows : trouve la racine ou utilise le dossier du fichier
      local root_fallback = function(fname)
        return lspconfig.util.root_pattern('.git', 'build.zig', 'compile_commands.json')(fname) or lspconfig.util.path.dirname(fname)
      end

      -- LUA (Optimisé pour la config Neovim)
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        -- Force la détection de la racine sur ton dossier de config
        root_dir = function(fname)
          return lspconfig.util.root_pattern('.luarc.json', '.git')(fname) or vim.fn.stdpath('config') -- Repli sur le dossier de config Neovim
        end,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = {
              globals = { 'vim' }, -- Évite les warnings sur l'objet 'vim'
            },
            workspace = {
              -- Rend le serveur conscient des librairies Neovim
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })
      -- ZIG (ZLS)
      lspconfig.zls.setup({
        on_attach = on_attach,
        root_dir = root_fallback,
        settings = { zls = { enable_autofix = true } },
      })

      -- C++ (Clangd)
      lspconfig.clangd.setup({
        on_attach = on_attach,
        -- On garde ton chemin spécifique pour SystemC
        cmd = { 'clangd', '--background-index', '--compile-commands-dir', 'D:/systemc/excersies/build' },
        root_dir = root_fallback,
      })

      -- HTML & CSS
      lspconfig.html.setup({ on_attach = on_attach })
      lspconfig.cssls.setup({ on_attach = on_attach })
>>>>>>> c2eabd9e60c67afe69410cb6e0cf826ebeae118a
    end,
  },
}
