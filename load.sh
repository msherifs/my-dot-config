#! /bin/bash

rm -rf ./nvim/
rm -rf ./wezterm/

cp -r ~/.config/nvim/ ./nvim/
cp -r ~/.config/wezterm/ ./wezterm/
cp ~/.tmux.conf .
cp ~/.config/starship.toml .
cp ~/.config/kitty/kitty.conf ./kitty/
cp ~/.config/ghostty/config ./ghostty/
cp ~/.config/zed/settings.json ./zed/
cp -r ~/.config/zed/themes/ ./zed/themes/

