local M = {}

---If highlight is a string, use it as highlight name and extract the
-- properties from the highlight.
-- Borrowed from the feline codebase.
local function get_hl_properties(hlname) --{{{
  local hl = vim.api.nvim_get_hl_by_name(hlname, true)
  local styles = {}

  for k, v in ipairs(hl) do
    if v == true then
      styles[#styles + 1] = k
    end
  end

  return {
    name = hlname,
    fg = hl.foreground and string.format("#%06x", hl.foreground),
    bg = hl.background and string.format("#%06x", hl.background),
    style = next(styles) and table.concat(styles, ",") or "NONE",
  }
end --}}}

M.force_inactive = { --{{{
  filetypes = {
    "NvimTree",
    "dbui",
    "packer",
    "startify",
    "fugitive",
    "fugitiveblame",
  },
  buftypes = {
    "terminal",
  },
  bufnames = {},
}
--}}}

-- stylua: ignore start
M.colors = {--{{{
  white         = "#b5bcc9",
  grey_fg       = "#737D87",
  short_bg      = "#34393D",
  red           = "#EF949C",
  red_dark      = "#B34B4B",
  green         = "#B0E5CA",
  green_pale    = "#839C8F",
  nord_blue     = "#9aa8cf",
  yellow        = "#fbdf90",
  yellow_pale   = "#B39E67",
  purple        = "#9F78E1",
  statusline_bg = "#181f26",
  light_bg      = "#222930",
  light_bg2     = "#1d242b",
  mid_bg        = "#2B3033",
  orange        = get_hl_properties("DiagnosticWarn").fg,
  cyan          = get_hl_properties("Special").fg,
  folder        = get_hl_properties("NvimTreeFolderIcon").fg,
  git_add       = get_hl_properties("GitSignsAdd").fg,
  git_del       = get_hl_properties("GitSignsDelete").fg,
  git_change    = get_hl_properties("GitSignsChange").fg,
  warn          = get_hl_properties("DiagnosticWarn").fg,
  error         = get_hl_properties("DiagnosticError").fg,
  info          = get_hl_properties("DiagnosticInfo").fg,
}
--}}}

M.mode_mappings = {--{{{
  ['n']   = {'Normal',       '-'},
  ['no']  = {'Op·Pending',   'P'},
  ['nov'] = {'Op·Pending',   'v'},
  ['noV'] = {'Op·Pending',   'V'},
  ['niI'] = {'(Normal)',     'I'},
  ['niR'] = {'(Normal)',     'R'},
  ['niV'] = {'(Normal)',     'V'},
  ['nt']  = {'Normal',       'T'},
  ['v']   = {'Visual',       'C'},
  ['V']   = {'V·Line',       'L'},
  ['']  = {'V·Block',      'B'},
  ['s']   = {'Select',       '-'},
  ['S']   = {'S·Line',       'L'},
  ['']  = {'S·Block',      'B'},
  ['i']   = {'Insert',       '-'},
  ['ic']  = {'Ins·Compl',    'C'},
  ['ix']  = {'Ins·Compl',    'X'},
  ['R']   = {'Replace',      '-'},
  ['Rv']  = {'Replace',      'V'},
  ['Rx']  = {'Replace',      'X'},
  ['c']   = {'Command',      '-'},
  ['cv']  = {'Vim·Ex',       'Q'},
  ['ce']  = {'Ex',           '-'},
  ['r']   = {'Prompt',       '-'},
  ['rm']  = {'More',         '-'},
  ['r?']  = {'Confirm',      '-'},
  ['!']   = {'Shell',        '-'},
  ['t']   = {'Terminal',     '-'},
  ['']    = {'Empty',        '-'},
}
--}}}

M.vi_mode_colors = {--{{{
  NORMAL        = 'green',
  OP            = 'green',
  INSERT        = 'red',
  VISUAL        = 'skyblue',
  LINES         = 'skyblue',
  BLOCK         = 'skyblue',
  REPLACE       = 'violet',
  ['V-REPLACE'] = 'violet',
  ENTER         = 'cyan',
  MORE          = 'cyan',
  SELECT        = 'orange',
  COMMAND       = 'green',
  SHELL         = 'green',
  TERM          = 'green',
  NONE          = 'yellow'
}
--}}}

M.separators = {--{{{
  vertical_bar       = '┃',
  vertical_bar_thin  = '│',
  left               = '',
  right              = '',
  block              = '█',
  left_filled        = '',
  right_filled       = '',
  slant_left         = '',
  slant_left_thin    = '',
  slant_right        = '',
  slant_right_thin   = '',
  slant_left_2       = '',
  slant_left_2_thin  = '',
  slant_right_2      = '',
  slant_right_2_thin = '',
  left_rounded       = '',
  left_rounded_thin  = '',
  right_rounded      = '',
  right_rounded_thin = '',
  circle             = '●',
  github_icon        = " ﯙ ",
  folder_icon        = " ",
  database           = '  ',
}
--}}}
-- stylua: ignore end

---Returns the VIM mode.
---@return string
function M.vim_mode() --{{{
  local mode = M.mode_mappings[vim.fn.mode()]
  local value = ""

  if vim.g.libmodalActiveModeName then
    mode = { vim.g.libmodalActiveModeName, "U" }
  end

  if mode ~= nil then
    value = mode[1]
    if mode[2] ~= "-" then
      value = value .. " [" .. mode[2] .. "]"
    end
  end
  return value
end --}}}

---Return parent path for specified entry (either file or directory), nil if
-- there is none. Adapted from from galaxyline.
---@param path string
---@return string
local function parent_pathname(path) --{{{
  local i = path:find("[\\/:][^\\/:]*$")
  if not i then
    ---@diagnostic disable-next-line: missing-return-value
    return
  end
  return path:sub(1, i - 1)
end --}}}

---Returns the git directory for the current file. Adapted from from
-- galaxyline.
---@param path string?
---@return string
local function get_git_dir(path, skip_worktree) --{{{
  skip_worktree = skip_worktree or false
  -- Checks if provided directory contains git directory
  local function has_git_dir(dir) --{{{
    local git_dir = dir .. "/.git"
    if vim.fn.isdirectory(git_dir) == 1 then
      return git_dir
    end
  end --}}}

  -- Get git directory from git file if present
  local function has_git_file(dir) --{{{
    if skip_worktree then
      return dir
    end
    local gitfile = io.open(dir .. "/.git")
    if gitfile ~= nil then
      local git_dir = gitfile:read():match("gitdir: (.*)")
      gitfile:close()

      return git_dir
    end
  end --}}}

  -- Check if git directory is absolute path or a relative
  local function is_path_absolute(dir) --{{{
    local patterns = {
      "^/", -- unix
      "^%a:[/\\]", -- windows
    }
    for _, pattern in ipairs(patterns) do
      if string.find(dir, pattern) then
        return true
      end
    end
    return false
  end --}}}

  -- If path nil or '.' get the absolute path to current directory
  if not path or path == "." then
    path = vim.fn.getcwd()
  end

  local git_dir
  -- Check in each path for a git directory, continues until found or reached
  -- root directory
  while path do
    -- Try to get the git directory checking if it exists or from a git file
    git_dir = has_git_dir(path) or has_git_file(path)
    if git_dir ~= nil then
      break
    end
    -- Move to the parent directory, nil if there is none
    path = parent_pathname(path)
  end

  if not git_dir then
    ---@diagnostic disable-next-line: missing-return-value
    return
  end

  if is_path_absolute(git_dir) then
    return git_dir
  end
  return path .. "/" .. git_dir
end --}}}

---Returns the git root of the current file.
---@return string
function M.git_root() --{{{
  local git_dir = get_git_dir()
  if not git_dir then
    return ""
  end

  local root = git_dir:gsub("/.git/?", "")
  -- sub_root is a path to a worktree if exists.
  local sub_root = git_dir:match("/([^/]+)/.git/worktrees/.+$")
  local repo = ""
  if sub_root then
    repo = " [" .. sub_root .. "]"
  end
  return root:match("^.+/(.+)$") .. repo
end --}}}

function M.dir_name(_, opts) --{{{
  if opts.short then
    return vim.fn.expand("%:h"):match("[^/\\]+$") or ""
  end
  return vim.fn.expand("%:h") or ""
end --}}}

local file_provider = require("feline.providers.file")

function M.filename(component, opts) --{{{
  local filename, icon = file_provider.file_info(component, opts)
  local git_dir = get_git_dir(".", true)
  if not git_dir then
    git_dir = ""
  end

  local git_root = git_dir:gsub("/.git", ""):gsub("%-", "%%-")
  -- local git_root = vim.fn.FugitiveCommonDir():gsub("/.git", "")

  local pos = string.find(filename, git_root)
  if pos == nil then
    return filename, icon
  end

  filename = string.sub(filename, pos + string.len(git_root))
  return filename:gsub("^/", ""), ""
end --}}}

function M.search_results() --{{{
  local search_term = vim.fn.getreg("/")
  if search_term == "" then
    return ""
  end
  if search_term:find("@") then
    return ""
  end

  local search_count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })
  if search_count.total == 0 then
    return ""
  end

  search_term = search_term:gsub([[\<]], ""):gsub([[\>]], "")
  return "/" .. search_term .. "[" .. search_count.current .. "/" .. search_count.total .. "]"
end --}}}

