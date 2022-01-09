local M = {}
local health = require("health")

M.check = function()
  health.report_start("Arshamiser Health Check")
  if not pcall(require, "arshlib") then
    health.report_error("arshlib.nvim was not found", {
      'Please install "arsham/arshlib.nvim"',
    })
  else
    health.report_ok("arshlib.nvim is installed")
  end

  if not pcall(require, "feline") then
    health.report_error("feline.nvim was not found", {
      'Please install "famiu/feline.nvim"',
    })
  else
    health.report_ok("feline.nvim is installed")
  end

  if not pcall(require, "lsp-status") then
    health.report_error("lsp-status.nvim was not found", {
      'Please install "nvim-lua/lsp-status.nvim"',
    })
  else
    health.report_ok("lsp-status.nvim is installed")
  end

  if not pcall(require, "nvim-web-devicons") then
    health.report_error("nvim-web-devicons", {
      'Please install "kyazdani42/nvim-web-devicons"',
    })
  else
    health.report_ok("nvim-web-devicons is installed")
  end

  if not pcall(require, "nvim") then
    health.report_error("nvim.lua was not found", {
      'Please install "norcalli/nvim.lua"',
    })
  else
    health.report_ok("nvim.lua is installed")
  end
end

return M
