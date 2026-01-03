#!/bin/bash

# Script by Benjamin Sterling Silver; written 2 January 2026; edited 2 January 2026; open for personal use with or without credit to me granted
# As I go into the first term of 2026 at BYU-Pathway, I did not trust myself to stick with a single distro of Linux
# This script is designed to support distro-hopping with the packages needed for the course
# This script is designed to be dynamic and be copied for other purposes, terms, and distributives

# update before starting
apt update
apt full-upgrade

# installation and setup of .NET for C# development
wget https://packages.microsoft.com/config/debian/13/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
apt install -y dotnet-sdk-10.0

# installation of other programs
apt install git # installs git for further downloading and uploading other packages as demonstrated below
git clone https://github.com/curl/curl # curl allows for use of other scripts from online to populate in the terminal
curl -f https://zed.dev/install.sh | sh # Zed is an open source IDE for use as needed and desired
apt install tmux # tmux is a tool for maintaining multiple windows within a single terminal emulator tab
apt install htop # htop is a tool for viewing machine performance and activity

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
