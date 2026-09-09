local statusline = require("arshamiser.statusline")

local colours = {
	white = "#b5bcc9",
	grey_fg = "#737D87",
	short_bg = "#34393D",
	red = "#EF949C",
	red_dark = "#B34B4B",
	green = "#B0E5CA",
	green_pale = "#839C8F",
	blue = "#9aa8cf",
	yellow = "#fbdf90",
	purple = "#9F78E1",
	statusline_bg = "#181f26",
	light_bg = "#222930",
	mid_bg = "#2B3033",
}

local function colour(name)
	return colours[name] or colours.yellow
end

local function component_colour(fg, bg, bold)
	return {
		fg = fg,
		bg = bg,
		gui = bold and "bold" or nil,
	}
end

local function mode_colour()
	return colour(statusline.mode_colour())
end

local function named_buffer()
	return vim.api.nvim_buf_get_name(0) ~= ""
end

local function wide_enough(columns)
	return vim.o.columns >= columns
end

local function middle_content()
	return named_buffer() or (wide_enough(120) and statusline.is_git_repo())
end

local function mode_badge()
	return {
		function()
			return "  "
		end,
		color = function()
			return component_colour(colours.statusline_bg, mode_colour(), true)
		end,
		padding = { left = 0, right = 0 },
		separator = { right = "" },
	}
end

local function mode_name()
	return {
		function()
			return "  " .. statusline.mode_name()
		end,
		color = function()
			return component_colour(mode_colour(), colours.statusline_bg, true)
		end,
		padding = { left = 0, right = 0 },
	}
end

local function left_cap()
	return {
		function()
			return " "
		end,
		color = component_colour(colours.grey_fg, colours.statusline_bg),
		padding = { left = 0, right = 0 },
		separator = { right = "" },
	}
end

local function spring()
	return {
		function()
			return "%="
		end,
		padding = { left = 0, right = 0 },
	}
end

local function middle_left_edge()
	return {
		function()
			return ""
		end,
		color = component_colour(colours.statusline_bg, colours.mid_bg),
		cond = middle_content,
		padding = { left = 0, right = 0 },
	}
end

local function middle_right_edge()
	return {
		function()
			return ""
		end,
		color = component_colour(colours.statusline_bg, colours.mid_bg),
		cond = middle_content,
		padding = { left = 0, right = 0 },
	}
end

local function right_left_edge()
	return {
		function()
			return ""
		end,
		color = component_colour(colours.statusline_bg, colours.mid_bg),
		padding = { left = 0, right = 0 },
	}
end

local function tail_cap()
	return {
		function()
			return ""
		end,
		color = function()
			return component_colour(colours.light_bg, mode_colour(), true)
		end,
		padding = { left = 0, right = 0 },
		separator = { left = "" },
	}
end

local function mode_tail_component(provider, fg, options)
	options = options or {}
	return {
		provider,
		color = function()
			return component_colour(colour(fg), mode_colour(), options.bold)
		end,
		cond = options.cond,
		padding = options.padding or { left = 0, right = 0 },
	}
end

local function statusline_component(provider, fg, options)
	options = options or {}
	return {
		provider,
		color = component_colour(colour(fg), colours.statusline_bg, options.bold),
		cond = options.cond,
		padding = options.padding or { left = 0, right = 0 },
	}
end

local function ribbon_space(condition)
	return statusline_component(
		function()
			return " "
		end,
		"white",
		{
			cond = condition or named_buffer,
		}
	)
end

local function git_branch(inactive)
	return {
		"branch",
		icon = "",
		cond = function()
			return statusline.is_git_repo()
		end,
		color = component_colour(
			inactive and colours.white or colours.grey_fg,
			inactive and colours.mid_bg or colours.statusline_bg
		),
		padding = { left = 1, right = 0 },
	}
end

local function git_diff(inactive)
	local background = inactive and colours.mid_bg or colours.statusline_bg
	return {
		"diff",
		cond = function()
			return statusline.is_git_repo() and wide_enough(100)
		end,
		symbols = {
			added = " ",
			modified = "柳",
			removed = " ",
		},
		diff_color = {
			added = component_colour(inactive and colours.white or colours.green, background),
			modified = component_colour(inactive and colours.white or colours.blue, background),
			removed = component_colour(inactive and colours.white or colours.red, background),
		},
		padding = { left = 1, right = 0 },
	}
