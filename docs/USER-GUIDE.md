# MQ Overlay Companion — User Guide

Local Windows companion + web dashboard for MacroQuest multibox crews. The companion talks to **MQ2OverlayBridge** (deploy as `MQ2OverlayBridge2.dll`) over a named pipe and serves `http://127.0.0.1:38111/`.

## Quick start

1. Build / copy the bridge DLL into your MQ `plugins` folder as `MQ2OverlayBridge2.dll`.
2. In-game: `/plugin MQ2OverlayBridge2` (or add to autoload via the Setup Wizard).
3. Launch **OverlayCompanion** — it opens the dashboard in Edge/WebView.
4. Confirm the Boxes tab shows each EQ client as **Connected**.

Bridge API expected: **v5**. If a box shows an API mismatch, unload/reload the plugin.

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

1. Settings → enable LAN → **Apply LAN & Restart**.
2. Settings → Remote access: set **PC IP the phone can reach** (same IP that already loads the UI), then **New PIN / QR**.
3. Phone: scan with the **Camera** app (**not Google Authenticator** — that app only reads 2FA secrets and will say “cannot interpret”), or **Copy phone link** into the browser address bar, or type the **6-digit PIN** on `/m`.
4. Do **not** hand-type the 32-character master hex, and do **not** Google `/mobile.html`.
5. Optional: longer-lived viewer/control sessions; revoke from Settings.

## Nav mesh preview

Requires MQ2Nav loaded with a mesh for the zone. The minimap shows:

- Blue polyline toward the current target (path preview)
- Green dots for `PathExists` ring samples (reachable points, not a full Recast triangle dump)

Full triangle wireframe would need MQ2Nav internals that are not exposed via TLOs.

## Faction / standing

Spawn JSON includes:

- `con` / `standing` — level-consider color (`GetConLevel`)
- `faction` / `race` — race string used as a watchlist grouping key
- `faction_source: "race_proxy"`

True FactionManager standing uses `FactionManagerClient::GetFactionStanding` when Live offsets are mapped (`HAS_FACTION_WINDOW`). On RoF2EMU the bridge reads `PcProfile::FactionTable` instead (`faction_source:"faction_table"`), with silent auto-consider as a learning fallback.

## Privacy

Usage tips and personalization stay in **local SQLite** on the companion PC. Nothing is phoned home.
