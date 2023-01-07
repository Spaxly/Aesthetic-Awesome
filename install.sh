#!/bin/bash

sys_update () {
  sleep 1;
  sudo pacman -Syu --noconfirm 
  clear
}

install_aur_helper () {
  if ! command -v yay &> /dev/null
  then
    sudo pacman -S git --noconfirm --needed
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay/ && makepkg -si --noconfirm --needed PKGBUILD)
  else
    echo "Looks like yay is already installed, skipping this step."
    sleep 1; clear
  fi
}

install_deps () {
  echo "Installing dependencies"
  yay -Syu $(cat config/awesome/pkglist)
  sleep 2; clear
}

copy_files () {
  echo "Copying files"
  cp -r config/* ~/.config/
  cp -r icons/ ~/.icons/
  tar xf ~/.icons/oomox-aesthetic-light.tar.xz --directory ~/.icons
  sleep 1; clear
}

submodules () {
  git clone https://github.com/andOrlando/rubato ~/.config/awesome/
  git clone https://github.com/andOrlando/color ~/.config/awesome/
  git clone https://github.com/BlingCorp/bling ~/.config/awesome/
}

clear
bold=$(tput bold)
echo "${bold}This installation script only works for Arch-based distros!${bold}"
echo " "
read -r -p "Proceed?
(1) yes
(*) no
" proceed

if [[ $proceed == "1" ]]; then
  clear
  sys_update
  install_aur_helper
  install_deps
  copy_files
  submodules
  echo "Done. A reboot is recommended. Also for neovim, don't forget to run PackerSync"
else
  exit
fi
