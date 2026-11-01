#!/bin/bash
set -u
cd "$(dirname "$0")" || exit 1

if [ -z "${1:-}" ]; then
  echo "Usage : ./update.sh \"message du commit\"" >&2
  exit 1
fi

LISTES=(youtube-*.txt)
git add "${LISTES[@]}" && git commit -m "$1" && git push || exit 1

BASE="https://raw.githubusercontent.com/JIJIRUNNING/brave-filters/main"
TMP=$(mktemp)
trap 'rm -f "$TMP"' EXIT

verifier() {
  local f=$1 local_sha code dist
  local_sha=$(shasum -a 256 "$f" | cut -d' ' -f1)
  code=$(curl -sS -o "$TMP" -w '%{http_code}' "$BASE/$f")
  dist=$(shasum -a 256 "$TMP" | cut -d' ' -f1)
  [ "$code" = "200" ] && [ "$dist" = "$local_sha" ] && return 0
  echo "  $f : HTTP $code, sha256 local $local_sha, distant $dist" >&2
  return 1
}

# Cache raw de GitHub : 5 min (max-age=300)
for essai in 0 1 2 3 4 5 6; do
  [ "$essai" -gt 0 ] && { echo "Écart (cache GitHub ?), nouvel essai $essai/6 dans 60 s"; sleep 60; }
  ok=1
  for f in "${LISTES[@]}"; do verifier "$f" || ok=0; done
  if [ "$ok" = 1 ]; then
    for f in "${LISTES[@]}"; do echo "OK : $BASE/$f"; done
    exit 0
  fi
done

echo "ÉCHEC de la vérification" >&2
exit 1
