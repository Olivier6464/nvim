return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    require('themery').setup({
      themes = {
        {
          name = 'adwaita',
          colorscheme = 'adwaita',
        },
        {
          name = 'apprentice',
          colorscheme = 'apprentice',
        },
        {
          name = 'aurora',
          colorscheme = 'aurora',
        },
        {
          name = 'ayu-dark',
          colorscheme = 'ayu-dark',
        },
        {
          name = 'ayu-mirage',
          colorscheme = 'ayu-mirage',
        },
        {
          name = 'bamboo',
          colorscheme = 'bamboo',
        },
        {
          name = 'bearded',
          colorscheme = 'bearded',
        },
        {
          name = 'binary',
          colorscheme = 'binary',
        },
        {
          name = 'bluloco-light',
          colorscheme = 'bluloco-light',
        },
        {
          name = 'bluloco-dark',
          colorscheme = 'bluloco-dark',
        },
        {
          name = 'catppuccin-frappe',
          colorscheme = 'catppuccin-frappe',
        },
        {
          name = 'catppuccin-latte',
          colorscheme = 'catppuccin-latte',
        },
        {
          name = 'catppuccin-macchiato',
          colorscheme = 'catppuccin-macchiato',
        },
        {
          name = 'catppuccin-mocha',
          colorscheme = 'catppuccin-mocha',
        },
        {
          name = 'citruszest',
          colorscheme = 'citruszest',
        },
        {
          name = 'cobalt2',
          colorscheme = 'cobalt2',
        },
        {
          name = 'cyberdream',
          colorscheme = 'cyberdream',
        },
        {
          name = 'darkplus',
          colorscheme = 'darkplus',
        },
        {
          name = 'dracula',
          colorscheme = 'dracula',
        },
        {
          name = 'eldritch',
          colorscheme = 'eldritch',
        },

        {
          name = 'everblush',
          colorscheme = 'everblush',
        },
        {
          name = 'embark',
          colorscheme = 'embark',
        },
        {
          name = 'eldritch',
          colorscheme = 'eldritch',
        },
        {
          name = 'everforest',
          colorscheme = 'everforest',
        },
        {
          name = 'flexoki',
          colorscheme = 'flexoki',
        },
        {
          name = 'github-monochrome-dark',
          colorscheme = 'github-monochrome-dark',
        },
        {
          name = 'github-monochrome-light',
          colorscheme = 'github-monochrome-light',
        },
        {
          name = 'github-monochrome-rosepine',
          colorscheme = 'github-monochrome-rosepine',
        },
        { name = 'github-monochrome-rosepine-dawn', colorscheme = 'github-monochrome-rosepine-dawn' },
        {

          name = 'github-monochrome-solarized',
          colorscheme = 'github-monochrome-solarized',
        },
        {
          name = 'github-monochrome-tokyonight',
          colorscheme = 'github-monochrome-tokyonight',
        },
        {
          name = 'github-monochrome-zenbones',
          colorscheme = 'github-monochrome-zenbones',
        },
        {
          name = 'gruvbox',
          colorscheme = 'gruvbox',
        },
        {
          name = 'gruvbox-material',
          colorscheme = 'gruvbox-material',
        },
        {
          name = 'highlite',
          colorscheme = 'highlite',
        },
        {
          name = 'kanagawa-paper',
          colorscheme = 'kanagawa-paper',
        },
        {
          name = 'kanagawa-paper-ink',
          colorscheme = 'kanagawa-paper-ink',
        },
        {
          name = 'kanagawa-paper-canvas',
          colorscheme = 'kanagawa-paper-canvas',
        },
        {
          name = 'kanso',
          colorscheme = 'kanso',
        },
        {
          name = 'koda-dark',
          colorscheme = 'koda-dark',
        },
        {
          name = 'koda-glade',
          colorscheme = 'koda-glade',
        },
        {
          name = 'koda-light',
          colorscheme = 'koda-light',
        },
        {
          name = 'koda-light',
          colorscheme = 'koda-light',
        },
        {
          name = 'koda-moss',
          colorscheme = 'koda-moss',
        },
        {
          name = 'lackluster-hack',
          colorscheme = 'lackluster-hack',
        },
        {
          name = 'lackluster-mint',
          colorscheme = 'lackluster-mint',
        },
        {
          name = 'lunaperche',
          colorscheme = 'lunaperche',
        },
        {
          name = 'material-darker',
          colorscheme = 'material-darker',
        },
        {
          name = 'material',
          colorscheme = 'material',
        },
        {
          name = 'material-deep-ocean',
          colorscheme = 'material-deep-ocean',
        },
        {
          name = 'material-lighter',
          colorscheme = 'material-lighter',
        },
        {
          name = 'material-oceanic',
          colorscheme = 'material-oceanic',
        },
        {
          name = 'material-palenight',
          colorscheme = 'material-palenight',
        },
        {
          name = 'materialbox',
          colorscheme = 'materialbox',
        },
        {
          name = 'meadow',
          colorscheme = 'meadow',
        },
        {
          name = 'mellow',
          colorscheme = 'mellow',
        },
        {
          name = 'mfd',
          colorscheme = 'mfd',
        },
        {
          name = 'modus_operandi',
          colorscheme = 'modus_operandi',
        },
        {
          name = 'modus_vivendi',
          colorscheme = 'modus_vivendi',
        },
        {
          name = 'monolith',
          colorscheme = 'monolith',
        },
        {
          name = 'moonfly',
          colorscheme = 'moonfly',
        },
        {
          name = 'moonlight',
          colorscheme = 'moonlight',
        },
        {
          name = 'material-palenight',
          colorscheme = 'material-palenight',
        },
        'nightfox',
        'night-owl',
        'nightwolf-black',
        'nightwolf-gray',
        'nightwolf-dark-gray',
        'okcolors',
        'onedark',
        'one_monokai',
        'oscura',
        'perpetua',
        'perpetua-light',
        'perpetua-dark',
        'rose-pine-main',
        'solarized-osaka-night',
        'sonokai',
        'southernlights',
        'space-vim-dark',
        'stoics',
        'synthweave',
        'synthweave-transparent',
        'thorn',
        'tokyodark',
        'tokyonight-moon',
        'tokyonight-day',
        'tokyonight-night',
        'tokyonight-storm',
        'vision',
        'visual_studio_code',
        'vividchalk',
        'vscode_modern',
        'wombat',
        'wisteria',
        'y9nika',
        'zaibatsu',
        'zephyr',
      },
      livePreview = true,
    })
  end,
}
