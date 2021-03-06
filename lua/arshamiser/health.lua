local M = {}
local health = vim.health or require("health")

local libs = {
  arshlib = "arsham/arshlib.nvim",
  listish = "arsham/listish.nvim",
  plenary = "nvim-lua/plenary.nvim",
  feline = "famiu/feline.lua",
  heirline = "rebelot/heirline.nvim",
  fidget = "j-hui/fidget.nvim",
  ["nvim-web-devicons"] = "kyazdani42/nvim-web-devicons",
  sqls = "nanotee/sqls.nvim",
}

M.check = function()
  health.report_start("Arshamiser Health Check")
  for name, package in pairs(libs) do
    if not pcall(require, name) then
      health.report_error(package .. " was not found", {
        'Please install "' .. package .. '"',
      })
    else
      health.report_ok(package .. " is installed")
    end
  end
end

return M
