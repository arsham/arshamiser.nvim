---
type: work
system: loom
title: Replace Feline with Lualine while preserving Arshamiser's statusline
status: awaiting-user-validation
---

# Lualine statusline migration

## Outcome

Replace the archived Feline statusline with Lualine while retaining the
established Arshamiser layout, colours, separators, information hierarchy, and
active/inactive distinction.

## Folded durable truth

- `lua/arshamiser/lualiner/init.lua` is the supported Lualine integration. It
  preserves the three visual regions, mode and position capsules, angled
  separators, adaptive visibility, and the former status components.
- `lua/arshamiser/statusline.lua` owns the neutral providers shared by
  Lualine and Heirline. Heirline no longer imports Feline or Feline-namespaced
  project helpers.
- The Feline runtime files were removed from Arshamiser. Lualine is the
  documented default, and Heirline remains the supported alternative.
- The unused Arshamiser `arshlib.nvim` dependency was removed from the public
  dependency examples, health checks, and Lua workspace configuration.
- README, Vim help, and health checks now describe the current dependency and
  setup contract. Historical Feline behaviour remains available through Git
  history when visual comparison is needed.
- User comparison testing resolved the reported alignment, ribbon colour,
  separator, spacing, emphasis, and unnamed-buffer issues.

## Remaining acceptance

- The user should spot-check optional Copilot, Overseer, SQLS, spell,
  quickfix, location-list, diagnostic, and LSP states where available.
- Agents must not run Neovim. The repository policy requires the user to
  perform runtime and visual checks.
- If the optional checks reveal no regression, remove this pointer; no further
  product implementation is planned for this migration.

## Authoritative paths

- `lua/arshamiser/lualiner/init.lua`: Lualine integration.
- `lua/arshamiser/statusline.lua`: shared statusline providers.
- `lua/arshamiser/heirliniser/`: Heirline integration boundary.
- `README.md`, `doc/arshamiser.txt`, and `lua/arshamiser/health.lua`: public
  dependency and setup contract.
- `AGENTS.md`: project validation constraints.
- Pre-migration Feline implementation: Git history before the migration.

## Verification evidence

- Lua parsing, targeted Stylua checks, Selene, Lua LSP diagnostics, and
  `git diff --check` passed for the migration and Feline removal.
- Selene reports zero source errors and warnings; its Lua 5.2 feature message
  is a tool configuration notice.
- The Arshamiser working tree was clean after the Feline removal commit.
