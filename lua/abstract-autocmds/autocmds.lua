local M = {}
local utils = require("abstract-autocmds.utils")
local create_autocmd = utils.create_autocmd
local opts_extend = require("abstract-autocmds.utils").opts_extend

function M.highlight_on_yank(opts)
	opts = opts_extend({ timeout = 150 }, opts)
	-- print(vim.inspect(opts))
	create_autocmd("TextYankPost", {
		desc = "highlight text on yank",
		pattern = "*",
		callback = function()
			vim.highlight.on_yank({
				higroup = "Search",
				timeout = opts.timeout,
				on_visual = true,
			})
		end,
	})
end

function M.open_file_last_position()
	create_autocmd("BufWinEnter", {
		desc = "jump to the last position when reopening a file",
		pattern = "*",
		command = [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]],
	})
end

function M.remove_whitespace_on_save()
	create_autocmd("BufWritePre", {
		desc = "remove whitespaces on save",
		pattern = "*",
		command = "%s/\\s\\+$//e",
	})
end

function M.no_autocomment_newline()
	create_autocmd({ "BufEnter", "FileType" }, {
		desc = "don't auto comment new line",
		pattern = "*",
		command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
	})
end

function M.auto_resize_splited_window()
	create_autocmd("VimResized", {
		desc = "auto resize splited windows",
		pattern = "*",
		command = "tabdo wincmd =",
	})
end

function M.clear_last_used_search()
	create_autocmd("BufWinEnter", {
		desc = "clear the last used search pattern",
		pattern = "*",
		command = "let @/ = ''",
	})
end

function M.give_border(opts)
	create_autocmd("FileType", {
		desc = "Give border to required windows",
		pattern = opts.pattern ~= nil and opts.pattern or {},
		callback = function()
			vim.api.nvim_win_set_config(0, { border = opts.border ~= nil and opts.border or "rounded" })
		end,
	})
end

function M.dont_suspend_with_cz()
	create_autocmd("BufEnter", {
		desc = "map ctl+z to nothing so that it don't suspend terminal",
		pattern = "*",
		command = "nnoremap <c-z> <nop>",
	})
end

return M
