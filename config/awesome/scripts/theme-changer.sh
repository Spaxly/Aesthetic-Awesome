#!/bin/bash

declare -a options=(
  "Rose Pine"
  "Catppuccin Mocha"
  "Catppuccin Latte"
  "Quit"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 16 -p 'Change Global Theme:' -theme ~/.config/awesome/apps/rofi/themes/style-1.rasi)
alacritty=~/.config/awesome/apps/alacritty/alacritty.yml
neovim=~/.config/nvim/lua/user/colorscheme.lua
theme=~/.config/awesome/themes/theme.lua
user_likes=~/.config/awesome/user_likes.lua

case $choice in
  'Rose Pine')
    # WALLPAPER --------
    sed -i '/wallpaper = /c\wallpaper = "~\/.config\/awesome\/wallpapers\/bluecircuit.png"' $user_likes
    # ------------------
    # TERMINAL  --------
    sed -i '/  - ~\/.config\/awesome\/apps\/alacritty\/colors/c\  - ~\/.config\/awesome\/apps\/alacritty\/colors\/rose-pine.yml' $alacritty
    # ------------------
    # AWESOMEWM THEME -- 
    sed -i "/local theme = require/c\local theme = require('themes.rose-pine')" $theme
    # NEOVIM COLORSCHEME
    sed -i '/local colorscheme =/c\local colorscheme = "rose-pine"' $neovim
    # ------------------
    # ------------------
    # RESTART WM -------
    echo 'awesome.restart()' | awesome-client
    # ------------------
    ;;
  'Catppuccin Mocha')
    # WALLPAPER  -------
    sed -i '/wallpaper = /c\wallpaper = "~\/.config\/awesome\/wallpapers\/blue_waves.png"' $user_likes
    # ------------------
    # TERMINAL  --------
    # sed -i '/colors: */c\colors: *mocha' $alacritty
    sed -i '/~\/.config\/awesome\/apps\/alacritty\/colors/c\  - ~\/.config\/awesome\/apps\/alacritty\/colors\/mocha.yml' $alacritty
    # ------------------
    # AWESOMEWM THEME -- 
    sed -i "/local theme = require/c\local theme = require('themes.catppuccin')" $theme
    # -----------------
    # NEOVIM COLORSCHEME
    sed -i '/local colorscheme = "/c\local colorscheme = "catppuccin"' $neovim
    sed -i '/flavour = /c\flavour = "mocha",' $neovim
    # ------------------
    # RESTART WM -------
    echo 'awesome.restart()' | awesome-client
    # ------------------
    ;;
  'Catppuccin Latte')
    # WALLPAPER  -------
    sed -i '/wallpaper = /c\wallpaper = "~\/.config\/awesome\/wallpapers\/clouds.png"' $user_likes
    # ------------------
    # TERMINAL  --------
    sed -i '/~\/.config\/awesome\/apps\/alacritty\/colors/c\  - ~\/.config\/awesome\/apps\/alacritty\/colors\/latte.yml' $alacritty
    # ------------------
    # AWESOMEWM THEME -- 
    sed -i "/local theme = require/c\local theme = require('themes.catppuccin-light')" $theme
    # -----------------
    # NEOVIM COLORSCHEME
    sed -i '/local colorscheme = "/c\local colorscheme = "catppuccin"' $neovim
    sed -i '/flavour = /c\flavour = "latte",' $neovim
    # ------------------
    # RESTART WM -------
    echo 'awesome.restart()' | awesome-client
    # ------------------
    ;;
  'Quit')
    echo "No theme chosen. Leaving current." && exit 1 ;;
esac
