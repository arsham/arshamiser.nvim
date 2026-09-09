local M = {}

local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients

local mode_names = {
	n = "Normal",
	no = "Op Pending",
	nov = "Op Pending",
	noV = "Op Pending",
	niI = "Normal",
	niR = "Normal",
	niV = "Normal",
	nt = "Normal",
	v = "Visual",
	V = "Visual Line",
	["\22"] = "Visual Block",
	s = "Select",
	S = "Select Line",
	["\19"] = "Select Block",
	i = "Insert",
	ic = "Insert Completion",
	ix = "Insert",
	R = "Replace",
	Rv = "Virtual Replace",
	Rx = "Replace",
	c = "Command",
	cv = "Vim Ex",
	ce = "Ex",
	r = "Prompt",
	rm = "More",
	["r?"] = "Confirm",
	["!"] = "Shell",
	t = "Terminal",
}

local mode_colours = {
	n = "green",
	no = "green",
	nov = "green",
	noV = "green",
	niI = "green",
	niR = "green",
	niV = "green",
	nt = "green",
	v = "blue",
	V = "blue",
	["\22"] = "blue",
	s = "orange",
	S = "orange",
	["\19"] = "orange",
	i = "red",
	ic = "red",
	ix = "red",
	R = "purple",
	Rv = "purple",
	Rx = "purple",
	c = "green",
	cv = "green",
	ce = "green",
	r = "cyan",
	rm = "cyan",
	["r?"] = "cyan",
	["!"] = "green",
	t = "green",
}

local lsp_names = {
	["diagnostics_on_open"] = "Diagnostics",
	["diagnostics_on_save"] = "Diagnostics",
	["helm-ls"] = "Helm",
	["lua_ls"] = "LUA-LS",
	["null-ls"] = "NULL",
	actionlint = "ActionLint",
	autopep8 = "Autopep8",
	bashls = "Bash",
	bufls = "Buf",
	cbfmt = "CBfmt",
	clangd = "C++",
	copilot = "Copilot",
	delve = "Delve",
	dockerls = "Docker",
	fixjson = "FixJSON",
	golangci_lint_ls = "GolangCI",
	gopls = "GoPLS",
	hadolint = "Hadolint",
	html = "HTML",
	impl = "Impl",
	jedi_language_server = "Python",
	jsonls = "JSON",
	marksman = "Markdown",
	prettier = "Prettier",
	rust_analyzer = "Rust",
	selene = "Selene",
	shellcheck = "Shellcheck",
	shellharden = "Shellharden",
	shfmt = "Shfmt",
	sqlls = "SQL",
	sqls = "SQL",
	stylua = "Stylua",
	sumneko_lua = "Lua",
	taplo = "Taplo",
	tsserver = "TypeScript",
	vimls = "Vim",
	yamlls = "YAML",
}

local sqls_status = {
	connection = nil,
	database = "default",
}

local sqls_group = vim.api.nvim_create_augroup("ArshamiserStatuslineSqls", { clear = true })

local function parent_pathname(path)
	local index = path:find("[\\/:][^\\/:]*$")
	return index and path:sub(1, index - 1) or nil
end

local function get_git_dir(path)
	path = path or vim.fn.getcwd()

	while path do
		local git_dir = path .. "/.git"
		if vim.fn.isdirectory(git_dir) == 1 then
			return git_dir, path
		end

		local git_file = io.open(git_dir)
		if git_file then
			local contents = git_file:read()
			git_file:close()
			local configured_dir = contents:match("gitdir: (.*)")
			if configured_dir then
				if configured_dir:match("^/") or configured_dir:match("^%a:[/\\]") then
					return configured_dir, path
				end
				return path .. "/" .. configured_dir, path
			end
		end

		path = parent_pathname(path)
	end
end

local function diagnostic_count(severity)
	return #vim.diagnostic.get(0, { severity = severity })
end

local function statusline_escape(text)
	return text:gsub("%%", "%%%%")
end

local function selection_count()
	local mode = vim.api.nvim_get_mode().mode
	local from_position = vim.fn.getpos(".")
	local end_position = vim.fn.getpos("v")
	local from_row, from_col = from_position[2], from_position[3]
	local end_row, end_col = end_position[2], end_position[3]

	if end_row < from_row then
		from_row, end_row = end_row, from_row
	end
	if end_col < from_col then
		from_col, end_col = end_col, from_col
	end

	if mode == "v" and from_row == end_row then
		return end_col - from_col + 1
	end
	if mode == "\22" then
		return string.format("%dx%d", end_row - from_row + 1, end_col - from_col + 1)
	end
	return end_row - from_row + 1
end

vim.api.nvim_create_autocmd("User", {
	group = sqls_group,
	pattern = "SqlsConnectionChoice",
	callback = function(event)
		local choice = event.data and event.data.choice
		if not choice then
			return
		end
		local items = vim.split(choice, " ")
		sqls_status.connection = items[3]
	end,
})

vim.api.nvim_create_autocmd("User", {
	group = sqls_group,
	pattern = "SqlsDatabaseChoice",
	callback = function(event)
		if event.data and event.data.choice then
			sqls_status.database = event.data.choice
		end
	end,
})

local function current_mode()
	return vim.fn.mode(1)
end

function M.mode_name()
	if vim.g.libmodalActiveModeName then
		return statusline_escape(vim.g.libmodalActiveModeName)
	end
	return mode_names[current_mode()] or "Unknown"
end

function M.mode_colour()
	return mode_colours[current_mode()] or "yellow"
end

