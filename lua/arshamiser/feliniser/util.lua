local nvim = require("nvim")

local M = {}

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
-- stylua: ignore
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
}
--}}}
-- stylua: ignore
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
-- stylua: ignore
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
-- stylua: ignore
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
}
--}}}
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
    return
  end
  return path:sub(1, i - 1)
end --}}}

---Returns the git directory for the current file. Adapted from from
-- galaxyline.
---@param path string
---@return string
local function get_git_dir(path) --{{{
  -- Checks if provided directory contains git directory
  local function has_git_dir(dir)
    local git_dir = dir .. "/.git"
    if vim.fn.isdirectory(git_dir) == 1 then
      return git_dir
    end
  end

  -- Get git directory from git file if present
  local function has_git_file(dir) --{{{
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

local function short_filename(short) --{{{
  if #vim.fn.expand("%:p") == 0 then
    return "-"
  end
  if short then
    return vim.fn.expand("%:t")
  end
  return vim.fn.expand("%:~")
end --}}}

local function file_readonly() --{{{
  if vim.bo.filetype == "help" then
    return ""
  end
  local icon = ""
  if vim.bo.readonly == true then
    return " " .. icon .. " "
  end
  return ""
end --}}}

function M.filename(_, opts) --{{{
  local short = opts.short or false
  local file = short_filename(short)
  if vim.fn.empty(file) == 1 then
    return ""
  end
  if string.len(file_readonly()) ~= 0 then
    return file .. file_readonly()
  end
  local icon = ""
  if vim.bo.modifiable and vim.bo.modified then
    return file .. " " .. icon .. "  "
  end
  return file .. " "
end --}}}

function M.search_results() --{{{
  local lines = vim.api.nvim_buf_line_count(0)
  if lines > 50000 then
    return ""
  end
  local search_term = vim.fn.getreg("/")
  if search_term == "" then
    return ""
  end
  if search_term:find("@") then
    return ""
  end

  local search_count = vim.fn.searchcount({ recompute = 1, maxcount = -1 })
  local active = false
  if vim.v.hlsearch and vim.v.hlsearch == 1 and search_count.total > 0 then
    active = true
  end
  if not active then
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
}
--}}}
local lsp_names = { --{{{
  sumneko_lua = "Lua",
  ["null-ls"] = "Null",
  gopls = "GoPLS",
  bashls = "Bash",
  vimls = "Vim",
  dockerls = "Docker",
  jedi_language_server = "Python",
  html = "HTML",
  clangd = "C++",
  tsserver = "TS",
  sqls = "SQL",
  jsonls = "JSON",
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

  return table.concat(clients, "   "), " "
end --}}}

function M.get_lsp_progress() --{{{
  local messaging = require("lsp-status/messaging")
  local buf_messages = messaging.messages()
  local msgs = {}
  for _, msg in ipairs(buf_messages) do
    local contents
    if msg.progress then
      contents = msg.title
      -- this percentage format string escapes a percent sign once to
      -- show a percentage and one more time to prevent errors in vim
      -- statusline's because of it's treatment of % chars
      if msg.percentage then
        contents = contents .. string.format(" (%.0f%%%%)", msg.percentage)
      end

      if msg.spinner then
        contents = lsp_config.spinner_frames[(msg.spinner % #lsp_config.spinner_frames) + 1]
          .. " "
          .. contents
      end
    else
      contents = msg.content
    end
    contents = contents:gsub("%s*workspace", "")
    table.insert(msgs, contents)
  end
  return table.concat(msgs, lsp_config.component_separator)
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

-- Adopted from the feline codebase.

---Returns true if a LSP server is attached to the current buffer.
---@return boolean
function M.is_lsp_attached() --{{{
  return next(vim.lsp.buf_get_clients(0)) ~= nil
end --}}}

---Returns true if at least one of the LSP servers has the given capability.
---@param capability string
---@return boolean
function M.has_lsp_capability(capability) --{{{
  local clients = vim.lsp.buf_get_clients(0)
  for _, client in pairs(clients) do
    local capabilities = client.resolved_capabilities
    if capabilities and capabilities[capability] then
      return true
    end
  end
  return false
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

---Checks for dependency updates. It adds the found upgrades to the quickfix
-- list.
---@param filename string should be the full path of the go.mod file.
function M.go_mod_check_upgrades(filename) --{{{
  local f = io.open(filename, "r")
  local contents = f:read("*a")
  f:close()
  local modules = {}
  for line in contents:gmatch("[^\r\n]+") do
    local module = line:match("^%s+([%a\\/\\.-]+)%s+[^%s\\/]+")
    if module then
      table.insert(modules, module)
    end
  end

  vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
    for _, diag in pairs(result.diagnostics) do
      local cur_list = vim.fn.getqflist()
      local item = {
        filename = filename,
        lnum = diag.range.start.line + 1,
        col = diag.range.start.character + 1,
        text = diag.message,
      }
      table.insert(cur_list, item)
      vim.fn.setqflist(cur_list)
      nvim.ex.copen()
    end

    vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.diagnostic.on_publish_diagnostics
  end

  local command = {
    command = "gopls.check_upgrades",
    arguments = { {
      URI = "file:/" .. filename,
      Modules = modules,
    } },
  }
  -- FIXME: check if at least one of the clients supports this.
  vim.lsp.buf.execute_command(command)
end --}}}

return M

-- vim: fdm=marker fdl=0
