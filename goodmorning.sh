#!/bin/bash

for i in {1..15} ; do
    tmux new-session -d -s mysession
    tmux split-window -h # -p 4
    tmux select-layout tiled
    tmux attach -t mysession
done

tmux attach -t mysession

for i in {16..1}; do
    tmux send-keys -t $i C-z 'echo "Good Morning, Sir!"' Enter
done

tmux send-keys -t 1 'sudo ./updates.sh' Enter
tmux send-keys -t 2 C-z 'locate gnuradio-companion' Enter
tmux send-keys -t 3 C-z 'htop' Enter


tmux send-keys -t 4 C-z 'echo "This is where I ssh"' Enter
tmux send-keys -t 5 C-z 'echo "This is where I rsync"' Enter
tmux send-keys -t 6 C-z 'echo "This is for sending packets"' Enter
tmux send-keys -t 7 C-z 'echo "This is for receiving packets"' Enter

tmux send-keys -t 8 C-z 'SoapySDRUtil --find' Enter
tmux send-keys -t 9 C-z 'SoapySDRUtil --probe' Enter
tmux send-keys -t 10 C-z 'uhd_find_devices' Enter
tmux send-keys -t 11 C-z 'uhd_usrp_probe' Enter

tmux send-keys -t 12 C-z 'curl parrot.live' Enter
tmux send-keys -t 13 C-z 'cowsay moo' Enter
tmux send-keys -t 14 C-z 'telnet towel.blinkenlights.nl' Enter
tmux send-keys -t 15 C-z 'echo "This is open"' Enter



