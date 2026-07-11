# EverQuest emulator hard gates

MQ Overlay Companion is **intended for, built for, and only for EverQuest emulator**.

Daybreak **Live** / Test clients are not supported and are blocked by multiple layers.

## Four hard gates (bridge API v8)

| # | Layer | Behavior |
|---|--------|----------|
| 1 | **Compile-time** | `MQ2OverlayBridge` will not build unless MacroQuest is an **EMU** client (`IS_EMU_CLIENT`). Live/Test builds fail with `#error`. |
| 2 | **Plugin init** | On `/plugin MQ2OverlayBridge2`, the plugin checks the allowlisted `__ClientDate` (RoF2 EMU `20130510` by default) and rejects Live-looking `eqgame` version strings. Failure → refuses to run and auto-unloads. |
| 3 | **Pipe handshake** | Every state frame must include `client_kind:"emu"`, `mq_build:"Emu"`, and an allowlisted `client_date`. The companion drops the session otherwise (`health: emu_blocked`) and will not send commands. |
| 4 | **eqgame.exe fingerprint** | Before connecting, the companion skips processes whose PE `FileVersion` / `ProductVersion` embeds recent years typical of Daybreak Live patches (2016–2030). |

Blocked UI status: **“EMU only — Live blocked”**.

## What this means for users

- Install only against **MacroQuest Emu** + a **RoF2-era EQ emulator** client.
- After upgrading to **0.7.0-beta.3+**, reload the bridge in-game: `/plugin MQ2OverlayBridge2 unload` then `/plugin MQ2OverlayBridge2`.
- Older bridges without handshake fields are rejected by the companion (API mismatch / missing EMU fields).

## Related docs

- [User Guide](USER-GUIDE.md)
- [API](API.md)
