local M = {}

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
  vim.health.report_start("Arshamiser Health Check")
  for name, package in pairs(libs) do
    if not pcall(require, name) then
      vim.health.report_error(package .. " was not found", {
        'Please install "' .. package .. '"',
      })
    else
      vim.health.report_ok(package .. " is installed")
    end
  end
end

return M
