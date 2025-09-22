return {

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader><leader>', function() end },
      {
        '<leader><space>',
        function()
          require('telescope.builtin').buffers()
        end,
      },
      {
        '<leader>ff',
        function()
          require('telescope.builtin').find_files({ hidden = true })
        end,
        desc = 'find_files',
      },
      {
        '<leader>fb',
        function()
          require('telescope.builtin').current_buffer_fuzzy_find()
        end,
        desc = 'current_buffer_fuzzy_find',
      },
      {
        '<leader>fh',
        function()
          require('telescope.builtin').help_tags()
        end,

        desc = 'help_tags',
      },
      {
        '<leader>ft',
        function()
          require('telescope.builtin').tags()
        end,
        desc = 'tags',
      },
      {
        '<leader>fd',
        function()
          require('telescope.builtin').grep_string()
        end,
        desc = 'grep_string',
      },
      {
        '<leader>fp',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = 'live_grep',
      },
      {
        '<leader>fo',
        function()
          require('telescope.builtin').tags({ only_current_buffer = true })
        end,
        desc = 'tags in buffer',
      },
      {
        '<leader>?',
        function()
          require('telescope.builtin').oldfiles()
        end,
        desc = 'oldfiles',
      },
    },
  },
  -- {
  --   'nvim-telescope/telescope-fzf-native.nvim',
  --   cond = vim.fn.executable('make') == 1,
  --   build = 'make',
  -- },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config Release',
  },
}
