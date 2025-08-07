#!/usr/bin/env bash

#Confirma que estamos en termux

termux_confirm() {
  if [ -n "$TERMUX_VERSION" ]; then
    echo "zi termux"
    check_root
  else
    echo "[!] Este script solo funciona en termux" 
    echo "[?] Desea continuar? (yes/no)"
    read confirm
    if [ $confirm == "yes" ]; then
      
      echo "oka"
      check_root
    else 
      echo "por favor escriba 'yes' para continuar"
    fi
  fi
}

check_dependency() {
  #Aqui vamos a confirmar que esten las dependencias
  #Instalaremos las dependencias nesesarias
  DEPENDENCIAS=(git curl wget zsh)

  for cmd in "${DEPENDENCIAS[@]}"; do
    if ! command -v $cmd &> /dev/null; then
        echo "[!] $cmd no está instalado, Instalando.."
        pkg install -y $cmd
    else
        echo "[*] Dependencia $cmd satisfecha"
    fi
  done
  install_oh-my-zsh
}

install_oh-my-zsh() {
  echo "[¡] Se va ejecutar otro script"
  echo "Siga las instrucciones (press Enter)"
  read null
  chmod +x ./oh-my-zsh/install.sh
  bash ./oh-my-zsh/install.sh
  echo "[*] Ahora procederemos a instalar p10k"  
  p10k
}

p10k(){
  #git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  #echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
  #echo "[*] p10k instalado correctamente!"
  #echo "[¡] Ejecute zsh para configurarlo"
  echo "Instalacion proximamente.."
  echo "Desea instalar lsd, bat y nvim?"
  read confirm
  if [ $confirm == "y" || $confirm == "yes" ]; then
    pkg install -y lsd bat nvim
    echo "alias ls="lsd"" >> ~/.zshrc
    echo "alias cat="bat"" >> ~/.zshrc
    echo "alias vim="nvim"" >> ~/.zshrc
    echo "alias catn="cat"" >> ~/.zshrc
  fi
    
}

check_root() {
  #Chekeamos que no se ejecute en root o con sudo
  user=$(whoami)
  if [ $user == "root" ]; then
    echo "[*] No ejecute el script como root/sudo"
    echo "[!] Saliendo..."
    exit 2
  else
    check_dependency
  fi
 }

termux_confirm
