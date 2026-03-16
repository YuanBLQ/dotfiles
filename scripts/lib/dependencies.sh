#!/usr/bin/env sh

DEPENDENCY_MODULE_DIR="$PROJECT_ROOT/scripts/lib/dependencies"

reset_dependency_module() {
    unset -f dependency_check 2>/dev/null || true
    unset -f dependency_install 2>/dev/null || true
}

load_dependency_module() {
    dependency_name=$1
    dependency_module="$DEPENDENCY_MODULE_DIR/$dependency_name.sh"

    if [ ! -f "$dependency_module" ]; then
        log_error "Unknown dependency module: $dependency_name"
        return 1
    fi

    reset_dependency_module
    . "$dependency_module"

    if ! command -v dependency_check >/dev/null 2>&1; then
        log_error "Invalid dependency module: $dependency_name"
        return 1
    fi
}

check_dependency() {
    dependency_name=$1

    if [ -z "$dependency_name" ]; then
        log_error "Missing dependency name."
        return 1
    fi

    load_dependency_module "$dependency_name" || return 1
    dependency_check
}

install_dependency() {
    dependency_name=$1

    if [ -z "$dependency_name" ]; then
        log_error "Missing dependency name."
        return 1
    fi

    load_dependency_module "$dependency_name" || return 1

    if ! command -v dependency_install >/dev/null 2>&1; then
        log_error "Install is not defined for dependency: $dependency_name"
        return 1
    fi

    dependency_install
}

install_dependency_group() {
    group_name=$1
    shift

    for dependency_name in "$@"; do
        log_info "Installing $group_name dependency: $dependency_name"
        install_dependency "$dependency_name"
    done

    log_info "$group_name dependencies are installed."
}

check_dependency_group() {
    group_name=$1
    shift

    missing_dependencies=""

    for dependency_name in "$@"; do
        if ! check_dependency "$dependency_name"; then
            missing_dependencies="$missing_dependencies $dependency_name"
        fi
    done

    if [ -n "$missing_dependencies" ]; then
        log_error "Missing $group_name dependencies:$missing_dependencies"
        return 1
    fi

    log_info "$group_name dependencies are installed."
}

check_required_dependencies() {
    check_dependency_group "required" fzf fd rg
}

install_required_dependencies() {
    install_dependency_group "required" fzf fd rg
}
