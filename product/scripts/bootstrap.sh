#!/usr/bin/env bash
set -euo pipefail

# sentinel-workspace bootstrap (Linux / macOS)
# This script is idempotent and will create placeholder README.md files for the workspace layout.
# It will NOT initialize Git or create any repositories. Use this to create the local folder layout.

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "Ensuring workspace structure under $ROOT_DIR"

dirs=(
  "docs" 
  "docs/branding" 
  "docs/roadmap" 
  "docs/patents" 
  "products" 
  "products/sentinel-home" 
  "products/sentinel-traffic" 
  "products/sentinel-city" 
  "products/sentinel-defense" 
  "products/sentinel-border" 
  "products/sentinel-critical-infrastructure" 
  "platforms" 
  "platforms/sentinel-edge" 
  "platforms/sentinel-rack" 
  "platforms/sentinel-cluster" 
  "shared" 
  "shared/sentinel-platform" 
  "shared/sentinel-sdk" 
  "shared/sentinel-ai" 
  "shared/sentinel-common" 
  "integrations" 
  "integrations/onvif" 
  "integrations/rtsp" 
  "integrations/hikvision" 
  "integrations/dahua" 
  "integrations/mqtt" 
  "showcase" 
  "tools" 
  "scripts"
)

for d in "${dirs[@]}"; do
  target="$ROOT_DIR/$d"
  if [ ! -d "$target" ]; then
    mkdir -p "$target"
    echo "created: $target"
  fi
  readme="$target/README.md"
  if [ ! -f "$readme" ]; then
    echo "Creating placeholder: $readme"
    cat > "$readme" <<EOF
# ${d##*/}

Placeholder README for $d

EOF
  fi
done

echo "Bootstrap complete. Reminder: do NOT run 'git init' in $ROOT_DIR"
