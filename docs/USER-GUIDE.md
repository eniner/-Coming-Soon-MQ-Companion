# MQ Overlay Companion — User Guide

Local Windows companion + web dashboard for MacroQuest multibox crews. The companion talks to **MQ2OverlayBridge** (deploy as `MQ2OverlayBridge2.dll`) over a named pipe and serves `http://127.0.0.1:38111/`.

## Quick start

1. Build / copy the bridge DLL into your MQ `plugins` folder as `MQ2OverlayBridge2.dll`.
2. In-game: `/plugin MQ2OverlayBridge2` (or add to autoload via the Setup Wizard).
3. Launch **OverlayCompanion** — it opens the dashboard in Edge/WebView.
4. Confirm the Boxes tab shows each EQ client as **Connected**.

**Bridge API expected: **v6**. If a box shows an API mismatch, unload/reload the plugin.

## Core tabs

| Tab | Purpose |
|-----|---------|
| Status | Vitals, target, group, casting, rules suggestions |
| Boxes | Crew overview, roles, broadcast, reconnect |
| Spawns | Nearby list + minimap; nav path / reachable mesh overlay |
| Inventory | Per-box bag/worn; icons when available |
| Loot | Advanced loot + Loot.ini peers + raid council / rotation |
| Nav | Zone binds, gate gem, MQ2Nav status / ETA |
| Plugins / Macros / Lua | Load/unload and editors |
| Settings | Theme, LAN remote, session tokens, setup wizard |

## Multibox tips

- Assign roles (main / puller / looter / healer) on box cards.
- Use broadcast presets for common `/bc` patterns.
- At **12+ boxes**, companion and UI automatically slow spawn/inventory polls and paginate the Boxes grid. Set **Crew perf threshold** and **Boxes density** under Settings.

## Loot “who can use”

The Loot tab uses a multi-pid inventory cache (`GET /api/inventory/crew`) plus item `classes` / `lvl` from the bridge. Boxes that meet class + level show under **Can use**. Redundant ownership badges use the same crew cache.

## Remote / mobile

1. Settings → enable LAN access, copy the master token.
2. Create a **viewer** or **control** session (optional device label).
3. On another device: open `http://<pc-ip>:38111/mobile.html` and paste the token.
4. Revoke individual devices or **Revoke all** from Settings.
5. Remote clients are rate-limited; API calls require a bearer token when LAN auth is on.

## Nav mesh preview

Requires MQ2Nav loaded with a mesh for the zone. The minimap shows:

- Blue polyline toward the current target (path preview)
- Green **triangle/edge wireframe** from a PathExists grid (`mesh_tris` / `mesh_edges`)

A full Detour/Recast polygon dump still needs MQ2Nav internals not exposed via TLOs.

## Faction / standing

Spawn JSON includes:

- `con` — level-consider color (`GetConLevel`)
- `standing` — consider-chat standing (ALLY…SCOWLING) when known, else mirrors `con`
- `faction` / `race` — race string as watchlist grouping key
- `faction_source` — `consider` | `race_proxy`

The bridge auto-`/consider`s the current target (throttled) and parses the chat reply. FactionManagerClient offsets remain unmapped.

## Privacy

Usage tips and personalization stay in **local SQLite** on the companion PC. Nothing is phoned home.
