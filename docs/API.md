# MQ Overlay Companion — HTTP API (local)

Base URL: `http://127.0.0.1:38111` (port may scan 38111–38130).

Auth: when `lan_token` is set, **POST** (and remote **GET** `/api/*`) require `Authorization: Bearer <token>`. Session tokens (`s_…`) may substitute; `viewer` scope cannot run most mutating routes.

Rate limits (remote IPs only): ~40 mutating / 180 total requests per minute per IP → `429 {"error":"rate_limited"}`.

## Common query

- `?pid=<eq_process_id>` — select character session (0 = first connected)

## Core

| Method | Path | Notes |
|--------|------|--------|
| GET | `/api/state` | Latest game state |
| GET | `/api/characters` | Crew summary (`bridge_api_expected`, class, vitals) |
| GET | `/api/spawns` | Nearby spawns (con/standing/faction/race) |
| GET | `/api/inventory` | Selected box inventory |
| GET | `/api/inventory/crew` | All connected boxes’ inventories (who-can-use cache) |
| GET | `/api/loot` | Adv loot lists |
| GET | `/api/zone` | Zone + nav (`path`, `mesh_sample`, `mesh_mode`) |
| POST | `/api/command` | Send line to bridge |
| POST | `/api/broadcast` | All boxes |
| POST | `/api/boxes/reconnect` | `{pid}` |

## Remote auth

| Method | Path | Body | Notes |
|--------|------|------|--------|
| POST | `/api/auth/session` | `{scope,label?,device?}` | Master token → `{token,id,expires_at}` |
| GET | `/api/auth/sessions` | | Masked list for revoke UI |
| POST | `/api/auth/revoke` | `{token}` or `{id}` | Revoke one |
| POST | `/api/auth/revoke_all` | `{}` | Clear all session tokens |

## Round 2

| Method | Path | Notes |
|--------|------|--------|
| GET/POST | `/api/rules` | Automation rules JSON |
| GET | `/api/loot/council` | Rotation + pending |
| GET | `/api/loot/history` | `?item=&limit=` |
| POST | `/api/loot/decision` | Record council decision |
| GET | `/api/deps` | Plugin ↔ macro graph |
| GET/POST | `/api/usage` | Opt-in local tips |

## Bridge schema (v5)

Pushed / polled JSON from `MQ2OverlayBridge`:

- State: `class`, `class_id`, inventory inline
- Spawns: `standing`, `faction_source`, `class`
- Inventory items: `classes`, `races` bitmasks + `lvl`
- Zone nav: `mesh_mode` (`pathexists_rings` | `none`), PathExists-filtered `mesh_sample`
