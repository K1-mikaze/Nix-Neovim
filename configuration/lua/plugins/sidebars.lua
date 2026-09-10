local M = {}

-- DataGrip is a JetBrains IDE and does not expose a Neovim API for state.
-- Detect its window by filetype instead.

local function is_nvim_tree_open()
	local ok, api = pcall(require, "nvim-tree.api")
	if not ok then
		return false
	end
	return api.tree.is_visible() == true
end

-- Called by <leader>fm.
function M.toggle_explorer()
	if is_nvim_tree_open() then
		vim.cmd("NvimTreeClose")
	else
		vim.cmd("NvimTreeToggle")
	end
end

-- Called by <F1>. Toggles DataGrip database sidebar so the sidebars never coexist.
function M.toggle_datagrip()
	if is_nvim_tree_open() then
		vim.cmd("NvimTreeClose")
	end
	vim.cmd("GripToggle")
end

return M
