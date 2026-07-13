<#
Sentinel workspace bootstrap (Windows PowerShell)
Idempotent: creates placeholder README.md files and directories.
Does NOT initialize Git.
#>
param()

$root = Split-Path -Parent $PSScriptRoot
Write-Host "Ensuring workspace structure under $root"

$dirs = @(
  'docs',
  'docs/branding',
  'docs/roadmap',
  'docs/patents',
  'products',
  'products/sentinel-home',
  'products/sentinel-traffic',
  'products/sentinel-city',
  'products/sentinel-defense',
  'products/sentinel-border',
  'products/sentinel-critical-infrastructure',
  'platforms',
  'platforms/sentinel-edge',
  'platforms/sentinel-rack',
  'platforms/sentinel-cluster',
  'shared',
  'shared/sentinel-platform',
  'shared/sentinel-sdk',
  'shared/sentinel-ai',
  'shared/sentinel-common',
  'integrations',
  'integrations/onvif',
  'integrations/rtsp',
  'integrations/hikvision',
  'integrations/dahua',
  'integrations/mqtt',
  'showcase',
  'tools',
  'scripts'
)

foreach ($d in $dirs) {
  $target = Join-Path $root $d
  if (-not (Test-Path $target)) {
    New-Item -ItemType Directory -Path $target | Out-Null
    Write-Host "created: $target"
  }
  $readme = Join-Path $target 'README.md'
  if (-not (Test-Path $readme)) {
    "# $([System.IO.Path]::GetFileName($d))`n`nPlaceholder README for $d`n" | Out-File -Encoding utf8 -FilePath $readme
    Write-Host "Created placeholder: $readme"
  }
}

Write-Host "Bootstrap complete. Reminder: do NOT run 'git init' in $root"