function M.git_root()
	local git_dir = get_git_dir()
	if not git_dir then
		return ""
	end

	local root = git_dir:gsub("/.git/?$", "")
	local worktree = git_dir:match("/([^/]+)/.git/worktrees/.+$")
	local name = root:match("^.+/(.+)$") or root
	local display_name = worktree and string.format("%s [%s]", name, worktree) or name
	return statusline_escape(display_name)
end

function M.is_git_repo()
	return M.git_root() ~= ""
end

function M.relative_filename()
	local filename = vim.api.nvim_buf_get_name(0)
	if filename == "" then
		return ""
	end

	local _, root = get_git_dir(vim.fn.fnamemodify(filename, ":h"))
	if not root then
		return statusline_escape(vim.fn.fnamemodify(filename, ":."))
	end

	local relative_filename = filename:gsub("^" .. vim.pesc(root .. "/"), "")
	return statusline_escape(relative_filename)
end

function M.file_size()
	local suffixes = { "b", "k", "M", "G", "T", "P", "E" }
	local size = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
	local index = 1

	if size < 0 then
		size = 0
	end
	while size > 1024 and index < #suffixes do
		size = size / 1024
		index = index + 1
	end

	return string.format(index == 1 and "%g%s" or "%.2f%s", size, suffixes[index])
end

function M.file_flags()
	local flags = {}
	if vim.bo.modified then
		flags[#flags + 1] = ""
	end
	if not vim.bo.modifiable or vim.bo.readonly then
		flags[#flags + 1] = ""
	end
	return table.concat(flags, " ")
end

function M.file_icon()
	local ok, devicons = pcall(require, "nvim-web-devicons")
	if not ok then
		return "", nil
	end

	local filename = vim.fn.expand("%:t")
	local extension = vim.fn.expand("%:e")
	local icon_ok, icon, colour = pcall(devicons.get_icon_color, filename, extension, { default = true })
	if not icon_ok then
		return "", nil
	end
	return icon or "", colour
end

function M.fold_method()
	local names = {
		marker = "MKR",
		manual = "MNL",
		syntax = "SYN",
		indent = "IND",
		expr = "EXP",
	}
	return string.format("%s[%d]", names[vim.wo.foldmethod] or vim.wo.foldmethod, vim.wo.foldlevel)
end

function M.search_results()
	local search_term = vim.fn.getreg("/")
	if search_term == "" or search_term:find("@") then
		return ""
	end

	local count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })
	if count.total == 0 then
		return ""
	end

	search_term = search_term:gsub([[\<]], ""):gsub([[\>]], "")
	return statusline_escape(string.format("/%s[%d/%d]", search_term, count.current, count.total))
end

function M.lsp_client_names()
	local clients = get_clients({ bufnr = 0 })
	local names = {}

	for _, client in ipairs(clients) do
		names[#names + 1] = lsp_names[client.name] or client.name
	end

	return statusline_escape(table.concat(names, " "))
end

function M.has_lsp_client(name)
	return #get_clients({ name = name, bufnr = 0 }) > 0
end

function M.diagnostic_count(severity)
	return diagnostic_count(severity)
end

function M.locallist_count()
	local list = vim.fn.getloclist(0, { idx = 0, size = 0 })
	return string.format("  %d/%d ", list.idx, list.size)
end

function M.quickfix_count()
	local list = vim.fn.getqflist({ idx = 0, size = 0 })
	return string.format("  %d/%d ", list.idx, list.size)
end

function M.line_percentage()
	local line = vim.api.nvim_win_get_cursor(0)[1]
	local lines = vim.api.nvim_buf_line_count(0)
	if line == 1 then
		return "Top"
	end
	if line == lines then
		return "Bot"
	end
	return string.format("%2d%%%%", math.ceil(line / lines * 99))
end

function M.visually_selected()
	local mode = vim.fn.mode()
	if not (mode:find("V") or mode:find("\22") or mode:find("v")) then
		return ""
	end
	return "𝒱 " .. selection_count()
end

function M.recording_macro()
	local register = vim.fn.reg_recording()
	return register == "" and "" or "Recording @" .. register
end

function M.sqls_status()
	if not sqls_status.connection or not sqls_status.database then
		return ""
	end
	return statusline_escape(string.format("%s  %s", sqls_status.connection, sqls_status.database))
end

function M.copilot_status()
	local ok, api = pcall(require, "copilot.api")
	if not ok then
		return "", nil
	end

	local status = api.status and api.status.data
	if not status then
		return "", nil
	end
	local colours = {
		Normal = "green",
		Warning = "red",
		InProgress = "yellow",
	}
	return statusline_escape(" " .. (status.message or "")), colours[status.status] or "statusline_bg"
end

function M.overseer_status()
	local ok, overseer = pcall(require, "overseer")
	if not ok then
		return "", nil
	end

	local task_list = overseer.task_list
	if not task_list or type(task_list.list_tasks) ~= "function" then
		return "", nil
	end

	local tasks_ok, tasks = pcall(task_list.list_tasks, { unique = true })
	if not tasks_ok or #tasks == 0 then
		return "", nil
	end

	local symbols = {
		FAILURE = "",
		CANCELED = "",
		SUCCESS = "",
		RUNNING = "󰑮",
	}
	local colours = {
		FAILURE = "red",
		CANCELED = "grey_fg",
		SUCCESS = "green",
		RUNNING = "yellow",
	}
	local statuses = overseer.constants.STATUS.values
	local tasks_by_status = overseer.util.tbl_group_by(tasks, "status")
	local active_symbols = {}
	local colour = "green"

	for _, status in ipairs(statuses) do
		if symbols[status] and tasks_by_status[status] then
			active_symbols[#active_symbols + 1] = symbols[status]
			colour = colours[status]
		end
	end

	return #active_symbols == 0 and "" or table.concat(active_symbols, " ") .. " ", colour
end

return M
