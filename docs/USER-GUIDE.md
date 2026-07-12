# MQ Overlay Companion — User Guide

> **EverQuest emulator only.**  
> This companion is built for MacroQuest on **EQ emulator (RoF2-era)** clients.  
> It is **not** for Daybreak Live and will not be supported on Live.

Local Windows companion + web dashboard for MacroQuest **EMU** multibox crews. The companion talks to **MQ2OverlayBridge** (deploy as `MQ2OverlayBridge2.dll`) over a named pipe and serves `http://127.0.0.1:38111/`.

## Requirements

| Required | Notes |
|----------|--------|
| EverQuest **emulator** client | RoF2-era EMU (`client_date` allowlist, e.g. `20130510`) |
| MacroQuest **Emu** build | Live / Test MQ builds are rejected |
| `MQ2OverlayBridge2.dll` | Bridge API **v8** (EMU handshake required) |
| Windows | Companion hosts the dashboard locally |

**Not supported:** Daybreak Live EverQuest, Live Test, or any Live client.

### EMU hard gates (v8)

1. **Compile-time** — bridge will not build for Live/Test (`IS_EMU_CLIENT` required).
2. **Plugin init** — refuses to load if client date / eqgame version looks like Live; auto-unloads.
3. **Pipe handshake** — every state frame must include `client_kind:"emu"`, `mq_build:"Emu"`, and an allowlisted `client_date`. Companion drops the session otherwise (`health: emu_blocked`).
4. **eqgame.exe fingerprint** — companion skips processes whose PE version string looks like a modern Live build.

Blocked sessions report `health:"emu_blocked"` and do not accept commands. See also [EMU hard gates](EMU-GATES.md).

**Bridge API expected: v8.** If a box shows an API mismatch or `emu_blocked`, unload/reload the current EMU bridge DLL.

## Quick start

1. Build / copy the bridge DLL into your MQ `plugins` folder as `MQ2OverlayBridge2.dll`.
2. In your **EMU** client: `/plugin MQ2OverlayBridge2` (or add to autoload via the Setup Wizard).
3. Launch **OverlayCompanion** — it opens the dashboard in Edge/WebView.
4. Confirm the Boxes tab shows each EQ **emulator** client as **Connected** (not `emu_blocked`).

## Core tabs

| Tab | Purpose |
|-----|---------|
| Status | Vitals, target, group, casting, alerts, automation rules |
| Console | Live game/MQ/macro/Lua log, SQLite search, export, send commands |
| Spawns | Nearby list + minimap legend; nav path / mesh overlay; watchlist |
| Inventory | Worn/bags/bank + live character sheet from the bridge (icons + item stats; no EZInventory required) |
| Loot | AdvLoot + corpse LootWnd; row Keep/Ignore/Destroy/Sell → Loot.ini; peers + raid council |
| Nav | Zone binds, gate/succor, MQ2Nav status / ETA / camps |
| Boxes | Crew overview, roles, broadcast, reconnect, Ctrl+1–9 |
| Hotbuttons | Global/per-character command sets |
| Plugins / Macros / Lua | Load/unload, editors, bulk stop/unload |
| INI | Grouped Config browser + safe save |
| Settings | Theme, Ghost, LAN remote, session tokens, setup wizard |

## Multibox tips

- Assign roles (main / puller / looter / healer) on box cards.
- Use broadcast presets for common `/bc` / DanNet patterns.
- At **12+ boxes**, companion and UI automatically slow spawn/inventory polls and paginate the Boxes grid. Set **Crew perf threshold** and **Boxes density** under Settings.
- **Ctrl+1–9** switches the active box from the top bar.

## Loot “who can use”

The Loot tab uses a multi-pid inventory cache (`GET /api/inventory/crew`) plus item `classes` / `lvl` from the bridge. Boxes that meet class + level show under **Can use**. Redundant ownership badges use the same crew cache.

## Remote / mobile

1. Settings → enable LAN access, copy the master token.
2. Create a **viewer** or **control** session (optional device label).
3. On another device: open `http://<pc-ip>:38111/mobile.html` and paste the token.
4. Revoke individual devices or **Revoke all** from Settings.
5. Remote clients are rate-limited; API calls require a bearer token when LAN auth is on.

## Nav mesh preview

Requires MQ2Nav loaded with a mesh for the zone on your **EMU** install. The minimap shows:

- Blue polyline toward the current target (path preview)
- Green wireframe from Detour `.navmesh` poly dump when available (`mesh_mode: detour_polys`)
- Fallback PathExists triangle/edge grid (`mesh_mode: pathexists_tris`)

## Faction / standing (EMU)

Spawn JSON includes:

- `con` — level-consider color (`GetConLevel`)
- `standing` — FactionTable / FactionManager / consider-chat standing when known
- `faction` / `race` — race string as watchlist grouping key
- `faction_source` — `faction_table` | `faction_manager` | `consider` | `race_proxy`

On supported EMU builds, standing can resolve from FactionTable without a visible `/consider`. The bridge may still auto-consider the current target (throttled) to learn IDs when needed.

## UI chrome

- **Focus** — denser overlay; Exit Focus / Esc / Ctrl+Shift+F always works
- **Compact** — vitals-focused strip
- **Ghost** — transparent panels over the EQ window
- **Sidebar** — collapse to icons
- **Hide/show window** — **Ctrl+Z** (dedicated overlay window only — never your normal browser)
- Sidebar brand shows an **EQ Emulator only** badge

## Privacy

Usage tips and personalization stay in **local SQLite** on the companion PC. Nothing is phoned home.
