return {
  {
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
    end,
  },
}
