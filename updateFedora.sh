#!/bin/bash

dnf check-update
dnf up
dnf distro-sync
dnf system-upgrade
uhd_images_downloader
rustup update