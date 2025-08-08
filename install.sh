#!/usr/bin/env bash

#Cofirm if we are in termux or in another distro

detect_system() {
  if [ -n "$TERMUX_VERSION" ]; then
    IS_TERMUX=true
    PKG_CMD="pkg"
    echo "[*] Running in termux"
    echo "If we are not in termux quit (Ctrl + c)"
    read null
    check_root
  elif command -v apt &> /dev/null; then
    IS_TERMUX=false
    PKG_CMD="sudo apt"
    echo "[*] Running in debian based"
    echo "[¡] Press enter to continue"
    read null
    check_root
  else
    echo "[!] No compatible package manager or distro found"
    exit 1
  fi  
}

# Prevent running as root in termux
check_root() {
  user=$(whoami)
  if [ "$IS_TERMUX" == true ]; then  
    if [ "$user" == "root" ]; then
      echo "[!] Do not run this script as root"
      echo "[!] Exiting..."
      exit 2
    else
      check_dependency
    fi
  else
    echo "[*] You will be asked for the sudo password to install some packages. (press Enter)"
    read null
    check_dependency
  fi
 }

#Check and install required dependecy
check_dependency() {
  DEPENDENCIES=(git curl wget zsh)

  for cmd in "${DEPENDENCIES[@]}"; do
    if ! command -v $cmd &> /dev/null; then
        echo "[!] $cmd is not installed. Installing .."
        $PKG_CMD install -y $cmd
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
  echo "[!] Run 'zsh' to configure it (press Enter)"
  read null
  echo "[?] Do you want to install lsd, bat, and neovim? (y/n)"
  read confirm
  if [ "$confirm" = "y" ]; then
    $PKG_CMD install -y lsd bat neovim
    echo "alias ls='lsd'" >> ~/.zshrc
    echo "alias cat='bat'" >> ~/.zshrc
    echo "alias vim='nvim'" >> ~/.zshrc
    echo "alias catn='cat'" >> ~/.zshrc
  else
    echo "[*] Extra packages not installed"
  fi
  echo "[*] Installation completed, now run zsh"
  
}



#Start the script
detect_system

