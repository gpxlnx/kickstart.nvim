-- tree explorer
vim.keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
vim.keymap.set('n', '<leader>ef', '<cmd>NvimTreeFindFile<CR>', { desc = 'Toggle file explorer on current file' })
vim.keymap.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
vim.keymap.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })

-- utilities
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center next search result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center previous search result' })
vim.keymap.set({ 'v' }, '<leader>D', [["_d]], { desc = 'Delete to black hole register' })
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.keymap.set('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word under cursor' })

vim.keymap.set('n', '<leader>o', 'o<ESC>', { desc = 'Insert new line below' })
vim.keymap.set('n', '<leader>O', 'O<ESC>', { desc = 'Insert new line above' })

-- K8s plugin
vim.keymap.set('n', '<leader>k', '<cmd>lua require("kubectl").toggle()<cr>', { noremap = true, silent = true })

-- Mapeia 'map' para criar mapeamentos
function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Movimento
vim.g.mapleader = ' '
Map('n', '<C-h>', '<C-w>h')
Map('n', '<C-j>', '<C-w>j')
Map('n', '<C-k>', '<C-w>k')
Map('n', '<C-l>', '<C-w>l')

-- terminal
Map('t', '<C-h>', '<cmd>wincmd h<CR>')
Map('t', '<C-j>', '<cmd>wincmd j<CR>')
Map('t', '<C-k>', '<cmd>wincmd k<CR>')
Map('t', '<C-l>', '<cmd>wincmd l<CR>')

-- Resize
Map('n', '<C-Up>', ':resize -2<CR>')
Map('n', '<C-Down>', ':resize +2<CR>')
Map('n', '<C-Left>', ':vertical resize -2<CR>')
Map('n', '<C-Right>', ':vertical resize +2<CR>')

-- terminal
Map('t', '<C-Up>', '<cmd>resize -2<CR>')
Map('t', '<C-Down>', '<cmd>resize +2<CR>')
Map('t', '<C-Left>', '<cmd>vertical resize -2<CR>')
Map('t', '<C-Right>', '<cmd>vertical resize +2<CR>')

-- Mover blocos no modo visual
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Mover blocos
Map('v', '<', '<gv')
Map('v', '>', '>gv')

-- Buffers e abas
Map('n', '<TAB>', ':bn<CR>')
Map('n', '<S-TAB>', ':bp<CR>')
Map('n', '<leader>bd', ':bd<CR>') -- from Doom Emacs

-- Telescope
Map('n', '<leader>ff', '<cmd> Telescope find_files <CR>')
Map('n', '<leader>fa', '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>')
Map('n', '<leader>fe', '<cmd> Telescope file_browser <CR>')
Map('n', '<leader>fw', '<cmd> Telescope live_grep <CR>')
Map('n', '<leader>fb', '<cmd> Telescope buffers <CR>')
Map('n', '<leader>fh', '<cmd> Telescope help_tags <CR>')
Map('n', '<leader>fo', '<cmd> Telescope oldfiles <CR>')
Map('n', '<leader>fc', '<cmd> Telescope colorschemes <CR>')

----LSP
--Map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>')
--Map('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>')
--Map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
--Map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
--Map('n', '<leader>gr', ':lua vim.lsp.buf.references()<CR>')
