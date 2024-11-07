local ls = require('luasnip')
local rep = require('luasnip.extras').rep
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
ls.setup({
  enable_autosnippets = true,
})

ls.add_snippets('all', {
  snip({ trigReg = true, trig = 'opot', snippetType = 'autosnippet' }, {
    text('<option value = "'),
    insert(1),
    text('">'),
    rep(1),
    text('</option>'),
  }),
  snip(
    { trig = 'b(%d)', regTrig = true, snippetType = 'autosnippet' },
    func(function(args, snipNumber)
      return 'Captured Text: ' .. snipNumber.captures[1] .. '.'
    end, {})
  ),
})
