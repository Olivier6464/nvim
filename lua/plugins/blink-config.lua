-- Force la configuration de Blink même s'il est inclus par défaut
require('blink.cmp').setup({
  keymap = {
    -- 'none' pour éviter les conflits, puis on définit nos touches
    preset = 'none',

    ['<Tab>'] = { 'select_and_accept', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'fallback' },

    ['<C-j>'] = { 'select_next', 'fallback' },
    ['<C-k>'] = { 'select_prev', 'fallback' },

    -- Flèches du clavier
    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },

    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-e>'] = { 'hide' },
  },

  -- Optionnel : rendre les fenêtres plus jolies
  completion = {
    menu = { border = 'rounded' },
    documentation = { window = { border = 'rounded' } },
  },
})
