local regexes = {
  "^%s*if.+then%s*$",
  "^%s*for.+do%s*$",
  "%s*function.+(.*)%s*$",
}

---Returns true if the line is a lua block.
---@param text string
---@return boolean
local function lua_block(text)
  for _, pat in ipairs(regexes) do
    if text:find(pat) then
      return true
    end
  end
  return false
end

---Renders like these:
-- »» TSString = {··} ········································ «« [ 223]·····
-- »» Setup function ········································· «« [ 666]·····
--
-- The marker is cut. If there are any comments before it, will go in the text.
-- selene: allow(global_usage)
local function foldtext()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_text = line:gsub(" *", "", 1)

  if line_text:match("--.*{{{%d*$") then
    line_text = line_text:gsub("-+%s*([^-]*[^{]*)%s*{{{.*", "%1", 1)
  end

  local dot = "·"
  local add = 0 -- increasing add variable for those added dots
  line_text = line_text:gsub("%s+$", "")
  if line_text:match("{[%s-{]*$") then
    line_text = string.format("%s%s%s}", line_text, dot, dot)
    add = 2
  elseif line_text:match("%([^$)]*$") then
    line_text = string.format("%s%s%s)", line_text, dot, dot)
  end

  if vim.bo.filetype == "lua" and lua_block(line_text) then
    line_text = string.format("%s {%s%s} end", line_text, dot, dot)
    add = 2
  end

  if vim.bo.filetype == "markdown" then
    line_text = line_text:gsub("^%s*#*%s*(.+)", "%1")
  end

  local icon = ""
  local fillcharcount = vim.bo.textwidth - #line_text + add
  local folded_line_num = vim.v.foldend - vim.v.foldstart
  return table.concat({
    "»»",
    line_text,
    string.rep(dot, fillcharcount),
    "««",
    "[" .. icon,
    folded_line_num .. "]",
  }, " ")
end

return {
  foldtext = foldtext,
}
