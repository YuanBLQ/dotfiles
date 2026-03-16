#!/usr/bin/env sh

log_info() {
    printf '[INFO] %s\n' "$*"
}

log_error() {
    printf '[ERROR] %s\n' "$*" >&2
}

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

require_command() {
    command_name=$1

    if ! command_exists "$command_name"; then
        log_error "Missing command: $command_name"
        return 1
    fi
}

brew_install_package() {
    require_command "brew" || return 1
    brew install "$@"
}

ensure_dir() {
    mkdir -p "$1"
}

link_path() {
    source_path=$1
    target_path=$2

    ensure_dir "$(dirname "$target_path")"
    ln -sfn "$source_path" "$target_path"
    log_info "Linked $target_path -> $source_path"
}
