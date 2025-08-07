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
        echo "[¡] Dependencia $cmd satisfecha"
    fi
  done
  install_oh-my-zsh
}

install_oh-my-zsh() {
  pass
  #Aqui incluire el codigo que instale oh my zsh
}

check_root() {
  #Chekeamos que no se ejecute en root o con sudo
  user=$(whoami)
  if [ $user == "root" ]; then
    echo "[!] No ejecute el script como root/sudo"
    echo "[!] Saliendo..."
    exit 2
  else
    check_dependency
  fi
 }

termux_confirm