end

local function file_root()
	return statusline_component(
		function()
			return " " .. statusline.git_root() .. " "
		end,
		"grey_fg",
		{
			cond = function()
				return statusline.is_git_repo() and wide_enough(120)
			end,
		}
	)
end

local function file_icon()
	return {
		function()
			local icon = statusline.file_icon()
			return icon
		end,
		color = function()
			local _, icon_colour = statusline.file_icon()
			return component_colour(icon_colour or colours.grey_fg, colours.statusline_bg, true)
		end,
		cond = named_buffer,
		padding = { left = 0, right = 1 },
	}
end

local function file_name()
	return statusline_component(
		function()
			local filename = statusline.relative_filename()
			local flags = statusline.file_flags()
			return flags == "" and filename or filename .. " " .. flags
		end,
		"white",
		{
			cond = named_buffer,
		}
	)
end

local function file_size()
	return statusline_component(statusline.file_size, "grey_fg", {
		cond = function()
			return named_buffer() and wide_enough(100)
		end,
		padding = { left = 1, right = 0 },
	})
end

local function copilot()
	return {
		function()
			local text = statusline.copilot_status()
			return text
		end,
		color = function()
			local _, status_colour = statusline.copilot_status()
			return component_colour(colour(status_colour), colours.statusline_bg)
		end,
		cond = function()
			return wide_enough(160) and statusline.has_lsp_client("copilot")
		end,
		padding = { left = 1, right = 0 },
	}
end

local function overseer()
	return {
		function()
			local text = statusline.overseer_status()
			return text
		end,
		color = function()
			local _, task_colour = statusline.overseer_status()
			return component_colour(colour(task_colour), colours.statusline_bg)
		end,
		cond = function()
			local text = statusline.overseer_status()
			return wide_enough(150) and text ~= ""
		end,
		padding = { left = 1, right = 0 },
	}
end

local function lsp_clients()
	return statusline_component(
		function()
			return " " .. statusline.lsp_client_names()
		end,
		"grey_fg",
		{
			cond = function()
				return wide_enough(120)
			end,
			padding = { left = 1, right = 0 },
		}
	)
end

local function diagnostic(severity, icon, fg)
	return statusline_component(
		function()
			local count = statusline.diagnostic_count(severity)
			return count == 0 and "" or string.format("%s%d", icon, count)
		end,
		fg,
		{
			padding = { left = 1, right = 0 },
		}
	)
end

local function spell()
	return statusline_component(
		function()
			return "󰓆"
		end,
		"yellow",
		{
			cond = function()
				return vim.wo.spell and wide_enough(100)
			end,
			bold = true,
			padding = { left = 1, right = 0 },
		}
	)
end

local function sqls()
	return statusline_component(statusline.sqls_status, "grey_fg", {
		cond = function()
			return vim.bo.filetype == "sql" and wide_enough(140)
		end,
		padding = { left = 1, right = 0 },
	})
end

local function file_type()
	return {
		function()
			return string.upper(vim.bo.filetype)
		end,
		color = function()
			local _, icon_colour = statusline.file_icon()
			return component_colour(icon_colour or colours.grey_fg, colours.statusline_bg, true)
		end,
		cond = function()
			return named_buffer() and vim.bo.filetype ~= "" and wide_enough(100)
		end,
		padding = { left = 1, right = 0 },
	}
end

local function search_results()
	return statusline_component(statusline.search_results, "grey_fg", {
		cond = function()
			return vim.v.hlsearch == 1 and vim.api.nvim_buf_line_count(0) <= 50000
		end,
		padding = { left = 1, right = 0 },
	})
end

local function quickfix_count()
	return mode_tail_component(statusline.quickfix_count, "red_dark", {
		cond = function()
			return #vim.fn.getqflist() > 0
		end,
	})
end

local function locallist_count()
	return mode_tail_component(statusline.locallist_count, "purple", {
		cond = function()
			return #vim.fn.getloclist(0) > 0
		end,
	})
