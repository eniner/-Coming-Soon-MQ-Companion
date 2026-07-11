# Import Authenticode PFX into CurrentUser\My for signtool /sha1 signing.
# Used by CI (GitHub Actions secrets) and local release packaging.
#
# Secrets / env:
#   OV_SIGN_PFX_BASE64   - base64-encoded .pfx
#   OV_SIGN_PFX_PASSWORD - PFX password (optional if empty password)
#   OV_SIGN_THUMBPRINT   - optional; verified after import
#
# Outputs:
#   Sets $env:OV_SIGN_THUMBPRINT to the imported cert thumbprint (if not already set)
#   Prints THUMBPRINT=<sha1> for workflow steps

param(
    [string]$PfxBase64 = $env:OV_SIGN_PFX_BASE64,
    [string]$PfxPassword = $env:OV_SIGN_PFX_PASSWORD,
    [string]$ExpectedThumbprint = $env:OV_SIGN_THUMBPRINT,
    [string]$PfxPath = ""
)

$ErrorActionPreference = "Stop"

if (-not $PfxBase64 -and -not $PfxPath) {
    Write-Host "[!] No OV_SIGN_PFX_BASE64 / -PfxPath - skipping cert import" -ForegroundColor Yellow
    exit 0
}

$tempPfx = $null
try {
    if ($PfxPath) {
        if (-not (Test-Path $PfxPath)) { throw "PFX not found: $PfxPath" }
        $tempPfx = (Resolve-Path $PfxPath).Path
    } else {
        $tempPfx = Join-Path $env:TEMP ("ov-sign-" + [guid]::NewGuid().ToString("n") + ".pfx")
        [IO.File]::WriteAllBytes($tempPfx, [Convert]::FromBase64String($PfxBase64.Trim()))
    }

    $secure = if ($null -eq $PfxPassword) {
        New-Object System.Security.SecureString
    } else {
        ConvertTo-SecureString -String $PfxPassword -AsPlainText -Force
    }

    $imported = Import-PfxCertificate -FilePath $tempPfx -CertStoreLocation Cert:\CurrentUser\My -Password $secure -Exportable
    $cert = @($imported) | Where-Object { $_.HasPrivateKey } | Select-Object -First 1
    if (-not $cert) { $cert = @($imported) | Select-Object -First 1 }
    if (-not $cert) { throw "PFX import returned no certificate" }

    $thumb = $cert.Thumbprint
    if ($ExpectedThumbprint -and ($ExpectedThumbprint.ToUpperInvariant() -ne $thumb.ToUpperInvariant())) {
        throw ("Imported thumbprint " + $thumb + " does not match OV_SIGN_THUMBPRINT " + $ExpectedThumbprint)
    }

    $env:OV_SIGN_THUMBPRINT = $thumb
    Write-Host ("THUMBPRINT=" + $thumb)
    Write-Host ("[OK] Imported code-signing cert: " + $cert.Subject) -ForegroundColor Green
} finally {
    if ($PfxBase64 -and $tempPfx -and (Test-Path $tempPfx) -and -not $PfxPath) {
        Remove-Item $tempPfx -Force -ErrorAction SilentlyContinue
    }
}
