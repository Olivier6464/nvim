local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local t = ls.text_node

local fmt = require('luasnip.extras.fmt').fmt

local func_template = [[
-- {}{}
function {}({})
  {}
end
]]

ls.add_snippets('lua', {
  s(
    'luf',
    fmt(func_template, {
      i(1, 'this does some function'),
      d(5, function(values)
        local param_str = values[1][1]
        param_str = param_str:gsub(' ', '')
        if param_str == '' then
          return sn(1, { t('') })
        end

        local params = vim.split(param_str, ',')

        local nodes = {}

        for index, param in ipairs(params) do
          table.insert(
            nodes,
            sn(
              index,
              fmt('\n\n-- param {} {} {}', {
                t(param),
                i(1, 'any'),
                i(2, 'description'),
              })
            )
          )
        end

        return sn(nil, nodes)
      end, { 3 }),
      i(2, 'name'),
      i(3),
      i(4),
    })
  ),
})
