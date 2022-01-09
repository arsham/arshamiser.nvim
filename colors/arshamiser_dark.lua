local colouriser = require("arshamiser.colouriser")
local palette = require("arshamiser.palette")
colouriser.setup(palette.dark, "arshamiser_dark")
-- selene: allow(global_usage)
_G.CURRENT_PALETTE = palette.dark
