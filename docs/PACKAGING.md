# Packaging (preview notes)

Private build ships:
- `packaging/build-release.ps1` — zip + `updates.json` + optional Authenticode
- `.github/workflows/overlay-companion.yml` — CI build/publish on `overlay-v*` tags
- Settings → Updates checks a hosted `updates.json` against `/api/version`

Signing requires a cert thumbprint (`OV_SIGN_THUMBPRINT`); this preview repo does not host binaries.
