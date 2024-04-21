#!/bin/bash

# APT-related options
apt_update() {
    echo "Updating APT package cache..."
    sudo apt-get update
    show_menu
}

apt_upgrade() {
    echo "Upgrading APT packages..."
    sudo apt-get upgrade -y
    show_menu
}

apt_autoremove() {
    echo "Removing unneeded APT packages..."
    sudo apt-get autoremove -y
    show_menu
}

apt_autoclean() {
    echo "Cleaning APT package cache..."
    sudo apt-get autoclean
    show_menu
}

run_apt_options() {
    apt_update
    apt_upgrade
    apt_autoremove
    apt_autoclean
}
# Nala-related options
nala_update() {
    echo "Updating APT package cache..."
    sudo nala update -y
    show_menu
}

nala_upgrade() {
    echo "Upgrading APT packages..."
    sudo nala upgrade -y
    show_menu
}

nala_autoremove() {
    echo "Removing unneeded APT packages..."
    sudo nala autoremove -y
    show_menu
}

nala_autoclean() {
    echo "Cleaning APT package cache..."
    sudo nala autoclean -y
    show_menu
}

run_nala_options() {
    nala_update
    nala_upgrade
    nala_autoremove
    nala_autoclean
}
# Pacman-related options
pm_update() {
    echo "Updating Pacman package cache..."
    sudo pacman -Sy
    show_menu
}

pm_upgrade() {
    echo "Upgrading Pacman packages..."
    sudo sudo pacman -Syu
    show_menu
}

pm_autoremove() {
    echo "Removing unneeded Pacman packages..."
    sudo pacman -Rns $(pacman -Qtdq)
    show_menu
}

pm_autoclean() {
    echo "Cleaning Pacman package cache..."
    sudo pacman -Sc
    show_menu
}

run_pm_options() {
    pm_update
    pm_upgrade
    pm_autoremove
    pm_autoclean
}

# Flatpak-related options
flatpak_update() {
    echo "Updating Flatpaks..."
    flatpak update -y
    show_menu
}

flatpak_remove_unused() {
    echo "Removing unused Flatpaks..."
    flatpak uninstall --unused -y
    show_menu
}

run_flatpak_options() {
    flatpak_update
    flatpak_remove_unused
}

# Snap-related options
snap_update() {
    echo "Updating Snaps..."
    sudo snap refresh
    show_menu
}

snap_remove_unused() {
    echo "Removing disabled/unused Snaps..."
    sudo snap remove $(snap list | grep disabled | awk '{print $1}')
    show_menu
}

run_snap_options() {
    snap_update
    snap_remove_unused
}

# Main menu
show_menu() {
    clear
    echo "LinuxUpdate 3.0"
    echo "Check for updates at xandr215.github.io/linuxupdate"
    echo "Don't use options for things you don't have!"
    echo "- APT-related -"
    echo "1a: Update APT package cache"
    echo "2a: Upgrade APT packages"
    echo "3a: Autoremove unneeded APT packages"
    echo "4a: Autoclean APT package cache"
    echo "5a: Run all APT options"
    echo "- Nala-related -"
    echo "-- Frontend for APT, do install! --"
    echo "1n: Update Nala package cache"
    echo "2n: Upgrade Nala packages"
    echo "3n: Autoremove unneeded Nala packages"
    echo "4n: Autoclean Nala package cache"
    echo "5n: Run all Nala options"
    echo "- Pacman-related -"
    echo "1p: Update Pacman package cache"
    echo "2p: Upgrade Pacman packages"
    echo "3p: Autoremove unneeded Pacman packages"
    echo "4p: Autoclean Pacman package cache"
    echo "5p: Run all Pacman options"
    echo "- Flatpak-related -"
    echo "1f: Update Flatpaks"
    echo "2f: Remove unused Flatpaks"
    echo "3f: Run all Flatpak options"
    echo "- Snap-related -"
    echo "-- Debian/Debian-based distros only. Not all of these have Snaps though. --"
    echo "1s: Update Snaps"
    echo "2s: Remove all disabled/unused Snaps"
    echo "3s: Run all Snap options"
    echo "- Other -"
    echo "exit: Exit Menu"

    # Read user choice
    read -p "Enter your choice: " choice

    # Execute selected option
    case $choice in
        1a) apt_update ;;
        2a) apt_upgrade ;;
        3a) apt_autoremove ;;
        4a) apt_autoclean ;;
        5a) run_apt_options ;;
        1n) nala_update ;;
        2n) nala_upgrade ;;
        3n) nala_autoremove ;;
        4n) nala_autoclean ;;
        5n) run_nala_options ;;
        1p) pm_update ;;
        2p) pm_upgrade ;;
        3p) pm_autoremove ;;
        4p) pm_autoclean ;;
        5p) run_pm_options ;;
        1f) flatpak_update ;;
        2f) flatpak_remove_unused ;;
        3f) run_flatpak_options ;;
        1s) snap_update ;;
        2s) snap_remove_unused ;;
        3s) run_snap_options ;;
        exit) clear && exit ;;
        *) echo "Invalid choice" ;;
    esac
}

# Initial display of menu
show_menu
