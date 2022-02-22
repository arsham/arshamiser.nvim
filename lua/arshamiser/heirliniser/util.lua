local utils = require("heirline.utils")

local M = {}

-- stylua: ignore start
M.colours = {--{{{
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
  orange        = utils.get_highlight("DiagnosticWarn").fg,
  folder        = utils.get_highlight("NvimTreeFolderIcon").fg,
  cyan          = utils.get_highlight("Special").fg,
  diag = {
    warn  = utils.get_highlight("DiagnosticWarn").fg,
    error = utils.get_highlight("DiagnosticError").fg,
    hint  = utils.get_highlight("DiagnosticHint").fg,
    info  = utils.get_highlight("DiagnosticInfo").fg,
  },
  git = {
    del    = utils.get_highlight("DiffDelete").bg,
    add    = utils.get_highlight("DiffAdd").fg,
    change = utils.get_highlight("DiffChange").fg,
  },
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
}
--}}}

local mode_colors = { --{{{
  NORMAL        = "green",
  OP            = "green",
  INSERT        = "red",
  VISUAL        = "skyblue",
  LINES         = "skyblue",
  BLOCK         = "skyblue",
  REPLACE       = "violet",
  ["V-REPLACE"] = "violet",
  ENTER         = "cyan",
  MORE          = "cyan",
  SELECT        = "orange",
  COMMAND       = "green",
  SHELL         = "green",
  TERM          = "green",
  NONE          = "yellow",
} --}}}

M.mode_names = { --{{{
  n      = { "Normal", "-" },
  no     = { "Op·Pending", "P" },
  nov    = { "Op·Pending", "v" },
  noV    = { "Op·Pending", "V" },
  niI    = { "(Normal)", "I" },
  niR    = { "(Normal)", "R" },
  niV    = { "(Normal)", "V" },
  nt     = { "Normal", "T" },
  v      = { "Visual", "C" },
  V      = { "V·Line", "L" },
  [""] = { "V·Block", "B" },
  s      = { "Select", "-" },
  S      = { "S·Line", "L" },
  [""] = { "S·Block", "B" },
  i      = { "Insert", "-" },
  ic     = { "Ins·Compl", "C" },
  ix     = { "Ins·Compl", "X" },
  R      = { "Replace", "-" },
  Rv     = { "Replace", "V" },
  Rx     = { "Replace", "X" },
  c      = { "Command", "-" },
  cv     = { "Vim·Ex", "Q" },
  ce     = { "Ex", "-" },
  r      = { "Prompt", "-" },
  rm     = { "More", "-" },
  ["r?"] = { "Confirm", "-" },
  ["!"]  = { "Shell", "-" },
  t      = { "Terminal", "-" },
  [""]   = { "Empty", "-" },
} --}}}

local mode_alias = { --{{{
  n        = "NORMAL",
  no       = "OP",
  nov      = "OP",
  noV      = "OP",
  ["no"] = "OP",
  niI      = "NORMAL",
  niR      = "NORMAL",
  niV      = "NORMAL",
  nt       = "NORMAL",
  v        = "VISUAL",
  V        = "LINES",
  [""]   = "BLOCK",
  s        = "SELECT",
  S        = "SELECT",
  [""]   = "BLOCK",
  i        = "INSERT",
  ic       = "INSERT",
  ix       = "INSERT",
  R        = "REPLACE",
  Rc       = "REPLACE",
  Rv       = "V-REPLACE",
  Rx       = "REPLACE",
  c        = "COMMAND",
  cv       = "COMMAND",
  ce       = "COMMAND",
  r        = "ENTER",
  rm       = "MORE",
  ["r?"]   = "CONFIRM",
  ["!"]    = "SHELL",
  t        = "TERM",
  ["null"] = "NONE",
} --}}}
-- stylua: ignore end

---Returns the designated colour for the mode.
---@param mode string
---@return string
function M.mode_colour(mode)
  return M.colours[mode_colors[mode_alias[mode]]]
end

function M.lsp_client_names()
  local names, _ = require("arshamiser.feliniser.util").lsp_client_names()
  return names
end

return M

-- vim: fdm=marker fdl=0
