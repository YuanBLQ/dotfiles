#!/usr/bin/env sh

dependency_check() {
    command_exists "fzf"
}

dependency_install() {
    brew_install_package "fzf"
}
