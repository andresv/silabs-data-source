#!/usr/bin/env bash
# Fetch CMSIS DFP packs from silabs.com and verify checksums.
# Re-runnable: skips packs that already exist on disk.

set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p packs

# Parse families.toml — naive but adequate for our flat schema.
family=""
version=""
while IFS= read -r line; do
  if [[ "$line" =~ ^name[[:space:]]*=[[:space:]]*\"([^\"]+)\" ]]; then
    family="${BASH_REMATCH[1]}"
  elif [[ "$line" =~ ^version[[:space:]]*=[[:space:]]*\"([^\"]+)\" ]]; then
    version="${BASH_REMATCH[1]}"
  fi
  if [[ -n "$family" && -n "$version" ]]; then
    fname="SiliconLabs.GeckoPlatform_${family}_DFP.${version}.pack"
    url="https://www.silabs.com/documents/public/cmsis-packs/${fname}"
    if [[ -f "packs/${fname}" ]]; then
      echo "==> ${fname}: already present, skipping download"
    else
      echo "==> ${fname}: fetching"
      curl -fL -o "packs/${fname}" "$url"
    fi
    family=""
    version=""
  fi
done < families.toml

if [[ -s packs/packs.sha256 ]]; then
  echo "==> verifying checksums"
  (cd packs && sha256sum -c packs.sha256)
else
  echo "==> packs.sha256 missing or empty; skipping verification"
fi
