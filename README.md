# Arshamiser

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/arsham/arshamiser.nvim)
![License](https://img.shields.io/github/license/arsham/arshamiser.nvim)

Neovim status bar, colour scheme, foldtext and tabline functions. It has
support for `cmdheight=0` for macro recording message and visually selected
count.

1. [Demo](#demo)
2. [Requirements](#requirements)
3. [Installation](#installation)
   - [Config](#config)
   - [Lazy Loading](#lazy-loading)
4. [License](#license)

## Demo

![folds](https://user-images.githubusercontent.com/428611/148667078-25211d3c-116a-4c6f-938a-bb52b8bb1163.png)

![go](https://user-images.githubusercontent.com/428611/148667079-f441fc97-4157-4ed3-b2bb-81a64d358107.png)

## Requirements

This library supports [Neovim
v0.7.0](https://github.com/neovim/neovim/releases/tag/v0.7.0) and newer.

This plugin depends are the following libraries. Please make sure to add them
as dependencies in your package manager:

- [arshlib.nvim](https://github.com/arsham/arshlib.nvim)
- [feline.nvim](https://github.com/famiu/feline.nvim)
- [heirline.nvim](https://github.com/rebelot/heirline.nvim)
- [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
- [fidget.nvim](https://github.com/j-hui/fidget.nvim)
- [sqls.nvim](https://github.com/nanotee/sqls.nvim)

## Installation

Use your favourite package manager to install this library. Packer example:

```lua
use({
	"arsham/arshamiser.nvim",
	requires = {
		"arsham/arshlib.nvim",
		"famiu/feline.nvim",
		"rebelot/heirline.nvim",
		"kyazdani42/nvim-web-devicons",
		"j-hui/fidget.nvim",
	},
	config = function()
		-- ignore any parts you don't want to use
		vim.api.nvim_command("colorscheme arshamiser_light")
		require("arshamiser.feliniser")
		-- or:
		-- require("arshamiser.heirliniser")

		_G.custom_foldtext = require("arshamiser.folding").foldtext
		vim.opt.foldtext = "v:lua.custom_foldtext()"
		-- if you want to draw a tabline:
		vim.api.nvim_set_option("tabline", [[%{%v:lua.require("arshamiser.tabline").draw()%}]])
	end,
})
```

### Config

By default this pluging uses a palette for the colour scheme. You can use your
own palette if you want:

```lua
local colouriser = require("arshamiser.colouriser")
local palette = {} -- see the palette.lua for the values
colouriser.setup(palette, "my_awesome_scheme")
```

### Lazy Loading

You can defer setting the colorscheme until the UI loads. Packer example:

```lua
use({
	"arsham/arshamiser.nvim",
	requires = {
		"arsham/arshlib.nvim",
		"famiu/feline.nvim",
		"rebelot/heirline.nvim",
		"kyazdani42/nvim-web-devicons",
		"j-hui/fidget.nvim",
		"nanotee/sqls.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("UIEnter", {
			events = "UIEnter",
			pattern = "*",
			callback = function()
				vim.api.nvim_command("colorscheme arshamiser_light")
				require("arshamiser.feliniser")
				-- or:
				-- require("arshamiser.heirliniser")

				_G.custom_foldtext = require("arshamiser.folding").foldtext
				vim.opt.foldtext = "v:lua.custom_foldtext()"
				-- if you want to draw a tabline:
				vim.api.nvim_set_option("tabline", [[%{%v:lua.require("arshamiser.tabline").draw()%}]])
			end,
		})
	end,
	event = { "UIEnter" },
})
```

## License

Licensed under the MIT License. Check the [LICENSE](./LICENSE) file for details.

<!--
vim: foldlevel=1
-->
