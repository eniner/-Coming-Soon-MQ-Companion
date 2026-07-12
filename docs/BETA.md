# Public beta — testing only

> **This release channel is for EverQuest emulator testers.**  
> It is **not** the final “fully live” product. Defaults and trust boundaries will tighten further before a non-beta channel.

## What “public beta” means

| | Beta (now) | Fully live (later) |
|--|--|--|
| Audience | Informed EMU testers | Broader EMU users |
| Updates | Tip `updates.json` on GitHub + in-app Download & install | Same flow, plus signed builds verified on apply |
| Signing | May be **unsigned**; trust = this GitHub repo | Authenticode required |
| LAN | Off by default; strong token required to bind | Same + clearer warnings / optional allowlist required |
| Live EQ | Blocked by EMU gates | Still blocked |

## Security posture (beta)

Already enforced in this beta:

- Localhost bind by default; LAN only with a **cryptographically strong** token (32+ hex chars)
- Updater only accepts tip/download URLs under `eniner/-Coming-Soon-MQ-Companion` (release CDN only via redirect)
- SHA-256 verify before install; no automatic downgrade
- `/api/update/apply`, `/api/restart`, `/api/lan/firewall` are **loopback-only**
- EMU-only bridge (compile + init + handshake + PE fingerprint)

Still beta limitations (will change for fully live):

- Tip file is not commit-pinned (follows `main`)
- Zips may be unsigned until signing CI is always on
- Empty LAN IP allowlist still means “any LAN IP with the token”

## Install (testers)

1. Download **only** the current prerelease from [Releases](https://github.com/eniner/-Coming-Soon-MQ-Companion/releases) (older betas are removed from public download)
2. Expand → `.\scripts\install-overlay.ps1 -MqPath 'D:\YourMacroQuest'`
3. In EMU: `/plugin MQ2OverlayBridge2`
4. Dashboard: `http://127.0.0.1:38111/` → Settings → Updates uses the public tip automatically

Older release tags/zips are deleted so the public cannot install stale builds. Stay current via **Download & install** or a fresh Releases download.

## Feedback

Report issues on the Coming Soon repo. Do **not** use on Daybreak Live.
