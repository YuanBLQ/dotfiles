#!/usr/bin/env sh
set -eu

PROJECT_ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
LIB_DIR="$PROJECT_ROOT/scripts/lib"
APPS_DIR="$PROJECT_ROOT/scripts/apps"

. "$LIB_DIR/common.sh"
. "$LIB_DIR/dependencies.sh"

print_usage() {
    cat <<EOF
Usage:
  ./scripts/main.sh check
  ./scripts/main.sh install <app>
  ./scripts/main.sh install-dependency <dependency>
  ./scripts/main.sh install-required-dependencies
EOF
}

install_app() {
    app_name=${1:-}

    if [ -z "$app_name" ]; then
        log_error "Missing app name."
        print_usage
        return 1
    fi

    app_script="$APPS_DIR/$app_name.sh"

    if [ ! -f "$app_script" ]; then
        log_error "Unknown app installer: $app_name"
        return 1
    fi

    sh "$app_script"
}

main() {
    command_name=${1:-check}

    case "$command_name" in
        check)
            check_required_dependencies
            ;;
        install)
            install_app "${2:-}"
            ;;
        install-dependency)
            install_dependency "${2:-}"
            ;;
        install-required-dependencies)
            install_required_dependencies
            ;;
        help|-h|--help)
            print_usage
            ;;
        *)
            log_error "Unknown command: $command_name"
            print_usage
            return 1
            ;;
    esac
}

main "$@"
