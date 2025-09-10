# Agent Development Guide

This is a Neovim colorscheme and statusline plugin written in Lua.

## Build/Test Commands

Manual testing is done by asking the user to run it. NEVER try to test the code
or run neovim/nvim, ALWAYS ask the user to conduct the test and inform you of
the outcome.

## Code Style Guidelines

- **Language**: Lua for Neovim plugins
- **Formatting**: Uses stylua (see `-- stylua: ignore` blocks for palette data)
- **Naming**: snake_case for functions and variables, PascalCase for highlight groups
- **Comments**: Use `-- {{{` and `-- }}}` for fold markers, document function purpose with `---` annotations
- **Diagnostics**: Suppress known Lua LS warnings with `---@diagnostic disable-next-line:`
- **Functions**: Mark private functions as `local`, return module table with `M.function_name`
- **Globals**: Use `vim.*` APIs, registered globals: `vim`, `_t`, `require` (see .luarc.json)
- **Dependencies**: Require external deps at function call time with `pcall(require, "module")`
- **Error handling**: Always check `pcall` results before using loaded modules
- **Tables**: Prefer explicit table construction, use trailing commas for multi-line tables
