local set_keymap = require("abstract-autocmds.utils").set_keymap
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
	set_keymap("n", "dd", dd)
end

return M
