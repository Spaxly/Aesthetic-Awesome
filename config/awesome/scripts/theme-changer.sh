#!/bin/bash

declare -a options=(
  "Rose Pine"
  "Catppuccin"
  "Quit"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 16 -p 'Change Global Theme:' -theme ~/.config/awesome/apps/rofi/themes/style-1.rasi)
alacritty=~/.config/awesome/apps/alacritty/colors.yml
theme=~/.config/awesome/themes/theme.lua
user_likes=~/.config/awesome/user_likes.lua

case $choice in
  'Rose Pine')
    # WALLPAPER --------
    sed -i '/wallpaper = /c\wallpaper = "~\/.config\/awesome\/wallpapers\/bluecircuit.png"' $user_likes
    # ------------------
    # TERMINAL  --------
    sed -i '/colors: */c\colors: *rose-pine' $alacritty
    # ------------------
    # AWESOMEWM THEME -- 
    sed -i "/local theme = require/c\local theme = require('themes.rose-pine')" $theme
    # ------------------
    # RESTART WM -------
    echo 'awesome.restart()' | awesome-client
    # ------------------
    ;;
  'Catppuccin')
    # WALLPAPER  -------
    sed -i '/wallpaper = /c\wallpaper = "~\/.config\/awesome\/wallpapers\/blue_waves.png"' $user_likes
    # ------------------
    # TERMINAL  --------
    sed -i '/colors: */c\colors: *mocha' $alacritty
    # ------------------
    # AWESOMEWM THEME -- 
    sed -i "/local theme = require/c\local theme = require('themes.catppuccin')" $theme
    # -----------------

    # RESTART WM -------
    echo 'awesome.restart()' | awesome-client
    # ------------------
    ;;
  'Quit')
    echo "No theme chosen. Leaving current." && exit 1 ;;
esac
