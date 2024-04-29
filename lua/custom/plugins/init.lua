-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        max_lines = 5,
      }
    end,
  },
  {
    'github/copilot.vim',
    config = function()
      vim.api.nvim_set_keymap('i', '<C-C>', 'copilot#Accept("<CR>")', { silent = false, expr = true })
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end,
  },
  {
    'f-person/git-blame.nvim',
    config = function()
      vim.g.gitblame_date_format = '%r (%d %b %Y)'
      vim.g.gitblame_message_template = '<author> • <date>'

      vim.api.nvim_set_keymap('n', '<Leader>go', ':GitBlameOpenCommitURL<CR>', { noremap = true, silent = true })
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    'tpope/vim-surround',
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
}