end

local function cursor_position()
	return mode_tail_component(function()
		return string.format(" %d:%d ", vim.fn.line("."), vim.fn.col("."))
	end, "statusline_bg")
end

local function visual_selection()
	return statusline_component(statusline.visually_selected, "yellow", {
		bold = true,
		padding = { left = 1, right = 0 },
	})
end

local function line_percentage()
	return {
		statusline.line_percentage,
		color = function()
			return component_colour(mode_colour(), colours.statusline_bg)
		end,
		padding = { left = 1, right = 1 },
	}
end

local function inactive_filename()
	return {
		function()
			local filename = statusline.relative_filename()
			return filename == "" and "" or " " .. filename
		end,
		color = component_colour(colours.white, colours.mid_bg),
		cond = named_buffer,
		padding = { left = 0, right = 0 },
	}
end

local function inactive_position()
	return {
		function()
			return string.format(" %d:%d %s", vim.fn.line("."), vim.fn.col("."), statusline.line_percentage())
		end,
		color = component_colour(colours.light_bg, colours.green_pale, true),
		cond = named_buffer,
		padding = { left = 1, right = 1 },
	}
end

local function active_theme()
	return {
		a = component_colour(colours.white, colours.statusline_bg),
		b = component_colour(colours.grey_fg, colours.statusline_bg),
		c = component_colour(colours.white, colours.mid_bg),
	}
end

local theme = {
	normal = active_theme(),
	insert = active_theme(),
	visual = active_theme(),
	replace = active_theme(),
	command = active_theme(),
	inactive = {
		a = component_colour(colours.white, colours.mid_bg),
		b = component_colour(colours.white, colours.mid_bg),
		c = component_colour(colours.white, colours.mid_bg),
	},
}

local sections = {
	lualine_a = { mode_badge() },
	lualine_b = {
		mode_name(),
		statusline_component(
			function()
				return ""
			end,
			"yellow",
			{
				cond = function()
					return vim.opt_local.scrollbind:get()
				end,
				bold = true,
				padding = { left = 1, right = 0 },
			}
		),
		statusline_component(
			function()
				return " " .. statusline.fold_method()
			end,
			"green_pale",
			{
				cond = function()
					return vim.wo.foldenable and wide_enough(100)
				end,
				bold = true,
				padding = { left = 1, right = 0 },
			}
		),
		statusline_component(statusline.recording_macro, "red_dark", {
			bold = true,
			padding = { left = 1, right = 0 },
		}),
		git_branch(),
		git_diff(),
		left_cap(),
	},
	lualine_c = {
		spring(),
		middle_left_edge(),
		ribbon_space(middle_content),
		file_root(),
		file_icon(),
		file_name(),
		file_size(),
		ribbon_space(middle_content),
		middle_right_edge(),
	},
	lualine_x = {
		right_left_edge(),
		ribbon_space(),
		copilot(),
		overseer(),
		lsp_clients(),
		diagnostic(vim.diagnostic.severity.ERROR, " ", "red"),
		diagnostic(vim.diagnostic.severity.WARN, " ", "yellow"),
		diagnostic(vim.diagnostic.severity.HINT, " ", "purple"),
		diagnostic(vim.diagnostic.severity.INFO, " ", "blue"),
		spell(),
		sqls(),
		file_icon(),
		file_type(),
		search_results(),
		ribbon_space(),
	},
	lualine_y = {
		tail_cap(),
		quickfix_count(),
		locallist_count(),
		cursor_position(),
	},
	lualine_z = {
		visual_selection(),
		line_percentage(),
	},
}

local inactive_sections = {
	lualine_a = {},
	lualine_b = { git_branch(true), git_diff(true) },
	lualine_c = { inactive_filename() },
	lualine_x = {},
	lualine_y = {},
	lualine_z = { inactive_position() },
}

local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = theme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {
			"NvimTree",
			"dbui",
			"packer",
			"startify",
			"fugitive",
			"fugitiveblame",
			"terminal",
		},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = true,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	sections = sections,
	inactive_sections = inactive_sections,
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
