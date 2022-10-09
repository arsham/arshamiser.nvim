local util = require("arshamiser.feliniser.util")
local lsp = require("arshlib.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

local components = { -- {{{
  active = { {}, {}, {} },
  inactive = { {}, {}, {} },
}

local left_ribbon_hl = {
  fg = "grey_fg",
  bg = "statusline_bg",
}

local mid_ribbon_hl = {
  fg = "grey_fg",
  bg = "statusline_bg",
}

local right_ribbon_hl = {
  fg = "grey_fg",
  bg = "statusline_bg",
} -- }}}

-- Vim mode {{{
table.insert(components.active[1], {
  provider = "  ",
  hl = function()
    return {
      fg = "statusline_bg",
      bg = vi_mode_utils.get_mode_color(),
      bold = true,
    }
  end,
  right_sep = "right_rounded",
})

table.insert(components.active[1], {
  provider = "vim_mode",
  hl = function()
    return {
      fg = vi_mode_utils.get_mode_color(),
      bg = "statusline_bg",
      bold = true,
    }
  end,
  right_sep = {
    str = " ",
    hl = {
      fg = "light_bg2",
      bg = "statusline_bg",
      bold = true,
    },
  },
  icon = "  ",
})
-- }}}

-- Fold method {{{
table.insert(components.active[1], {
  provider = "fold_method",
  enabled = function()
    return vim.wo.foldenable
  end,
  priority = 8,
  truncate_hide = true,
  hl = {
    fg = "green_pale",
    bg = "statusline_bg",
    bold = true,
  },
  icon = "  ",
})
-- }}}

-- Recording macro {{{
table.insert(components.active[1], {
  provider = "recording_macro",
  enabled = function()
    return vim.fn.reg_recording() ~= ""
  end,
  priority = 8,
  truncate_hide = false,
  left_sep = {
    str = " ",
    hl = left_ribbon_hl,
  },
  hl = {
    fg = "red_dark",
    bg = "statusline_bg",
    bold = true,
  },
  icon = " ",
})
-- }}}

-- Git branch {{{
table.insert(components.active[1], {
  provider = "git_branch",
  enabled = function()
    return require("feline.providers.git").git_info_exists()
  end,
  priority = 9,
  truncate_hide = true,
  hl = left_ribbon_hl,
  left_sep = {
    str = " ",
    hl = left_ribbon_hl,
  },
  right_sep = {
    str = " ",
    hl = left_ribbon_hl,
  },
})
-- }}}

-- Git diff {{{
table.insert(components.active[1], {
  provider = "git_diff_added",
  enabled = function()
    return require("feline.providers.git").git_info_exists()
  end,
  priority = 9,
  truncate_hide = true,
  hl = {
    fg = "git_add",
    bg = "statusline_bg",
  },
})

table.insert(components.active[1], {
  provider = "git_diff_changed",
  enabled = function()
    return require("feline.providers.git").git_info_exists()
  end,
  priority = 9,
  truncate_hide = true,
  hl = {
    fg = "git_change",
    bg = "statusline_bg",
  },
})

table.insert(components.active[1], {
  provider = "git_diff_removed",
  enabled = function()
    return require("feline.providers.git").git_info_exists()
  end,
  priority = 9,
  truncate_hide = true,
  hl = {
    fg = "git_del",
    bg = "statusline_bg",
  },
})
-- }}}

-- Left angle {{{
table.insert(components.active[1], {
  provider = " ",
  hl = left_ribbon_hl,
  right_sep = {
    str = "right_filled",
    hl = {
      fg = "statusline_bg",
      bg = "mid_bg",
    },
  },
})
-- }}}

-- Left angle {{{
table.insert(components.active[2], {
  provider = " ",
  enabled = function()
    return vim.fn.expand("%:t") ~= ""
  end,
  hl = mid_ribbon_hl,
  left_sep = {
    str = "left_filled",
    hl = {
      fg = "statusline_bg",
      bg = "mid_bg",
      bold = true,
    },
  },
})
-- }}}

-- Git root {{{
table.insert(components.active[2], {
  provider = "git_root",
  enabled = function()
    return require("feline.providers.git").git_info_exists()
  end,
  priority = 10,
  truncate_hide = true,
  hl = left_ribbon_hl,
  left_sep = {
    str = "folder_icon",
    hl = {
      fg = util.colors.folder,
    },
  },
  right_sep = {
    str = " ",
  },
})
-- }}}

-- File info {{{
table.insert(components.active[2], {
  provider = {
    name = "file_info",
    opts = {
      type = "full-path",
      file_modified_icon = "",
      file_readonly_icon = "🔒",
    },
  },
  short_provider = {
    name = "file_info",
    opts = {
      type = "relative-short",
      file_modified_icon = "",
      file_readonly_icon = "🔒",
    },
  },
  enabled = function()
    return vim.fn.expand("%:t") ~= ""
  end,
  hl = {
    fg = "white",
    bg = "statusline_bg",
  },
})
-- }}}

-- File size {{{
table.insert(components.active[2], {
  provider = "file_size",
  enabled = function()
    return vim.fn.expand("%:t") ~= ""
  end,
  truncate_hide = true,
  left_sep = {
    str = " ",
    hl = {
      fg = "white",
      bg = "statusline_bg",
    },
  },
  hl = {
    fg = "grey_fg",
    bg = "statusline_bg",
  },
})
-- }}}

-- Right angle {{{
table.insert(components.active[2], {
  provider = " ",
  enabled = function()
    return vim.fn.expand("%:t") ~= ""
  end,
  hl = mid_ribbon_hl,
  right_sep = {
    str = "right_filled",
    hl = {
      fg = "statusline_bg",
      bg = "mid_bg",
    },
  },
})
-- }}}

-- Left angle {{{
table.insert(components.active[3], {
  provider = " ",
  hl = right_ribbon_hl,
  left_sep = {
    str = "left_filled",
    hl = {
      fg = "statusline_bg",
      bg = "mid_bg",
    },
  },
})
-- }}}

-- LSP client names {{{
table.insert(components.active[3], {
  provider = "lsp_clients",
  enabled = function()
    return lsp.is_lsp_attached()
  end,
  hl = right_ribbon_hl,
  priority = 3,
  truncate_hide = true,
})
-- }}}

-- Diagnostics {{{
table.insert(components.active[3], {
  provider = "diag_errors",
  enabled = function()
    return util.diagnostics_exist(vim.diagnostic.ERROR)
  end,
  hl = {
    fg = "error",
    bg = "statusline_bg",
  },
})

table.insert(components.active[3], {
  provider = "diag_warnings",
  enabled = function()
    return util.diagnostics_exist(vim.diagnostic.WARN)
  end,
  hl = {
    fg = "warn",
    bg = "statusline_bg",
  },
})

table.insert(components.active[3], {
  provider = "diag_hints",
  enabled = function()
    return util.diagnostics_exist(vim.diagnostic.HINT)
  end,
  hl = {
    fg = "info",
    bg = "statusline_bg",
  },
})

table.insert(components.active[3], {
  provider = "diag_info",
  enabled = function()
    return util.diagnostics_exist(vim.diagnostic.INFO)
  end,
  hl = {
    fg = "nord_blue",
    bg = "statusline_bg",
  },
})
-- }}}

-- Spell checker {{{
table.insert(components.active[3], {
  provider = "暈",
  enabled = function()
    return vim.wo.spell
  end,
  hl = {
    fg = "yellow",
    bg = "statusline_bg",
    bold = true,
  },
  left_sep = {
    str = " ",
    hl = {
      bg = "statusline_bg",
      fg = "mid_bg",
      bold = true,
    },
  },
})
-- }}}

-- SQLs Info {{{
table.insert(components.active[3], {
  provider = "sqls_status",
  enabled = function()
    return vim.bo.filetype == "sql" and pcall(require, "sqls.commands")
  end,
  truncate_hide = true,
  hl = right_ribbon_hl,
  left_sep = {
    str = " ",
    hl = {
      bg = "statusline_bg",
      fg = "mid_bg",
      bold = true,
    },
  },
})
-- }}}

-- File Icon {{{
table.insert(components.active[3], {
  priority = 7,
  truncate_hide = true,
  provider = function()
    local filename = vim.fn.expand("%:t")
    local extension = vim.fn.expand("%:e")
    local icon = require("nvim-web-devicons").get_icon(filename, extension)
    if icon == nil then
      icon = ""
    end
    return icon
  end,
  enabled = function()
    return vim.fn.expand("%:t") ~= ""
  end,
  hl = function()
    local val = {}
    local filename = vim.fn.expand("%:t")
    local extension = vim.fn.expand("%:e")
    local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
    else
      val.fg = "grey_fg"
    end
    val.bg = "statusline_bg"
    val.bold = true
    return val
  end,
  left_sep = {
    str = " ",
    hl = {
      bg = "statusline_bg",
      fg = "mid_bg",
    },
  },
  right_sep = {
    str = " ",
    hl = {
      bg = "statusline_bg",
      fg = "mid_bg",
      bold = true,
    },
  },
})
-- }}}

-- File type {{{
table.insert(components.active[3], {
  provider = "file_type",
  enabled = function()
    return vim.fn.expand("%:t") ~= ""
  end,
  hl = function()
    local val = {}
    local filename = vim.fn.expand("%:t")
    local extension = vim.fn.expand("%:e")
    local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
    if icon ~= nil then
      val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
    else
      val.fg = "grey_fg"
    end
    val.bg = "statusline_bg"
    val.bold = true
    return val
  end,
  priority = 7,
  truncate_hide = true,
  right_sep = {
    str = " ",
    hl = {
      fg = "mid_bg",
      bg = "statusline_bg",
      bold = true,
    },
  },
})
-- }}}

-- Search results key {{{
table.insert(components.active[3], {
  provider = "search_results",
  enabled = function()
    if not vim.v.hlsearch or vim.v.hlsearch ~= 1 then
      return false
    end
    local lines = vim.api.nvim_buf_line_count(0)
    if lines > 50000 then
      return false
    end
    return true
  end,
  truncate_hide = true,
  hl = right_ribbon_hl,
  right_sep = {
    str = " ",
    hl = {
      fg = "mid_bg",
      bg = "statusline_bg",
      bold = true,
    },
  },
})
-- }}}

table.insert(components.active[3], { -- {{{
  provider = "",
  hl = function()
    return {
      fg = "light_bg",
      bg = vi_mode_utils.get_mode_color(),
      bold = true,
    }
  end,
  left_sep = "left_rounded",
})
-- }}}

-- Quickfix count {{{
table.insert(components.active[3], {
  provider = "quickfix_count",
  enabled = function()
    return #vim.fn.getqflist() > 0
  end,
  priority = 10,
  truncate_hide = true,
  hl = function()
    return {
      fg = "red_dark",
      bg = vi_mode_utils.get_mode_color(),
      bold = true,
    }
  end,
})
-- }}}

-- Local list count {{{
table.insert(components.active[3], {
  provider = "locallist_count",
  enabled = function()
    return #vim.fn.getloclist(0) > 0
  end,
  priority = 10,
  truncate_hide = true,
  hl = function()
    return {
      fg = "purple",
      bg = vi_mode_utils.get_mode_color(),
      bold = true,
    }
  end,
})
-- }}}

-- Line position {{{
table.insert(components.active[3], {
  provider = "position",
  hl = function()
    return {
      fg = "statusline_bg",
      bg = vi_mode_utils.get_mode_color(),
      bold = true,
    }
  end,
  right_sep = {
    str = " ",
    hl = function()
      return {
        fg = "green_pale",
        bg = vi_mode_utils.get_mode_color(),
        bold = true,
      }
    end,
  },
  left_sep = {
    str = " ",
    hl = function()
      return {
        fg = "green_pale",
        bg = vi_mode_utils.get_mode_color(),
      }
    end,
  },
})
-- }}}

-- Visually selected count {{{
table.insert(components.active[3], {
  provider = "visually_selected",
  enabled = function()
    local mode = vim.fn.mode()
    return string.find(mode, "V") or string.find(mode, "") or string.find(mode, "v")
  end,
  priority = 10,
  truncate_hide = false,
  hl = {
    fg = "orange",
    bg = "statusline_bg",
    bold = true,
  },
  left_sep = {
    str = " ",
    hl = {
      bg = "statusline_bg",
    },
  },
})
-- }}}

-- Line percentage {{{
table.insert(components.active[3], {
  provider = "line_percentage",
  hl = function()
    return {
      fg = vi_mode_utils.get_mode_color(),
      bg = "statusline_bg",
      bold = true,
    }
  end,
  left_sep = {
    str = " ",
    hl = {
      bg = "statusline_bg",
    },
  },
})
-- }}}

-- Git branch {{{
table.insert(components.inactive[1], {
  provider = "git_branch",
  enabled = function()
    return require("feline.providers.git").git_info_exists()
  end,
  truncate_hide = true,
  hl = {
    fg = "white",
    bg = "mid_bg",
  },
  left_sep = {
    fg = "white",
    bg = "short_bg",
  },
  right_sep = {
    fg = "white",
    bg = "short_bg",
  },
})
-- }}}

-- Git diff {{{
table.insert(components.inactive[1], {
  provider = "git_diff_added",
  enabled = function()
    return require("feline.providers.git").git_info_exists()
  end,
  hl = {
    fg = "white",
    bg = "mid_bg",
  },
})

table.insert(components.inactive[1], {
  provider = "git_diff_changed",
  enabled = function()
    return require("feline.providers.git").git_info_exists()
  end,
  hl = {
    fg = "white",
    bg = "mid_bg",
  },
})

table.insert(components.inactive[1], {
  provider = "git_diff_removed",
  enabled = function()
    return require("feline.providers.git").git_info_exists()
  end,
  hl = {
    fg = "white",
    bg = "mid_bg",
  },
})
-- }}}

-- Left angle {{{
table.insert(components.inactive[1], {
  provider = " ",
  hl = {
    fg = "white",
    bg = "mid_bg",
  },
  right_sep = {
    str = "slant_right_2",
    hl = {
      fg = "mid_bg",
      bg = "short_bg",
    },
  },
})
-- }}}

-- File info {{{
table.insert(components.inactive[2], {
  provider = {
    name = "file_info",
    opts = {
      type = "full-path",
      file_modified_icon = "",
      file_readonly_icon = "🔒",
    },
  },
  short_provider = {
    name = "file_info",
    opts = {
      type = "relative",
      file_modified_icon = "",
      file_readonly_icon = "🔒",
    },
  },
  enabled = function()
    return vim.fn.expand("%:t") ~= ""
  end,
  hl = {
    fg = "white",
    bg = "mid_bg",
  },
  left_sep = {
    str = "slant_right_2",
    hl = {
      bg = "mid_bg",
      fg = "short_bg",
      bold = true,
    },
  },
  right_sep = {
    str = "slant_right_2",
    hl = {
      bg = "short_bg",
      fg = "mid_bg",
      bold = true,
    },
  },
})
-- }}}

table.insert(components.inactive[3], { -- {{{
  provider = "",
  hl = {
    fg = "mid_bg",
    bg = "green_pale",
    bold = true,
  },
  left_sep = {
    str = "slant_left",
    hl = {
      fg = "green_pale",
      bg = "short_bg",
    },
  },
})
-- }}}

-- Local list count {{{
table.insert(components.inactive[3], {
  provider = "locallist_count",
  enabled = function()
    return #vim.fn.getloclist(0) > 0
  end,
  priority = 10,
  truncate_hide = true,
  hl = function()
    return {
      fg = "purple",
      bg = "green_pale",
    }
  end,
})
-- }}}

-- Line position {{{
table.insert(components.inactive[3], {
  provider = "position",
  hl = {
    fg = "light_bg",
    bg = "green_pale",
    bold = true,
  },
})

table.insert(components.inactive[3], {
  provider = "line_percentage",
  hl = {
    fg = "green_pale",
    bg = "mid_bg",
  },
  left_sep = {
    str = " ",
    hl = {
      fg = "green_pale",
      bg = "mid_bg",
    },
  },
})
-- }}}

require("feline").setup({ -- {{{
  theme = util.colors,
  default_bg = util.colors.bg,
  default_fg = util.colors.fg,
  vi_mode_colors = util.vi_mode_colors,
  components = components,
  force_inactive = util.force_inactive,
  separators = util.separators,
  custom_providers = {
    vim_mode = util.vim_mode,
    search_results = util.search_results,
    locallist_count = util.locallist_count,
    quickfix_count = util.quickfix_count,
    git_root = util.git_root,
    diag_errors = util.diagnostic_errors,
    diag_info = util.diagnostic_info,
    diag_warnings = util.diagnostic_warnings,
    diag_hints = util.diagnostic_hints,
    lsp_clients = util.lsp_client_names,
    fold_method = util.fold_method,
    sqls_status = util.sqls_status,
    recording_macro = util.recording_macro,
    visually_selected = util.visually_selected,
  },
})
-- }}}

-- vim: foldmethod=marker foldlevel=0
