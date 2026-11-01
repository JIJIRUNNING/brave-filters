#!/bin/bash
set -u
cd "$(dirname "$0")" || exit 1

if [ -z "${1:-}" ]; then
  echo "Usage : ./update.sh \"message du commit\"" >&2
  exit 1
fi

git add youtube-mobile.txt && git commit -m "$1" && git push || exit 1

URL="https://raw.githubusercontent.com/JIJIRUNNING/brave-filters/main/youtube-mobile.txt"
LOCAL=$(shasum -a 256 youtube-mobile.txt | cut -d' ' -f1)
TMP=$(mktemp)
trap 'rm -f "$TMP"' EXIT

for essai in 0 1 2 3; do
  [ "$essai" -gt 0 ] && { echo "Écart (cache GitHub ?), nouvel essai $essai/3 dans 60 s"; sleep 60; }
  CODE=$(curl -sS -o "$TMP" -w '%{http_code}' "$URL")
  DIST=$(shasum -a 256 "$TMP" | cut -d' ' -f1)
  if [ "$CODE" = "200" ] && [ "$DIST" = "$LOCAL" ]; then
    echo "OK : HTTP 200, sha256 identique ($LOCAL)"
    echo "$URL"
    exit 0
  fi
done

echo "ÉCHEC : HTTP $CODE, sha256 local $LOCAL, distant $DIST" >&2
exit 1
