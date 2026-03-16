#!/usr/bin/env sh

dependency_check() {
    command_exists "rg"
}

dependency_install() {
    brew_install_package "ripgrep"
}
