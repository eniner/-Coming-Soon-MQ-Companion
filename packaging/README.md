# Packaging (Coming Soon)

Public beta zips ship as [GitHub Releases](https://github.com/eniner/-Coming-Soon-MQ-Companion/releases).

## Secrets (code signing)

| Secret | Purpose |
|--------|---------|
| `OV_SIGN_PFX_BASE64` | Base64 Authenticode `.pfx` (set on this repo) |
| `OV_SIGN_PFX_PASSWORD` | PFX password |
| `OV_SIGN_THUMBPRINT` | Optional SHA1 check after import |

Local/CI import:

```powershell
./packaging/import-signing-cert.ps1
```

Workflow [`sign-release-assets.yml`](../.github/workflows/sign-release-assets.yml) re-signs a release zip after you rotate to a **commercial** Authenticode cert.

Replace the interim CI PFX with DigiCert/Sectigo/SSL.com for SmartScreen trust:

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes(".\production.pfx")) |
  gh secret set OV_SIGN_PFX_BASE64 -R eniner/-Coming-Soon-MQ-Companion
gh secret set OV_SIGN_PFX_PASSWORD -R eniner/-Coming-Soon-MQ-Companion
```

## Updater

Dashboard Settings → Updates → manifest URL:

```
https://github.com/eniner/-Coming-Soon-MQ-Companion/releases/download/v0.7.0-beta.1/updates.json
```
