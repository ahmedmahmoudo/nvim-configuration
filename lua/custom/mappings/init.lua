local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Map q to :q
map('n', 'q', '<Cmd>quit<CR>', opts)


-- Move to previous/next
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<leader>bp', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<leader>bx', '<Cmd>BufferClose<CR>', opts)
map('n', '<leader>bw', '<Cmd>BufferWipeout<CR>', opts)
map('n', '<leader>bxa', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts)
map('n', '<leader>br', '<Cmd>BufferRestore<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- Sort automatically by...
map('n', '<leader>bob', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<leader>bod', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<leader>bol', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<leader>bow', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Go back to directory' });
vim.keymap.set('n', '<leader>fa', '<cmd> EslintFixAll <CR>', { desc = 'Fix all eslint issues' })
vim.keymap.set('n', '<leader>ff', '<cmd>Format<CR>', { desc = 'Format file' })

-- keymap for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', function()
	require('telescope.builtin').grep_string({ search = vim.fn.input("Search > ") })
end, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- Diagnostic keymap
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Neotree mappings
vim.keymap.set('n', '<C-n>', '<cmd> :NvimTreeToggle toggle <CR>', { desc = 'Toggle [N]eoTree' })

-- Navigation between files
vim.keymap.set('n', '<leader>p', '<cmd> :bprev <CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>n', '<cmd> :bnext <CR>', { desc = 'Next buffer' })

-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
vim.keymap.set('i', '<C-j>', function()
	vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
end, { desc = 'Accept copilot suggestions' })

-- Git keymaps
vim.keymap.set('n', '<leader>gs', '<cmd> :tab G<CR>', { desc = 'Git [S]tatus' })
vim.keymap.set('n', '<leader>gc', '<cmd> :tab G commit<CR>', { desc = 'Git [C]ommit' })
vim.keymap.set('n', '<leader>gp', '<cmd> :tab G push<CR>', { desc = 'Git [P]ush' })
vim.keymap.set('n', '<leader>gl', '<cmd> :tab G pull<CR>', { desc = 'Git [P]ull' })
vim.keymap.set('n', '<leader>gbl', '<cmd> :tab G branch<CR>', { desc = 'Git [List] [B]ranches' })
vim.keymap.set('n', '<leader>gbs', function()
	vim.cmd([[Git switch ]] .. vim.fn.input("Branch name > "))
end, { desc = 'Git [B]ranch [S]witch' })
vim.keymap.set('n', '<leader>gbn', function()
	local branch_name = vim.fn.input("Branch name > ")
	vim.cmd([[Git branch ]] .. branch_name)
	vim.cmd([[Git switch ]] .. branch_name)
end, { desc = 'Git [B]ranch [N]ew' })
vim.keymap.set('n', '<leader>gbd', function()
	vim.cmd([[Git branch -D ]] .. vim.fn.input("Branch name > "))
end, { desc = 'Git [B]ranch [D]elete' })
vim.keymap.set('n', '<leader>gsp', function()
	vim.cmd([[Git stash push ]] .. vim.fn.input("Stash name > "))
end, { desc = 'Git [S]tash [P]ush' })
vim.keymap.set('n', '<leader>gsl', '<cmd> :G stash list<CR>', { desc = 'Git [S]tash [L]ist' })
vim.keymap.set('n', '<leader>gsP', '<cmd> :G stash pop<CR>', { desc = 'Git [S]tash [P]op' })
vim.keymap.set('n', '<leader>gss', '<cmd> :G stash show<CR>', { desc = 'Git [S]tash [S]how' })
vim.keymap.set('n', '<leader>gsc', '<cmd> :G stash clear<CR>', { desc = 'Git [S]tash [C]lear' })

-- Selection movement keymaps
vim.keymap.set("n", "<S-j>", ":m .+1<CR>==", { desc = 'Move Selection Up' })       -- move line up(n)
vim.keymap.set("n", "<S-k>", ":m .-2<CR>==", { desc = 'Move Selection Down' })     -- move line down(n)
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { desc = 'Move Selection Up' })   -- move line up(v)
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { desc = 'Move Selection Down' }) -- move line down(v)
