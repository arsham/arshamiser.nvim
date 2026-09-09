---
type: work
system: loom
title: Replace Feline with Lualine while preserving Arshamiser's statusline
status: awaiting-user-validation
---

# Lualine statusline migration

## Outcome

Replace the archived `famiu/feline.nvim` integration with a maintained
`nvim-lualine/lualine.nvim` implementation that retains the established
Arshamiser statusline's visual language and user-visible information.

## Current behaviour and evidence

- `lua/arshamiser/feliniser/init.lua` is the reference implementation: it
  defines the active and inactive statuslines, including coloured mode and
  position capsules, angled separators, three visual regions, and adaptive
  truncation.
- It shows mode, scrollbind and fold state, macro recording, Git branch and
  diff counts, repository-relative file information and size, optional
  Copilot/Overseer/LSP/SQLS information, diagnostics, spell state, file icon
  and type, search results, quickfix/location-list counts, visual selection
  size, percentage, and cursor position.
- `lua/arshamiser/lualiner/init.lua` now provides the active/inactive visual
  shell and the Feline component map: mode, scrollbind, fold, macro, Git,
  repository-relative file data, optional integrations, diagnostics, search,
  quickfix/location-list, selection, and cursor state are conditionally shown
  with former colour roles and separators.
- `lua/arshamiser/statusline.lua` now owns Feline-independent statusline
  helpers. `lua/arshamiser/heirliniser/` uses that module rather than
  `arshamiser.feliniser.util`, so removing Feline later will not break the
  supported alternative.
- `README.md`, `doc/arshamiser.txt`, and `lua/arshamiser/health.lua` still
  advertise or check Feline. The README currently presents Feline as the
  enabled setup and Lualine as an alternative.
- No automated tests or local Lualine checkout are present. Repository
  instructions prohibit agents from running Neovim; final runtime and visual
  verification must be performed by the user.
- `../shark/lua/plugins/arshamiser.lua` now installs Lualine and loads
  `arshamiser.lualiner` for the user test. Feline remains in Shark only because
  its Navic winbar configuration still depends on it; that separate dependency
  is outside this migration slice.
- User visual comparison found the initial Lualine file group flush left and
  its position format unlike Feline. The Lualine configuration now inserts the
  same elastic spring before the middle group and renders position as
  `line:column`.
- Follow-up comparison found the flexible ribbon too dark, missing group-edge
  triangles, cramped LSP icon spacing, and incorrect emphasis and colour in the
  position tail. The ribbon now uses the lighter background, the right group
  has an explicit leading triangle, and position and percentage styling match
  Feline. A further comparison identified cramped content at all four ribbon
  edges; explicit inner spaces now separate content from each triangle and the
  rounded position cap.
- An empty unnamed buffer still displays the repository root, so filename-only
  conditions hid the centre ribbon triangles around visible content. Centre
  edges and padding now use a shared content condition that also recognises a
  Git repository. User retesting is pending.

## Scope and exclusions

- Make Lualine the documented and functional statusline integration.
- Preserve the Feline statusline's recognisable layout, colour roles,
  separators, active/inactive distinction, and applicable information.
- Remove Feline as a runtime and documented dependency without leaving the
  Heirline integration dependent on Feline-namespaced helpers.
- Keep colourschemes, foldtext, custom tabline, and the Heirline alternative
  working unless a change is necessary to sever the Feline dependency.
- Do not redesign the statusline, replace the tabline, change unrelated colour
  groups, or add a new statusline framework.

## Acceptance and proof

1. Requiring `arshamiser.lualiner` works with Lualine and without Feline.
2. The active statusline retains the former three-region composition and
   mode-coloured end caps, and the inactive statusline remains visually
   distinct.
3. The user-visible components listed in Current behaviour are retained where
   their optional provider/plugin is available, or are safely absent when it
   is not.
4. `arshamiser.heirliniser` no longer requires Feline modules or
   Feline-namespaced project helpers.
5. README, Vim help, and health checks name only the actual supported runtime
   dependencies and show Lualine as the standard setup.
