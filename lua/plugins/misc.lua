-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- autoclose tags
    'windwp/nvim-ts-autotag',
  },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
    opts = {
      win = {
        border = {
          { '┌', 'FloatBorder' },
          { '─', 'FloatBorder' },
          { '┐', 'FloatBorder' },
          { '│', 'FloatBorder' },
          { '┘', 'FloatBorder' },
          { '─', 'FloatBorder' },
          { '└', 'FloatBorder' },
          { '│', 'FloatBorder' },
        },
      },
    },
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
}
