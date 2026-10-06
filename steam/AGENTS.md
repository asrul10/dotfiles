# AGENTS.md

Steam Gaming Mode scripts for this PC. Boots Fedora straight into a Gamescope/Steam
session via GRUB + systemd instead of a desktop session.

## Scope and access boundary

- Treat this directory (`~/.dotfiles/steam`) as the root project for all work.
- NEVER read, search, list, or modify anything outside this directory — especially the
  parent `~/.dotfiles` directory or any sibling of it. `../` is off-limits.
- NEVER attempt to read any `zshrc` file (e.g. `~/.zshrc`). `opencode.json` in this
  directory enforces a hard `read` deny on it.
- If a task seems to require context from outside this directory, stop and ask the user.
- This file only applies when opencode starts in this directory (or below). Do not run
  `git init` or create a `.git` here unless the user explicitly asks.

## Canary (instructions check)

- If the user asks for the "scope token", reply exactly: `STEAM-SCOPE-OK`

## Files

| File | Deployed to | Role |
|---|---|---|
| `deploy` | (run via sudo) | Installs session units + GRUB entry; sets default boot to Gaming Mode |
| `rollback` | (run via sudo) | Removes everything; restores Desktop default |
| `steam-session` | `/usr/local/bin/steam-session` | Launches gamescope + Steam on tty1; powers off on exit |
| `steam-session.service` | `/etc/systemd/system/steam-session.service` | Unit: runs `steam-session` as user `steam` on tty1 |
| `steam.target` | `/etc/systemd/system/steam.target` | Gaming Mode boot target (conflicts with display manager/getty) |
| `41_steam_play` | `/etc/grub.d/41_steam_play` | GRUB generator: adds "Steam Gaming Mode" entry, pins running kernel |
| `play` | not deployed | Manual gamescope+Steam command for testing from Desktop |

## Commands

- `sudo ./deploy` — install units + GRUB entry, set Gaming Mode as GRUB default (idempotent)
- `sudo ./rollback` — undo everything (idempotent, safe anytime)
- `sudo grub2-reboot "Fedora Linux (Steam Gaming Mode)" && reboot` — one-time test boot

## Gotchas

- Kernel is pinned at deploy time. After a kernel upgrade: boot Desktop on the new kernel,
  then re-run `deploy`.
- `41_steam_play` emits nothing and exits 0 if the kernel can't be fully verified, so it
  can never create an unbootable entry.
- Logs: `/tmp/steam-session.log` and `journalctl -u steam-session`.
- Crash guard: non-zero exit within 180s of boot stays on tty for debugging; otherwise
  leaving the session powers the PC off.
- Resolution/refresh hardcoded: 1920x1080@60 in `steam-session` and `play`.
- Requires a `steam` user/group with home `/home/steam`.
- `deploy` and `rollback` require root and check `id -u`.