6. Static Lua/style checks configured by the repository pass. The user manually
   verifies a dark and light palette in normal, insert, inactive split, Git
   changes, diagnostics, and a narrow window, and reports the outcome; agents
   must not run Neovim.

## Authoritative paths

- `lua/arshamiser/feliniser/init.lua` and `lua/arshamiser/feliniser/util.lua`:
  former statusline behaviour and appearance.
- `lua/arshamiser/lualiner/init.lua`: Lualine integration to replace.
- `lua/arshamiser/heirliniser/`: compatibility boundary for shared helpers.
- `lua/arshamiser/palette.lua` and `lua/arshamiser/colouriser.lua`: palette and
  highlight sources.
- `README.md`, `doc/arshamiser.txt`, and `lua/arshamiser/health.lua`:
  supported installation and dependency contract.
- `AGENTS.md`: Lua conventions and manual-runtime-test restriction.

## Decisions and rationale

- Treat the current Feline implementation, rather than the sparse existing
  Lualine file, as the visual and behavioural baseline: it is the only local
  source that defines the established statusline.
- Extract or replace Feline-specific provider helpers behind a neutral project
  module before deleting Feline-specific code. This preserves the documented
  Heirline alternative and gives Lualine reusable custom components.
- Prefer Lualine built-ins for its standard Git, diagnostic, filename, and
  location components only where their output and styling meet the baseline;
  use project components for the remaining behaviour and shaped separators.

## Component mapping

| Feline surface | Lualine placement | Implementation |
| --- | --- | --- |
| Mode badge and coloured end caps | `lualine_a`, `lualine_z` | Custom components using the current mode and mode colour. |
| Scrollbind, fold state, macro recording | `lualine_b` | Neutral conditional helpers. |
| Git branch and change counts | `lualine_b` | Lualine built-ins, styled with the existing colour roles. |
| Repository root, path, modified/readonly state, size | `lualine_c` | Neutral project helpers and a custom file-information component. |
| Copilot, Overseer, LSP names, diagnostics, spell, SQLS | `lualine_x` | Guarded optional helpers and custom diagnostic components. |
| File icon/type and search results | `lualine_x` | Web-devicons-backed and neutral helpers. |
| Quickfix/location-list counts, visual selection, percentage, position | `lualine_y` and `lualine_z` | Neutral conditional helpers inside the coloured tail. |
| Inactive Git, file information, and position tail | `inactive_sections` | Custom inactive components retaining the muted palette and separators. |

Lualine's section model cannot guarantee Feline's exact elastic three-column
alignment. The migration preserves the three visual groups, their separator
shapes, colour roles, information hierarchy, and responsive priority; it does
not promise pixel-identical column positions.

## Delivery slices

1. Complete: shape and record the component map and Lualine compatibility
   boundary.
2. Complete: extract neutral helpers and make Heirline independent of
   Feline-namespaced project utilities.
3. Complete: implement the Lualine active/inactive visual shell, palette
   roles, and three-group information hierarchy.
4. Complete: restore the remaining conditional components, optional
   integrations, and responsive behaviour. Stop for user live testing before
   retiring Feline or changing public documentation.

## Unresolved context

- Current Lualine API documentation and compatibility details have not been
  inspected: this session has no authorised web-capable tool and no local
  Lualine checkout. Validate the exact component, colour, separator, and
  refresh APIs from the upstream source before implementation.
- “Look and feel” needs visual comparison rather than pixel-perfect automated
  proof. The Feline source defines the target components, but no local baseline
  screenshots or test matrix exist.
- The minimum supported Neovim version is documented as 0.8.0. Confirm that the
  current Lualine release and chosen APIs support it, or explicitly update the
  compatibility contract with user approval.
- Decide during the component map whether optional Copilot, Overseer, and SQLS
  indicators remain supported; the default is to preserve them with guarded
  optional loading.

## Owner and next action

The primary agent owns the migration. Next, the user runs the visual/runtime
matrix against Shark's Lualine configuration and reports any differences.
Only then may the migration retire Feline from Arshamiser and align public
documentation.

## Verification

Inspect the implementation against the Feline reference; run configured static
checks without launching Neovim; then ask the user to perform the manual
visual/runtime matrix in Acceptance and proof.
