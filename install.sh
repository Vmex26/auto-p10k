#!/usr/bin/env bash

#Confirma que estamos en termux

termux_confirm() {
  if [ -n "$TERMUX_VERSION" ]; then
   echo "zi termux"
    #Aqui llamaremos a una funcion para ejecutar
    #el codigo 
  else
    echo "[!] Este script solo funciona en termux" 
fi
}

termux_confirm
