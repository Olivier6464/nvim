local ls = require('luasnip')
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node
local dl = require('luasnip.extras').dynamic_lambda
local date = function()
  return { os.date('%d-%m-%Y') }
end

ls.add_snippets(nil, {
  lua = {
    snip({
      trig = 'oli',
      namr = 'Civilité',
      dscr = 'civilité nom prénom',
    }, {
      text({ 'Ernst Olivier' }),
    }),
    snip({
      trig = 'ladate',
      namr = 'Date',
      dscr = 'Date in the form of YYYY-MM-DD',
    }, {
      func(date, {}),
    }),
    snip({
      trig = 'var',
      namr = 'Local variable',
    }, {
      text('local '),
      insert(1),
      text(' = '),
      insert(2),
    }),
  },
})
