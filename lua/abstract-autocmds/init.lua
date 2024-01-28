local autocmds = require("abstract-autocmds.autocmds")
local mappings = require("abstract-autocmds.mappings")
local M = {}

function M.setup(opts)
	if opts == nil then
		return
	end

	local commands = vim.tbl_extend("force", autocmds, mappings)

	for key, value in pairs(opts) do
		if value then
			-- if no option is passed
			if value == true then
				commands[key]()
				goto continue
			end
			-- if option is passed
			if value.enable then
				commands[key](value.opts)
			end
		end
		::continue::
	end
end

return M
