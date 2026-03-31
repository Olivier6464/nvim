return {
  'folke/which-key.nvim',
  event = 'VeryLazy', -- Charge le plugin seulement quand c'est nécessaire
  opts = {
    -- Configuration optionnelle pour améliorer l'expérience
    preset = 'classic', -- Look classique (recommandé)
    spec = {
      { '<leader>f', group = 'File/Find' }, -- Groupe les commandes commençant par <leader>f
      { '<leader>g', group = 'Goto/reffuncsymb' }, -- Groupe les commandes commençant par <leader>f
      { '<leader>s', group = 'Snacks/Search' },
      { 'g', group = 'Goto' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
