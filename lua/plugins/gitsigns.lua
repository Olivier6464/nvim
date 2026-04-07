-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  opts = {
    signs = {
      add = { text = '▎' }, -- Barre fine et moderne
      change = { text = '▎' },
      delete = { text = '' }, -- Petit triangle pour les suppressions
      topdelete = { text = '' },
      changedelete = { text = '▎' },
    },
    numhl = true, -- Très utile sur Windows pour la visibilité
    word_diff = false,
  },
}
