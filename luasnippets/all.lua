local ls = require 'luasnip'
local rep = require('luasnip.extras').rep
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
ls.config.setup {}

ls.add_snippets('all', {
  snip('oli', {
    text 'print("snipAll")',
  }),
  -- pour le multiline on utilise une table
  snip('trigger', {
    text { 'Wow! Text!', 'And another line.' },
  }),
})

-- <C-l> rempli le deuxieme champr avec la copie du premier et va à la fin du snippet

-- fin des snippet
