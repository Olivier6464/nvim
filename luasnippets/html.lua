local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require('luasnip.extras').rep

-- Définition des autosnippets
ls.add_snippets('html', {
  -- Définition d'un autosnippet
  s({
    trig = '<%w+>', -- Déclencheur utilisant une expression régulière pour capturer une balise HTML
    dscr = 'Balise HTML avec nom répété',
  }, {
    t('<'),
    i(1, 'tag'),     -- Premier noeud d'insertion pour le nom de la balise
    t('>'),
    i(2, 'contenu'), -- Deuxième noeud d'insertion pour le contenu de la balise
    t('</'),
    rep(1),          -- Répète le contenu du premier noeud d'insertion
    t('>'),
  }),
  s({
    trig = 'opty', -- Déclencheur utilisant une expression régulière pour capturer une balise HTML
    dscr = 'Balise option avec value et innertag répétés',
  }, {
    t('<option value = "'),
    i(1, 'tag'), -- Premier noeud d'insertion pour le nom de la balise
    t('" >'),
    rep(1),
    t('</option>'),
  }),
})
