local colouriser = require("arshamiser.colouriser")
local palette = require("arshamiser.palette")
colouriser.setup(palette.light, "arshamiser_light")
-- selene: allow(global_usage)
_G.CURRENT_PALETTE = palette.light
