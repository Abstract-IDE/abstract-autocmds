local opts_extend = require("abstract-autocmds.utils").opts_extend
local M = {}

-- smart deletion, dd
-- It solves the issue, where you want to delete empty line, but dd will override your last yank.
-- Code below will check if u are deleting empty line, if so - use black hole register.
-- [src: https://www.reddit.com/r/neovim/comments/w0jzzv/comment/igfjx5y/?utm_source=share&utm_medium=web2x&context=3]
function M.smart_dd()
	local dd = function()
		if vim.api.nvim_get_current_line():match("^%s*$") then
			return '"_dd'
		else
			return "dd"
		end
	end
	vim.keymap.set("n", "dd", dd, { noremap = true, expr = true })
end

-- easier moving of code blocks
-- Try to go into visual mode (v), thenselect several lines of code
-- here and then press ``>`` several times.
function M.visually_codeblock_shift()
	vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })
end

-- move selected line(s) up or down
function M.move_selected_upndown()
	vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
end

-- going back to normal mode which works even in vim's terminal
-- eg: you may need this if you use floaterm to escape terminal
function M.go_back_normal_in_terminal()
	vim.api.nvim_set_keymap("t", "<Esc>", "<c-\\><c-n>", { noremap = true, silent = true })
end

-- delete a word backward in insert mode with Ctrl+Backspace
function M.ctrl_backspace_delete(opts)
	opts = opts_extend({ cmd_mode = true }, opts)
	vim.api.nvim_set_keymap("i", "<C-BS>", "<C-w>", { noremap = true })
	if opts.cmd_mode then
		vim.api.nvim_set_keymap("c", "<C-BS>", "<C-w>", { noremap = true })
	end
end

-- In visual mode ('x'), pressing 'p' replaces the selected text with the content
-- of the default register, effectively pasting the last deleted or yanked text.
function M.smart_visual_paste()
	vim.api.nvim_set_keymap("x", "p", [[<Cmd>silent! normal! "_dP<CR>]], { noremap = true, silent = true })
end

-- write/save when the buffer has been modified.
function M.smart_save_in_insert_mode()
	vim.api.nvim_set_keymap("i", "<C-s>", "<ESC>ma<ESC>:update <CR>`a", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<C-s>", "<ESC>ma<ESC>:update <CR>`a", { noremap = true, silent = true })
end

-- scroll up/down from center of screen
function M.scroll_from_center()
	vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
end

return M
