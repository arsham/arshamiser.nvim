local M = {}

local libs = {
  heirline = "rebelot/heirline.nvim",
  lualine = "nvim-lualine/lualine.nvim",
  ["nvim-web-devicons"] = "kyazdani42/nvim-web-devicons",
  sqls = "nanotee/sqls.nvim",
  gitsigns = "lewis6991/gitsigns.nvim",
}

M.check = function()
  vim.health.start("Arshamiser Health Check")
  for name, package in pairs(libs) do
    if not pcall(require, name) then
      vim.health.error(package .. " was not found", {
        'Please install "' .. package .. '"',
      })
    else
      vim.health.ok(package .. " is installed")
    end
  end
end

return M
