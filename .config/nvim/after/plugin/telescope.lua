-- set telescope fuzzy find shortcuts
local builtin = require('telescope.builtin')
require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim"
    },
    file_ignore_patterns = {},
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--exclude", ".git" }
    }
  }
}

function live_grep_from_project_git_root()
	local function is_git_repo()
		vim.fn.system("git rev-parse --is-inside-work-tree")

		return vim.v.shell_error == 0
	end

	local function get_git_root()
		local dot_git_path = vim.fn.finddir(".git", ".;")
		return vim.fn.fnamemodify(dot_git_path, ":h")
	end

	local opts = {}

	if is_git_repo() then
		opts = {
			cwd = get_git_root(),
		}
	end

	require("telescope.builtin").live_grep(opts)
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<c-t>', builtin.git_files, {})
vim.keymap.set('n', '<c-p>', builtin.find_files, {})
vim.keymap.set('n', '<c-w>', builtin.grep_string, {})
vim.keymap.set('n', '<c-f>', function()
  live_grep_from_project_git_root()
end, {})

vim.keymap.set('n', 'gr', builtin.lsp_references)
vim.keymap.set('n', 'gD', builtin.lsp_definitions)
vim.keymap.set('n', 'gW', builtin.lsp_workspace_symbols)
vim.keymap.set('n', 'g0', builtin.lsp_document_symbols)
vim.keymap.set('n', 'ge', builtin.diagnostics)
vim.keymap.set('n', 'gi', builtin.lsp_implementations)
vim.keymap.set('n', 'gtd', builtin.lsp_type_definitions)
vim.keymap.set('n', 'gd', builtin.lsp_definitions)
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', { silent = true })
