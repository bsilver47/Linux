#!/bin/bash

# Script by Benjamin Sterling Silver; written 2 January 2026; edited 2 January 2026; open for personal use with or without credit to me granted
# As I go into the first term of 2026 at BYU-Pathway, I did not trust myself to stick with a single distro of Linux
# This script is designed to support distro-hopping with the packages needed for the course
# This script is designed to be dynamic and be copied for other purposes, terms, and distributives

# update before starting
dnf up

# installation and setup of .NET for C# development
dnf install -y glibc libgcc ca-certificates openssl-libs libstdc++ libicu tzdata krb5-libs zlib # These are the dependencies
dnf install dotnet-sdk-10.0
dnf install dotnet-runtime-10.0

# installation of other programs
dnf install git # installs git for further downloading and uploading other packages as demonstrated below
git clone https://github.com/curl/curl # curl allows for use of other scripts from online to populate in the terminal
curl -f https://zed.dev/install.sh | sh # Zed is an open source IDE for use as needed and desired
dnf install tmux # tmux is a tool for maintaining multiple windows within a single terminal emulator tab
dnf install htop # htop is a tool for viewing machine performance and activity
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # Not strictly relevant to this term, I have been doing more with Rust; thus, for easier access, this is here

# installation of LazyVim; a tool that acts as a text editor within terminal emulators that is preconfigured for programming
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# This starts a tmux session
for i in {1..3} ; do
    tmux new-session -ds mysession
    tmux split-window -h # -p 4
    tmux select-layout tiled
    tmux attach -t mysession
done

for i in {4..1}; do
    tmux send-keys -t $i C-z 'echo "Good Morning, Sir!"' Enter
done

# This configures each Tmux pane as I want as a default
tmux send-keys -t 1 C-z 'nvim' Enter
tmux send-keys -t 2 C-z 'man man' Enter
tmux send-keys -t 3 C-z 'htop' Enter
tmux send-keys -t 4 C-z 'curl parrot.live' Enter
