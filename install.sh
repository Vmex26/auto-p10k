#!/usr/bin/env bash

#Cofirm if we are in termux

termux_confirm() {
  if [ -n "$TERMUX_VERSION" ]; then
    check_root
  else
    echo "[!] This script is only for Termux" 
    echo "[?] Do you want to continue? (yes/no)"
    read confirm
    if [ $confirm == "yes" ]; then
      
      echo "oka"
      check_root
    else 
      echo "[!] Please type 'yes' to continue"
    fi
  fi
}

#Check and install required dependecy
check_dependency() {
  DEPENDENCIES=(git curl wget zsh)

  for cmd in "${DEPENDENCIES[@]}"; do
    if ! command -v $cmd &> /dev/null; then
        echo "[!] $cmd is not installed. Installing .."
        pkg install -y $cmd
    else
        echo "[*] Dependecy $cmd is alredy satisfied"
    fi
  done

  install_oh-my-zsh
}

#Install oh my zsh
install_oh-my-zsh() {
  echo "[!] Another script will be executed"
  echo "Follow the instructions (press Enter)"
  read null
  chmod +x ./oh-my-zsh/install.sh
  bash ./oh-my-zsh/install.sh
  echo "[*] Proceeding to install p10k"  
  p10k
}

p10k(){
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
  echo "[*] Powerlevel10k installed successfully!"
  echo "[!] Run 'zsh' to configure it"
  echo "[?] Do you want to install lsd, bat, and neovim? (y/n)"
  read confirm
  if [ $confirm == "y" ]; then
    pkg install -y lsd bat neovim
    echo "alias ls="lsd"" >> ~/.zshrc
    echo "alias cat="bat"" >> ~/.zshrc
    echo "alias vim="nvim"" >> ~/.zshrc
    echo "alias catn="cat"" >> ~/.zshrc
  fi
    
}

# Prevent running as root or with sudo
check_root() {
  user=$(whoami)
  if [ "$user" == "root" ]; then
    echo "[*] Do not run this script as root or with sudo"
    echo "[!] Exiting..."
    exit 2
  else
    check_dependency
  fi
 }

#Start the script
termux_confirm
