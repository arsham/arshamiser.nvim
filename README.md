# Arshamiser

![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/arsham/arshamiser.nvim)
![License](https://img.shields.io/github/license/arsham/arshamiser.nvim)

Neovim status bar, colour scheme, and foldtext function.

## Requirements

At the moment it works on the development release of Neovim, and will be
officially supporting [Neovim 0.7.0](https://github.com/neovim/neovim/releases/tag/v0.7.0).

This plugin depends are the following libraries. Please make sure to add them
as dependencies in your package manager:

- [arshlib.nvim](https://github.com/arsham/arshlib.nvim)
- [nvim.lua](https://github.com/norcalli/nvim.lua)

## Installation

Use your favourite package manager to install this library. Packer example:

```lua
use({
  "arsham/arshamiser.nvim",
  config = function()
    require("nvim").ex.colorscheme("arshamiser_light")
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
  config = function()
    require("arshlib.quick").autocmd({"UIEnter", "*", function()
        require("nvim").ex.colorscheme("arshamiser_light")
      end,
    })
  end,
})
```

## License

Licensed under the MIT License. Check the [LICENSE](./LICENSE) file for details.

<!--
vim: foldlevel=1
-->
