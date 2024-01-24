-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.o.relativenumber = true
vim.o.shell = "/bin/zsh"

vim.cmd('command! Gp !git push -u origin HEAD')
vim.cmd('command! -nargs=1 Gcp !git fetch origin && git checkout <args> && git pull')
vim.cmd('command! Gsc !stash_and_checkout_master.sh')

vim.cmd('command! -nargs=1 Du !docker-compose up <args> -d')
vim.cmd('command! -nargs=1 Dr !docker-compose restart <args>')
-- vim.g.netrw_keepdir = 0
vim.api.nvim_set_keymap('n', '<Leader>y', [[:lua CopyRelativePathToClipboard()<CR>]], { noremap = true, silent = true })

function CopyRelativePathToClipboard()
    local current_file_path = vim.fn.expand("%")
    vim.fn.system('echo -n ' .. current_file_path .. ' | pbcopy')
    print("Copied to clipboard: " .. current_file_path)
end

vim.api.nvim_set_keymap('n', '<Leader>fa', [[:lua LspFixAllProblems()<CR>]], { noremap = true, silent = true })

function LspFixAllProblems()
    vim.lsp.buf.code_action({
        filter = function(a)
		return a.title == "Fix all auto-fixable problems"
	end,
        apply = true
    })
end

return {
	{
		'yuezk/vim-js',
		'HerringtonDarkholme/yats.vim',
		'maxmellon/vim-jsx-pretty',
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		config = function()
			require 'treesitter-context'
		end,
	},
	{
		'github/copilot.vim',
		config = function()
			vim.api.nvim_set_keymap("i", "<C-C>", 'copilot#Accept("<CR>")', { silent = false, expr = true })
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true

			vim.g.copilot_filetypes = {
				['*'] = false,
				['javascript'] = true,
				['typescript'] = true,
				['typescriptreact'] = true,
				['javascriptreact'] = true,
				['json'] = true,
				['lua'] = true,
				['ruby'] = true,
				['python'] = true,
				['go'] = true,
				['rust'] = true,
				['css'] = true,
				['scss'] = true,
				['sass'] = true,
				['less'] = true,
				['yaml'] = true,
				['toml'] = true,
				['bash'] = true,
				['markdown'] = true,
				['sql'] = true,
				['graphql'] = true,
			}
		end,
	},
	{
		'f-person/git-blame.nvim',
		config = function()
			vim.g.gitblame_date_format = '%r (%d %b %Y)'
			vim.g.gitblame_message_template = '<author> • <date>'

			vim.api.nvim_set_keymap("n", "<Leader>go", ':GitBlameOpenCommitURL<CR>', { noremap = true, silent = true })
		end,
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	{
		'tpope/vim-surround',
	},
	{
		'christoomey/vim-tmux-navigator',
		lazy = false,
	}
}
