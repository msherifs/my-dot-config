#! /bin/bash

rm -rf ./nvim/
rm -rf ./wezterm/

cp -r ~/.config/nvim/ ./nvim/
cp -r ~/.config/wezterm/ ./wezterm/
cp ~/.tmux.conf .

