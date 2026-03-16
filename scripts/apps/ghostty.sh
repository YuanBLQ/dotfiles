#!/usr/bin/env sh
set -eu

PROJECT_ROOT=${PROJECT_ROOT:-$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)}
LIB_DIR="$PROJECT_ROOT/scripts/lib"
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"

. "$LIB_DIR/common.sh"

ensure_dir "$GHOSTTY_CONFIG_DIR"

link_path "$PROJECT_ROOT/ghostty/Ghostty.icns" "$GHOSTTY_CONFIG_DIR/Ghostty.icns"
link_path "$PROJECT_ROOT/ghostty/themes" "$GHOSTTY_CONFIG_DIR/themes"
link_path "$PROJECT_ROOT/ghostty/config.ghostty" "$GHOSTTY_CONFIG_DIR/config.ghostty"

log_info "Ghostty configuration is installed."
