autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { 'source.organizeImports' } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
})

-- create custom command
vim.api.nvim_create_user_command('WatchRun', function()
  local overseer = require('overseer')
  overseer.run_template({ name = 'run script' }, function(task)
    if task then
      task:add_component({ 'restart_on_save', paths = { vim.fn.expand('%:p') } })
      local main_win = vim.api.nvim_get_current_win()
      overseer.run_action(task, 'open vsplit')
      vim.api.nvim_set_current_win(main_win)
    else
      vim.notify('WatchRun not supported for filetype ' .. vim.bo.filetype, vim.log.levels.ERROR)
    end
  end)
end, {})