function M.locallist_count() --{{{
  local ll = vim.fn.getloclist(vim.fn.winnr(), { idx = 0, size = 0 })
  local count = ll.size
  local current = ll.idx
  return ("  %d/%d "):format(current, count)
end --}}}

function M.quickfix_count() --{{{
  local qf = vim.fn.getqflist({ idx = 0, size = 0 })
  local count = qf.size
  local current = qf.idx
  return ("  %d/%d "):format(current, count)
end --}}}

local lsp_config = { --{{{
  errors = "",
  warnings = "",
  info = "🛈",
  hints = "!",
  ok = "",
  spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
  component_separator = "   ",
  lsp_icon = " ",
}
--}}}
local lsp_names = { --{{{
  ["null-ls"] = "Null",
  ["diagnostics_on_open"] = "Diagnostics",
  ["diagnostics_on_save"] = "Diagnostics",
  bashls = "Bash",
  clangd = "C++",
  dockerls = "Docker",
  gopls = "GoPLS",
  golangci_lint_ls = "GolangCI",
  html = "HTML",
  jedi_language_server = "Python",
  jsonls = "JSON",
  sqls = "SQL",
  sumneko_lua = "Lua",
  tsserver = "TS",
  vimls = "Vim",
  yamlls = "YAML",
}
--}}}
-- Credit goes to the feline author.
function M.lsp_client_names() --{{{
  local clients = {}

  for _, client in pairs(vim.lsp.buf_get_clients(0)) do
    local name = lsp_names[client.name] or client.name
    clients[#clients + 1] = name
  end

  return table.concat(clients, lsp_config.component_separator), lsp_config.lsp_icon
end --}}}

function M.fold_method() --{{{
  local name = ({
    marker = "MKR",
    manual = "MNL",
    syntax = "SYN",
    indent = "IND",
    expr = "EXP",
  })[vim.wo.foldmethod] or vim.wo.foldmethod or "N/A"
  return string.format("%s[%d]", name, vim.wo.foldlevel)
end --}}}

---Turns the severity to a form vim.diagnostic.get accepts.
---@param severity string
---@return string
local function severity_lsp_to_vim(severity) --{{{
  if type(severity) == "string" then
    severity = vim.lsp.protocol.DiagnosticSeverity[severity]
  end
  return severity
end --}}}

---Returns the diagnostic count for the current buffer.
---@param severity string
---@return number
function M.get_diagnostics_count(severity) --{{{
  local active_clients = vim.lsp.buf_get_clients(0)
  if not active_clients then
    return 0
  end

  severity = severity_lsp_to_vim(severity)
  local opts = { severity = severity }
  return #vim.diagnostic.get(vim.api.nvim_get_current_buf(), opts)
end --}}}

---Returns true if there is a diagnostic with the given severity.
---@param severity string
---@return boolean
function M.diagnostics_exist(severity) --{{{
  return M.get_diagnostics_count(severity) > 0
end --}}}

---Common function used by the diagnostics providers
local function diagnostics(severity) --{{{
  local count = M.get_diagnostics_count(severity)
  return count ~= 0 and tostring(count) or ""
end --}}}

---Returns the count of errors and a icon.
---@return string
---@return string
function M.diagnostic_errors() --{{{
  return diagnostics(vim.diagnostic.severity.ERROR), "  "
end --}}}

---Returns the count of warnings and a icon.
---@return string
---@return string
function M.diagnostic_warnings() --{{{
  return diagnostics(vim.diagnostic.severity.WARN), "  "
end --}}}

---Returns the count of hints and a icon.
---@return string
---@return string
function M.diagnostic_hints() --{{{
  return diagnostics(vim.diagnostic.severity.HINT), "  "
end --}}}

---Returns the count of informations and a icon.
---@return string
---@return string
function M.diagnostic_info() --{{{
  return diagnostics(vim.diagnostic.severity.INFO), "  "
end --}}}

local sqls_status = {
  subscribed = false,
  connection = nil,
  database = "default",
}

vim.api.nvim_create_autocmd("User", {
  pattern = "SqlsConnectionChoice",
  callback = function(event)
    local items = vim.split(event.data.choice, " ")
    sqls_status.connection = items[3]
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "SqlsDatabaseChoice",
  callback = function(event)
    sqls_status.database = event.data.choice
  end,
})

function M.sqls_status() --{{{
  if not sqls_status.connection or not sqls_status.database then
    return ""
  end

  return sqls_status.connection .. M.separators.database .. sqls_status.database
end --}}}

function M.recording_macro()
  return "Recording @" .. vim.fn.reg_recording()
end

local function selection_count()
  local mode = vim.api.nvim_get_mode().mode
  local _, from_row, from_col, end_row, end_col
  _, from_row, from_col, _ = unpack(vim.fn.getpos("."))
  _, end_row, end_col, _ = unpack(vim.fn.getpos("v"))
  if end_row < from_row then
    from_row, end_row = end_row, from_row
  end
  if end_col < from_col then
    from_col, end_col = end_col, from_col
  end
  if mode == "v" then
    if from_row == end_row then
      return end_col - from_col + 1
    end
  end
  if mode == "" then
    return string.format("%dx%d", end_row - from_row + 1, end_col - from_col + 1)
  end
  return end_row - from_row + 1
end

function M.visually_selected()
  return "𝒱 " .. selection_count()
end

return M

-- vim: fdm=marker fdl=0
