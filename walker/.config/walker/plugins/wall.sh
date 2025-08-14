#!/usr/bin/env bash
set -euo pipefail

info() {
cat <<'EOF'
placeholder = "Wallpapers"
name = "matugen-wallpapers"
parser = "kv"
# src_once = "yes"
# theme = "wallpapers"
# theme_base = ["samurai"]
EOF
}

# single-quote a string for safe inclusion in exec=... (handles single quotes)
shell_quote() {
  printf "'%s'" "${1//\'/\'\"\'\"\'}"
}

entries() {
  dir="${HOME}/Pictures/Wallpapers"
  [ -d "$dir" ] || exit 0

  # find image files, handle spaces/newlines with -print0
  find -L "$dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) -print0 |
  while IFS= read -r -d '' path; do
    base="${path##*/}"
    esc=$(shell_quote "$path")
    # kv line: keys separated by semicolons
    echo "label=${base};image=${path};exec=matugen image -t scheme-fruit-salad ${esc};exec_alt=wl-copy < ${esc};drag_drop=true;drag_drop_data=${path};class=wallpaper;matching=1;value=${path}"
  done
}

case "${1:-}" in
  info) info ;;
  entries) entries ;;
  *) echo "Usage: $0 {info|entries}" >&2; exit 1 ;;
esac

