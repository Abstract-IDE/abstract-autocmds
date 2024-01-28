local M = {}

local group = vim.api.nvim_create_augroup("AbstractAutoCmdsGroup", { clear = true })

function M.create_autocmd(events, opts)
	opts = vim.tbl_extend("force", opts, { group = group })
	vim.api.nvim_create_autocmd(events, opts)
end

function M.opts_extend(default, opts)
	return vim.tbl_extend("force", default, opts ~= nil and opts or {})
end

return M
