# MQ Overlay Companion — Coming Soon

> **Built for EverQuest emulator only.**  
> Not for Daybreak Live. Not tested on Live. Not supported on Live.  
> Targets **MacroQuest + RoF2-era EQ emulator clients** (private build; public beta zip).  
> Screenshots and docs reflect **bridge API v8** with **EMU hard gates**. Download from [Releases](https://github.com/eniner/-Coming-Soon-MQ-Companion/releases) — source remains private.

---

## EverQuest emulator only

**MQ Overlay Companion is intended for, built for, and only for EverQuest emulator.**

| | |
|--|--|
| **Supported** | EverQuest **emulator** clients (RoF2-era EMU) with MacroQuest **Emu** |
| **Not supported** | Daybreak **Live** EverQuest, Test, or any Live client build |
| **Enforced by** | Compile-time · plugin init · pipe handshake · `eqgame.exe` fingerprint ([details](docs/EMU-GATES.md)) |

If you are on Live: **do not install this.** It will not load or connect.

Screenshots below are from a live **EQ emulator** session (Valiant / Guild Lobby) with `MQ2OverlayBridge2` connected.

---

## Download (public beta — testing only)

| | |
|--|--|
| **Only public download** | https://github.com/eniner/-Coming-Soon-MQ-Companion/releases/tag/v0.7.0-beta.16 |
| **Zip (versioned)** | `MQ-Overlay-Companion-0.7.0-beta.16-win32.zip` |
| **Zip (stable channel)** | https://github.com/eniner/-Coming-Soon-MQ-Companion/releases/download/channel-beta/MQ-Overlay-Companion-win32.zip |
| **Beta policy** | [docs/BETA.md](docs/BETA.md) — testing-only vs fully live |
| **Updater tip (never change)** | `https://github.com/eniner/-Coming-Soon-MQ-Companion/releases/download/channel-beta/updates.json` |
| **Bridge API** | **v10** (EMU handshake required — reload `MQ2OverlayBridge2` after install) |

Older beta zips were **removed** from public Releases so testers only get the current EMU build. Use **Settings → Updates → Download & install** (or the tip link above) to stay current.

**This is a public beta for EMU testing.** Builds may be unsigned; LAN stays off until you enable it (strong token required). Fully live will add Authenticode verification on update apply and keep the same EMU-only gates.

**Install (EMU + MacroQuest only):** expand the zip →  
`.\scripts\install-overlay.ps1 -MqPath 'D:\YourMacroQuest'` →  
in your EMU client `/plugin MQ2OverlayBridge2` → open `http://127.0.0.1:38111/`.

Desktop shortcut launches the full companion (stage 5). Brand book-cover icon is embedded for tray/desktop.

**Hide/show overlay:** `Ctrl+Z` — toggles the **in-game overlay window only** (never your normal browser).

See [Packaging](docs/PACKAGING.md) for Authenticode CI secrets and the updater URL. See [EMU hard gates](docs/EMU-GATES.md) for how Live is blocked.

### What's new in 0.7.0-beta.16
- **Phone cast / offline fix:** paired LAN clients are not rate-limited (old limit made casts fail and the UI flap offline)
- QR/PIN sessions get **full control** (cast gems, commands); slower phone polling; clearer cast error toasts
- After update: **New PIN / QR** once (session tokens reset on Companion restart)

### What's new in 0.7.0-beta.15
- **Mobile join fix:** QR PIN is one-time; after scan, do not tap Join again
- **Open full dashboard** uses the session token with `desktop=1` (no burned PIN)

### What's new in 0.7.0-beta.14
- **Updater tip fix:** tip is always `.../releases/download/channel-beta/updates.json` (jsDelivr / raw@main were serving stale tips)
- **Stable zip URL:** every ship replaces `channel-beta/MQ-Overlay-Companion-win32.zip` - same download link forever
- Auto-migrates saved jsDelivr / raw@main tip URLs in Settings

### What's new in 0.7.0-beta.13
- **LAN phone join:** QR + **6-digit PIN** (scan with **Camera**, not Google Authenticator); short `/m` URL; pick/type the PC IP your phone already reaches; Copy / Share phone link
- Remote APIs send Bearer on **all** methods (fixes “Companion offline” on phones)
- Packager includes `qrcode.min.js` + `imgui.dll`

### What's new in 0.7.0-beta.12
- **Fix:** package now includes **`imgui.dll`** next to `OverlayCompanion.exe` (beta.11 crashed on launch for clean installs)

### What's new in 0.7.0-beta.11
- **Crew Playbooks:** sequenced Normal / EQBC / DanNet / Kiss actions (roles, delays, hotbuttons, broadcast)
- **Kiss / Mule live control:** pause / chase / melee / camp / burn toggles + live assist status on Status and Boxes
- **Combat / raid HUD:** ToT, mez/charm flags, aggro holder + %, short buffs/songs, burn window
- **Bridge API v10** — reload `MQ2OverlayBridge2` after install (companion will warn on older DLLs)

### What's new in 0.7.0-beta.10
- **Status:** memorized spell gems with names + click-to-cast; buff/gem **spell icons** from EQ `uifiles/default` (`spells01-07`)
- **Hotbuttons:** **Import BM** paste for ButtonMaster / RedGuides share codes (sets + single buttons, `/timed` steps)
- **Loot:** corpse LootWnd stays open on single-item loot; Keep/Ignore/Destroy/Sell row filters
- **Inventory:** bridge-native sheet (no EZInventory required)
- **Plugins:** macro dependency scan ignores `/plugin unload` false positives; larger macro scan cap
- Gallery screenshots refreshed (Status gems/buffs, Hotbuttons BM import)

### What's new in 0.7.0-beta.9
- **Hotfix:** restore LAN for installs that still had a legacy short token (auto-upgrade + bind)
- Older public beta releases removed — download only the current tip

### What's new in 0.7.0-beta.8
- **Security (beta):** updater scoped to this GitHub repo; strong LAN tokens; refuse LAN bind without token; strip author machine paths from install scripts
- Live updater: Settings → Updates checks tip + Download & install (SHA-256)
- Docs: [BETA.md](docs/BETA.md) — testing-only vs fully live

### What's new in 0.7.0-beta.7
- In-app live updater wired to public tip `updates.json`

### What's new in 0.7.0-beta.6
- **Fix:** restore **Ctrl+Z** overlay hide/show and borderless-in-EQ overlay styling
- Ctrl+Z only affects the dedicated overlay `--app` process tree — not your everyday Edge/Chrome
- Process-tree window find so overlay chrome is applied again (not a plain browser window)

### What's new in 0.7.0-beta.4
- Attempted hotkey isolation (superseded by beta.5)

### From 0.7.0-beta.2 (still included)
- Accent-driven primary buttons; labeled compact vitals; endurance color distinct from HP
- Spawns map legend + facing wedge; side-by-side map/list layout
- Focus mode: Exit Focus button, Esc / Ctrl+Shift+F always works
- Main content scrolls on Windows; larger default window (1280×900); branded icon
- Plugin/Lua bulk actions; Ctrl+1–9 box hotkeys

### Docs / gallery refresh (July 13, 2026)
- Status screenshots updated for **Kiss / Mule live control** and **Combat / raid HUD**
- New **Playbooks** gallery shot (Normal / EQBC / DanNet / Kiss board)
- Capability list + UI map include Playbooks and assist/combat features

### Docs / gallery refresh (July 12, 2026 — evening)
- Status / rules / Hotbuttons screenshots updated for **spell icons**, **gem grid**, and **Import BM**
- Full tab gallery kept in sidebar order (Status → Settings)

---

## What is it?

**MQ Overlay Companion** is a Windows desktop + local browser dashboard for [MacroQuest](https://www.macroquest.org/) on **EverQuest emulator** that gives you one modern control surface for EMU boxes — vitals, automation, loot, nav, plugins, macros, Lua, and config — without juggling a dozen in-game windows and `.ini` files.

Built for **EMU multi-boxers** and **solo power users** on private / public EQ emulator servers.

---

## How it works

```mermaid
flowchart LR
  A[Web Dashboard / Mobile] --> B[Overlay Companion App]
  B --> C[MQ2OverlayBridge Plugin]
  C --> D[EQ Emulator + MacroQuest]
```

1. **Web dashboard** — `http://127.0.0.1:38111/` (+ optional `/mobile.html`)
2. **Overlay Companion** — hosts UI, SQLite store, icon atlas, rules/alerts, HTTP APIs
3. **MQ2OverlayBridge** — in-game MQ plugin for **EMU** (deployed as `MQ2OverlayBridge2.dll`, **API v10**)
4. **Optional data** — `Loot.ini`, MQ2Nav / `.navmesh`, UltDev icon catalog (icons only)

The companion auto-detects connected **EQ emulator** clients. Switch boxes from the top bar; every tab follows the selected character.

---

## Full capability list (current private build)

This is everything the product **does and can do today** on **EQ emulator + MacroQuest**.

### Live monitoring & character control
- Live **HP / mana / endurance / XP** bars with color ramps and labeled compact vitals
- Character, level, zone, **XYZ**, role badge, alert count, top-bar **HP ring** (once)
- **Target** + **group** panels (Assist / Follow / Invite helpers)
- **Combat / raid HUD** on Status: ToT, mez/charm flags, aggro holder + %, short buffs/songs, burn window
- **Kiss / Mule live control** on Status + Boxes: pause / resume / chase / melee / camp / burn, role Apply, crew pause/resume, live assist pills when KissAssist/MuleAssist is running
- **All Boxes** overview cards from any Status view
- Buffs / songs + casting / gem status (spell icons when available)
- In-game HUD toggle from the dashboard
- Send arbitrary **MQ `/commands`** to the selected box
- Per-character **alert profiles** (low HP, tells, spawn watch, sound)
- Server-side alerts that toast even when you are on another tab
- **Automation rules** on Status: AND conditions → toast / sound / suggest button / broadcast preset / command (per-rule cooldown)

### Console & history
- Live stream of game / MQ / macro / Lua chat over the bridge pipe
- Filter chips: All / Game / Macros / Lua
- Command input + clear
- **SQLite history search** across past lines
- **Export** console log to `.txt`
- Color-coded lines (tells, errors, loot, macros)
- Suggested rule actions can surface as one-click buttons

### Spawns, radar & faction standing (EMU)
- Live spawn list: name, type, level, distance / bearing / facing wedge
- **Con color**, **standing**, **faction / race** labels
- `faction_source`: `faction_table` | `faction_manager` | `consider` | `race_proxy`
- Faction standing without visible `/consider` when FactionTable is available on EMU
- Search + type filters (NPC / PC / Pet / Merc / Corpse)
- **Zone minimap** — pan, zoom, follow-me, hover tooltips, **map legend**
- Side-by-side map + list layout
- **Nav path preview** + mesh wireframe (`mesh_mode`: `detour_polys` or `pathexists_tris`)
- Click map/list to **target**
- **Watchlist** — toast / sound / both; optional match faction/con
- Background spawn polling (throttled at large crew sizes); chunked lists for perf

### Inventory & gear intel
- **Native bridge inventory** — worn, bags, bank, shared bank from `PcProfile` / `ItemDefinition` (no EZInventory required)
- Live **character sheet** strip (HP/mana/endurance, attributes, resists, ATK, weight)
- Native **item icons** from the EQ client atlas (PNG pack under `overlay-web/icons`)
- Stat lines (AC, HP, mana, attributes, resists, heroic, …)
- Filters: All / Worn / Bags / Bank / Has stats + search
- Class / race / level gates for **who can use**
- Feeds loot-row intel: **upgrade**, **redundant** badge

### Loot — AdvLoot, corpse, filters, peers, raid council
- Personal + shared AdvLoot (need / greed / leave)
- Corpse **LootWnd** mirror: per-item **loot** + **Loot All** (window stays open for single-item loot)
- Item icons + **copper value** when resolvable
- **Quick Loot.ini filters on every row:** Keep / Ignore / Destroy / Sell / Clear (toast feedback)
- Shared loot peer dropdown, Give → peer, Set all shared → peer
- Optional **auto-greed under copper threshold** with audit “why”
- Who-can-use via **multi-pid crew inventory cache**
- **Raid loot council** + rotation (none / round-robin / need-before-greed / DKP ledger) + history
- Full **Loot.ini** editor with `.bak` backup
- Export / import filter templates as JSON
- Default peer + **regex auto-assign policies** + per-item peer routes

### Navigation (MQ2Nav on EMU)
- Zone / bind / gate status + live position
- Bind rows with indexed **Gate** / **Succor** / Set Bind
- Camp save / load / delete
- MQ2Nav Idle / Navigating / Paused + Nav Target / Pause / Stop
- **Path length / ETA** and failure reasons (plugin missing, no mesh, path blocked, no target)
- **Nav to Loc** (`/nav loc`)
- Spawns minimap: path preview + **Detour `.navmesh` poly dump** (fallback PathExists grid tris)

### Multi-box crew (Boxes)
- Card per connected client: vitals, zone, target, bridge health, **Kiss/Mule assist badges**
- **Roles** per toon (main, puller, looter, healer, …) in `boxes.json`
- Follow / Invite / **Kiss Pause·Resume·Chase·Burn·Camp** / Reconnect + backoff countdown
- Summary density mode for large crews
- **Crew perf threshold** — throttle non-critical polls; at **12+** stagger pipe requests + paginate Boxes
- Broadcast to all / role / except-main
- Broadcast presets (Camp All, EQBC / DanNet follow+invite, Pause Macros) + custom presets
- **Ctrl+1–9** box hotkeys
- Loot routing policies by role + regex

### Hotbuttons
- Multi-step command buttons (delays supported)
- Run on selected character; edit / add / delete
- **Drag-to-reorder**, categories, per-character or Global sets
- Import / export JSON + copy set across characters
- **Import BM** — paste ButtonMaster share codes (base64) into hotbuttons
- Seeded **Kiss** category (pause/chase/burn/camp/…) when empty
- Triggerable from automation rules by label

### Crew Playbooks
- Sequenced multi-step crew actions stored in `playbooks.json`
- Full-width board by channel: **Normal / EQBC / DanNet / Kiss**
- Step types: command (selected / all / role), broadcast, broadcast preset, delay, hotbutton
- Run / Stop with live run log; edit drawer (name, category, steps)
- Starters: camp & pause, med break, EQBC assist/attack, DanNet follow, Kiss chase/burn
- Command palette entries to open or run a playbook

### Plugins
- Loaded vs available with search (full MQ plugin library)
- Toggle load / unload + **Unload all loaded** bulk action
- Macro dependency hints (“used by N macros”)
- **INI** deep-link into the INI editor
- Dependency graph also in Settings (plugin → macros → hotbuttons)

### Macros
- Full `.mac` library with search, pin, recent
- Run / Stop / Pause
- Missing-plugin dependency hints
- Inline editor: syntax highlight, save with backup / conflict check / line-count confirm

### Lua
- Lists scripts under MQ `lua/` (folder groups)
- Per-script run / stop + **Stop All** / Stop group
- Inline Lua editor: highlight, save, recent files

### INI config browser
- Browses MQ `Config` with grouped categories (KissAssist, MuleAssist, plugins, …)
- Syntax-highlighted editor + line gutter
- Save with **mtime conflict detection** + automatic `.bak`
- Unsaved-change indicator

### Settings, remote, packaging
- Theme / accent / font scale / overlay opacity
- **Ghost** panel + feed opacity; Focus / Compact / Sidebar modes
- Hide dashboard from OBS / screen capture
- Optional **performance HUD** (+ per-box cost)
- Crew perf threshold + Boxes density
- Loot auto-greed copper threshold
- **Config bundle** export / import (versioned JSON)
- **Session summary** — XP/hr, deaths, loot copper, disconnects, zones
- **Updates** — `/api/version` + Settings check against `updates.json`
- **LAN remote access** — master token, allowlist, read-only mode
- **Session tokens** (viewer/control, ~1h) with device label, list, revoke / revoke all, rate limits
- **Mobile viewer** at `/mobile.html`
- Opt-in local usage tips (SQLite only — never phones home)
- Setup Wizard + misconfig coach (stale EZInventory, missing DLL, version mismatch)
- Install MQ **autoload** macro
- Packaging scripts + optional Authenticode; CI publish on `overlay-v*` tags

### Cross-cutting systems
| System | Capability |
|--------|------------|
| **Bridge API v8** | Pipe + actor transport; EMU handshake; standing sources; Detour mesh dump; class/item gates |
| **SQLite store** | Chat history, audit, spawn snapshots, loot history, usage tips, rule cooldowns |
| **Audit log** | Loot / INI / broadcast / plugin / macro / reconnect / config / remote → Events |
| **Inventory sync** | Bridge-native sheet + items; UltDev icons optional; crew cache |
| **Alert + rules engines** | HP / tell / spawn watch + composable rules with cooldown |
| **Deploy helpers** | `deploy-overlay.ps1`, `restart-companion.ps1`, `install-overlay.ps1` |

---

## UI map

| Group | Tabs |
|-------|------|
| **Character** | Status, Console, Spawns, Inventory, Loot, Nav |
| **Automation** | Boxes, Hotbuttons, Playbooks, Plugins, Macros, Lua |
| **Config** | INI, Settings |

**Global chrome:** character mini-card + HP ring, box switcher with health dots, bridge + API version, Ctrl+K palette, notification center (mute / snooze), Focus / Sidebar / Compact / Ghost, remote-access banner when LAN is on, **EQ Emulator only** badge in the sidebar.

---

## Feature gallery (July 13, 2026)

Fresh screenshots from a live **EverQuest emulator** session (Muramite Proving Grounds / Enine, `MQ2OverlayBridge2`) — Kiss/Mule live control, combat/raid HUD, Crew Playbooks, plus the prior tab tour.

### 1. Status — command center + fight HUD

![Status tab](docs/screenshots/01-status.png)

Vitals, **Kiss / Mule** live toggles (pause / chase / melee / camp / burn, mode Apply, crew pause/resume), and the **Combat** strip: Target, ToT, Aggro, Mez/Charm/Burn, plus short buffs/songs.

![Status Kiss & combat strip](docs/screenshots/01c-status-kiss-combat.png)

Close-up of assist status pills and the four combat cards when no mob is targeted.

![Status rules & alerts](docs/screenshots/01b-status-rules.png)

Buffs & songs with durations/icons, casting & gem grid, HUD toggle, alerts, automation rules, send `/command`.

### 2. Console — live log + history

![Console tab](docs/screenshots/02-console.png)

Pipe-connected game/MQ/macro/Lua stream, SQLite search, export, send `/command`. Combat, faction, and corpse coin lines appear live.

### 3. Spawns — radar + zone minimap

![Spawns tab](docs/screenshots/03-spawns.png)

Watchlist, follow-me map with legend, con/standing/faction labels, target-from-list/map.

### 4. Inventory — native bridge sheet + items

![Inventory tab](docs/screenshots/04-inventory.png)

Live character sheet (HP/mana/endurance, attrs, resists, ATK, weight) plus worn/bags/bank from the bridge — icon, name, and item stats without EZInventory.

### 5. Loot — AdvLoot, corpse filters, peers, council

#### Active loot (corpse LootWnd)

![Active loot](docs/screenshots/05-loot-active.png)

Personal/shared AdvLoot panes, corpse **Loot All**, per-item **loot**, and row quick filters (**Keep / Ignore / Destroy / Sell / Clear**) writing `Loot.ini`.

![Corpse filter detail](docs/screenshots/05b-loot-corpse-filters.png)

Active rule highlight on Ignore/Keep, copper value, Can use / Redundant badges, raid council pending list.

#### Loot.ini filters

![Loot.ini filters](docs/screenshots/05-loot-ini-filters.png)

Live `Loot.ini` path, Keep/Ignore/Destroy/Sell/Quest chips, JSON template import/export, Remove per entry.

#### Peer assignments

![Peer assignments](docs/screenshots/05-loot-peer-assignments.png)

Default shared peer, regex auto-assign by role, per-item routes, raid rotation.

### 6. Nav — binds, camps, MQ2Nav

![Nav tab](docs/screenshots/06-nav.png)

Zone/bind/gate/position, Gate/Succor/Set Bind, Nav Target/Pause/Stop, Nav to Loc, camps.

### 7. Boxes — multi-box crew

![Boxes tab](docs/screenshots/07-boxes.png)

Per-box vitals + role, Follow/Invite/Pause/Reconnect, loot peer policies, broadcast presets + except-main.

### 8. Hotbuttons — one-click commands

![Hotbuttons tab](docs/screenshots/08-hotbuttons.png)

Global/per-character sets, **Import BM** for ButtonMaster share codes, categories (e.g. ButtonMaster / Kiss), multi-step commands.

### 8b. Playbooks — sequenced crew actions

![Playbooks tab](docs/screenshots/08b-playbooks.png)

Full-width board by channel (**Normal / EQBC / DanNet / Kiss**). Run / Edit / Del per playbook; starters for camp, med, EQBC assist/attack, DanNet follow, Kiss chase/burn. Edit drawer for name, category, and steps.

### 9. Plugins — load / unload + INI

![Plugins tab](docs/screenshots/09-plugins.png)

Loaded vs available, dependency hints, Unload all, INI deep-link (includes `MQ2OverlayBridge2`).

### 10. Macros — browse, pin, run, edit

![Macros tab](docs/screenshots/10-macros.png)

Library search, Run/Edit, missing-plugin dependency notes, inline editor.

### 11. Lua — scripts + editor

![Lua tab](docs/screenshots/11-lua.png)

Folder-grouped script library, toggles, Stop All, Edit.

### 12. INI — config browser + editor

![INI editor](docs/screenshots/12-ini-editor.png)

Grouped Config tree (KissAssist, MuleAssist, plugins, `Loot.ini`…), safe save with backups.

### 13. Settings — appearance, remote, wizard

![Settings appearance](docs/screenshots/13-settings.png)

Theme/Ghost/OBS hide, crew perf, auto-greed, config bundle, session summary, updates (`0.7.0-beta.12`).

![Settings remote](docs/screenshots/13b-settings-remote.png)

LAN remote access, tip updater URL, session tokens, revoke, personalization.

![Settings wizard](docs/screenshots/13c-settings-wizard.png)

Bridge / DLL / autoload / character session checklist + Install MQ Autoload.

---
## Public docs

- [User Guide](docs/USER-GUIDE.md) — install & tabs (**EMU only**)
- [EMU hard gates](docs/EMU-GATES.md) — how Live is blocked (compile / init / handshake / fingerprint)
- [API](docs/API.md)
- [Packaging](docs/PACKAGING.md)

---

## Still coming / not public yet

- [ ] Commercial Authenticode cert (DigiCert/Sectigo) replacing interim CI PFX for SmartScreen reputation
- [ ] MSI / Inno Setup wizard (zip + `install-overlay.ps1` ships today)

**Recently shipped (checkbox history):**

- [x] Production code-signing certificate in CI secrets (local sign path + pipeline exist)
- [x] Public beta / installers published to this repo (`v0.7.0-beta.6`)
- [x] UI polish pass (accent, focus exit, scroll, branded icon)
- [x] Fresh screenshots (July 13 — Kiss/Mule, combat HUD, Playbooks; July 12 gems/BM/loot)
- [x] FactionTable / FactionManager standing without visible `/consider` (EMU)
- [x] Native Detour poly dump from MQ2Nav `.navmesh`
- [x] PathExists triangle wireframe fallback
- [x] Signed installer / updater scaffolding + CI publish path
- [x] Hardened remote auth (revoke UI, rate limits, mobile)
- [x] Multi-pid inventory cache / who-can-use
- [x] 12+ box crew performance polish
- [x] Public User Guide + API docs
- [x] Explicit **EverQuest emulator only** product positioning
- [x] EMU hard gates: compile-time, plugin init, handshake, eqgame fingerprint (`v0.7.0-beta.3`)
- [x] Overlay toggle hotkey fixed: `Ctrl+Shift+O` (no more global `Ctrl+Z`) (`v0.7.0-beta.6`)

**Expect bugs and breaking changes.** This preview shows direction, not a finished product.

---

## Privacy & repo scope

- **This repo:** screenshots + descriptions + public docs only  
- **Not included:** source code, MQ plugin binaries, EQ client assets, or personal configs  
- Built against private MacroQuest / OpenVanilla fork work for **EQ emulator** — **not open-sourced here**
- Usage tips / personalization stay **local SQLite only** — nothing is phoned home

---

## Status

| Area | State |
|------|--------|
| Target platform | **EQ emulator + MacroQuest only** |
| Daybreak Live | **Not supported** |
| Core bridge pipe + API **v8** + EMU gates | Working in EMU dev |
| Web dashboard (Focus / Compact / Ghost) | Working |
| Automation rules + alerts | Working (preview) |
| Inventory + icons + crew who-can-use | Working (native bridge; no EZInventory required) |
| Loot (AdvLoot / Loot.ini quick filters / peers / council) | Working |
| Spell gems + buff icons (uifiles spells01-07) | Working |
| ButtonMaster share import | Working |
| Spawns + Detour/PathExists mesh + path preview | Working |
| FactionTable / consider standing (EMU) | Working |
| Multi-box roles + broadcast + 12+ perf | Working |
| Macros / Lua / Plugins / Hotbuttons / INI | Working |
| Config bundle + session summary + updater check | Working |
| Remote tokens + revoke + mobile | Working (preview) |
| Packaging + CI publish path | Working (preview) |
| Public docs | Working |
| Setup wizard + misconfig coach | Working |
| Public release | Not started |

---

*Last updated: July 13, 2026 - v0.7.0-beta.15 (mobile join fix) - [eniner/-Coming-Soon-MQ-Companion](https://github.com/eniner/-Coming-Soon-MQ-Companion)*
