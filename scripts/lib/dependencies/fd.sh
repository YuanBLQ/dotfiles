#!/usr/bin/env sh

dependency_check() {
    command_exists "fd"
}

dependency_install() {
    brew_install_package "fd"
}
