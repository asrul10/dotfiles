# AGENTS.md

Steam Gaming Mode scripts for this PC. Boots Fedora straight into a Gamescope/Steam
session via GRUB + systemd instead of a desktop session.

## Canary (instructions check)

- If the user asks for the "scope token", reply exactly: `STEAM-SCOPE-OK`

## Files

| File | Deployed to | Role |
|---|---|---|
| `deploy` | (run via sudo) | Installs session units + GRUB entry; creates the `steam` user; sets default boot to Gaming Mode; sets a 3s GRUB timeout and masks unused iSCSI/NFS units |
| `rollback` | (run via sudo) | Removes everything; restores Desktop default |
| `steam-session` | `/usr/local/bin/steam-session` | Supervises gamescope + Steam on tty1; relaunches after a crash; hands off to gdm on a clean exit |
| `steam-session.service` | `/etc/systemd/system/steam-session.service` | Unit: runs `steam-session` as user `steam` on tty1 |
| `steam.target` | `/etc/systemd/system/steam.target` | Gaming Mode boot target (conflicts with display manager/getty) |
| `41_steam_play` | `/etc/grub.d/41_steam_play` | GRUB generator: adds "Steam Gaming Mode" entry, pins running kernel |
| `steamos-session-select` | `/usr/local/bin/steamos-session-select` (+ `/usr/bin` symlink) | Deck UI session hook: "Switch to Desktop" quits Steam for the gdm handoff |
| `49-steam-session.rules` | `/etc/polkit-1/rules.d/49-steam-session.rules` | polkit: user `steam` may start `gdm.service` (desktop handoff) |
| `play` | not deployed | Manual gamescope+Steam command for testing from Desktop |

## Commands

- `sudo ./deploy` — install units + GRUB entry, set Gaming Mode as GRUB default,
  apply boot tuning (idempotent)
- `sudo ./rollback` — undo everything (idempotent, safe anytime)
- `sudo grub2-reboot "Fedora Linux (Steam Gaming Mode)" && reboot` — one-time test boot

## Gotchas

- Kernel is pinned at deploy time. After a kernel upgrade: boot Desktop on the new kernel,
  then re-run `deploy`.
- `41_steam_play` emits nothing and exits 0 if the kernel can't be fully verified, so it
  can never create an unbootable entry.
- Logs: `/tmp/steam-session.log` and `journalctl -u steam-session`.
- `steam-session` supervises the session: after a gamescope/Steam crash (e.g. GPU reset
  -> `VK_ERROR_DEVICE_LOST` -> gamescope SIGABRT, exit 134) it kills leftovers and
  relaunches; after 3 crashes within 3 minutes it stops and leaves logs on tty1.
- A clean exit (rc 0/1) means the user left Gaming Mode: `steam-session` best-effort starts
  gdm (desktop login). "Switch to Desktop" in the Deck UI calls `steamos-session-select`,
  which quits the Steam client to trigger this. Shutdown/reboot stop the unit and never
  start gdm; a crash-giveup leaves logs on tty1 (Ctrl+Alt+Del reboots from there). The
  switch is one-shot: the GRUB default stays Gaming Mode; from the Desktop,
  `sudo systemctl isolate steam.target` returns to Gaming Mode.
- Resolution/refresh hardcoded: 1920x1080@60 in `steam-session` and `play`.
- Never add `RestrictSUIDSGID=yes` to `steam-session.service`: systemd implements it by
  forcing `openat2()` to return ENOSYS, which breaks GNU tar. Steam's first-run bootstrap
  then fails with `Cannot mkdir: Function not implemented` and the session exits.
- `deploy` creates the `steam` user/group + `/home/steam` if missing (without it the unit
  fails with `217/USER` and Gaming Mode boots to a blank tty1).
- `mangoapp` is optional: `--mangoapp` only enables the overlay protocol; install `mangohud`
  (provides `/usr/bin/mangoapp`) for the MangoHud overlay. `deploy` warns when it's missing.
- `deploy` and `rollback` require root and check `id -u`.
- Boot speed tuning: `deploy` sets `GRUB_TIMEOUT=3` in `/etc/default/grub` and masks
  unused iSCSI/NFS units (`iscsi.service`, `iscsi-starter.service`, `iscsi-onboot.service`,
  `iscsid.socket`, `iscsiuio.socket`, `nfs-client.target`). iSCSI is ordered before
  `remote-fs.target` and waits for `network-online.target`, which otherwise makes every
  boot wait 6-7s for `NetworkManager-wait-online`. `rollback` restores `GRUB_TIMEOUT=5`
  and unmasks them. If NFS/iSCSI is ever needed, unmask the relevant units first.
- The Gaming Mode GRUB entry adds `plymouth.enable=0`: no boot splash, text LUKS prompt
  on tty1, and ~0.5s less initrd work. Desktop entries are unchanged.
- ASRock B550 POST is ~14s; enabling "Memory Context Restore" (+ "Power Down Enable") and
  "Fast Boot" in the BIOS cuts it to ~5-7s. Manual, not scripted.
