return {
  {
    'f-person/git-blame.nvim',
    config = function()
      vim.g.gitblame_date_format = '%r (%d %b %Y)'
      vim.g.gitblame_message_template = '<author> • <date>'

      vim.api.nvim_set_keymap('n', '<Leader>go', ':GitBlameOpenCommitURL<CR>', { noremap = true, silent = true })
    end,
  },
}
