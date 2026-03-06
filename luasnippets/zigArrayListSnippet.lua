-- ~/.config/nvim/snippets/zig_arraylist_snippets_full.lua
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('zig', {

  -- append
  s('alist.append', {
    t('try '),
    i(1, 'list'),
    t('.append(allocator, '),
    i(2, 'value'),
    t(');'),
  }),

  -- appendSlice
  s('alist.appendSlice', {
    t('try '),
    i(1, 'list'),
    t('.appendSlice(allocator, '),
    i(2, 'slice'),
    t(');'),
  }),

  -- insert
  s('alist.insert', {
    t('try '),
    i(1, 'list'),
    t('.insert(allocator, '),
    i(2, 'index'),
    t(', '),
    i(3, 'value'),
    t(');'),
  }),

  -- pop
  s('alist.pop', {
    t('const '),
    i(1, 'val'),
    t(' = '),
    i(2, 'list'),
    t('.pop();'),
  }),

  -- orderedRemove
  s('alist.orderedRemove', {
    i(1, 'list'),
    t('.orderedRemove('),
    i(2, 'index'),
    t(');'),
  }),

  -- swapRemove
  s('alist.swapRemove', {
    i(1, 'list'),
    t('.swapRemove('),
    i(2, 'index'),
    t(');'),
  }),

  -- clearAndFree
  s('alist.clearAndFree', {
    i(1, 'list'),
    t('.clearAndFree(allocator);'),
  }),

  -- clearRetainingCapacity
  s('alist.clearRetainingCapacity', {
    i(1, 'list'),
    t('.clearRetainingCapacity();'),
  }),

  -- resize
  s('alist.resize', {
    t('try '),
    i(1, 'list'),
    t('.resize(allocator, '),
    i(2, 'size'),
    t(');'),
  }),

  -- ensureTotalCapacity
  s('alist.ensureTotalCapacity', {
    t('try '),
    i(1, 'list'),
    t('.ensureTotalCapacity(allocator, '),
    i(2, 'size'),
    t(');'),
  }),

  -- len
  s('alist.len', {
    t('const '),
    i(1, 'length'),
    t(' = '),
    i(2, 'list'),
    t('.len();'),
  }),

  -- items
  s('alist.items', {
    t('const '),
    i(1, 'items'),
    t(' = '),
    i(2, 'list'),
    t('.items();'),
  }),

  -- deinit
  s('alist.deinit', {
    i(1, 'list'),
    t(':deinit();'),
  }),

  -- type-specific init
  s('alist.init', {
    t('var '),
    i(1, 'list'),
    t(': ArrayList('),
    i(2, 'i32'),
    t(') = .{'),
    i(3, 'elements'),
    t('};'),
  }),
})
