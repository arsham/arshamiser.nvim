local function title(bufnr, sel)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local fname = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[EMPTY]"
  local c = "%#TabLine#"
  if sel then
    c = "%#TabLineSel#"
  end
  return table.concat({ c, (" %s "):format(fname) })
end

local function modified(bufnr, sel)
  if vim.api.nvim_buf_get_name(bufnr) == "" then
    return ""
  end

  if not vim.api.nvim_buf_get_option(bufnr, "modified") then
    return ""
  end

  return table.concat({
    sel and "" or " ",
    sel and "%#TabLineModifiedSel#" or "%#TabLineModified#",
    "●",
  })
end

local function separator(sel)
  return table.concat({ sel and "%#TabLineSepSel#" or "%#TabLineSep#", "▏" })
end

local function draw()
  local tabline = {}

  for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
    local sel = tab == vim.api.nvim_get_current_tabpage()
    local bufnr = vim.api.nvim_win_get_buf(vim.api.nvim_tabpage_get_win(tab))
    local label = { ("%%%dT"):format(vim.api.nvim_tabpage_get_number(tab)) }
    table.insert(label, separator(sel))
    table.insert(label, title(bufnr, sel))
    table.insert(label, modified(bufnr, sel))
    table.insert(label, " %#TabLineFill#")

    table.insert(tabline, table.concat(label))
  end

  return table.concat(tabline)
end

return {
  draw = draw,
}
