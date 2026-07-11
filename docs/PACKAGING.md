# Coming Soon — release mirror & signing secrets

This public repo hosts **beta installers** as GitHub Releases.

## Download

Latest prerelease: https://github.com/eniner/-Coming-Soon-MQ-Companion/releases

Updater manifest URL (Settings → Updates):

```
https://github.com/eniner/-Coming-Soon-MQ-Companion/releases/latest/download/updates.json
```

(For a specific beta tag, use `/download/v0.7.0-beta.2/updates.json`.)

## CI secrets (code signing)

Configured on this repository:

| Secret | Purpose |
|--------|---------|
| `OV_SIGN_PFX_BASE64` | Base64 Authenticode `.pfx` |
| `OV_SIGN_PFX_PASSWORD` | PFX password |
| `OV_SIGN_THUMBPRINT` | Optional SHA1 verify after import |

Import helper: [`packaging/import-signing-cert.ps1`](../packaging/import-signing-cert.ps1)

**Production:** replace the interim CI PFX with a commercial Authenticode certificate (DigiCert / Sectigo / SSL.com). SmartScreen reputation requires a trusted CA-issued cert.

## Workflow

[`sign-release-assets.yml`](../.github/workflows/sign-release-assets.yml) can re-sign uploaded release binaries when secrets are present.
