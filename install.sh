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
      echo "por favor escriba 'yes' para continuar "
    fi
  fi
}

check_dependency() {
  #Aqui vamos a confirmar que esten las dependencias
  echo "Bien"
}

check_root() {
  user=$(whoami)
  if [ $user == "root" ]; then
    echo "[!] No ejecute el script como root"
    echo "[!] Saliendo..."
    exit 2
  else
    check_dependency
  fi
 }

termux_confirm
