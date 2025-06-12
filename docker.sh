#!/usr/bin/env bash
#
# Autor: Pablo Graffigna
# URL: www.linkedin.com/in/pablo-graffigna
#
# Colores
VERDE="\e[0;32m\033[1m"
ROJO="\e[0;31m\033[1m"
AMARILLO="\e[0;33m\033[1m"
FIN="\033[0m\e[0m"

# Ctrl-C
trap ctrl_c INT
function ctrl_c(){
   echo -e "\n${ROJO}[DOCKER]=== Programa Terminado por el usuario ===${FIN}"
   exit 0
}

# Variables
DOCKER_URL="https://download.docker.com/linux/ubuntu"
USUARIO=vagrant

function configurando_dependencias(){

   echo -e "${AMARILLO}[DOCKER]=== Actualizando la cache de los repos ===${FIN}"
   sudo apt-get -qq update

   echo -e "${AMARILLO}[DOCKER]=== Instalando dependencias ===${FIN}"
   sudo apt-get install -yq apt-transport-https ca-certificates curl gnupg-agent software-properties-common

   echo -e "${AMARILLO}[DOCKER]=== Agregando la llave ===${FIN}"
   sudo install -m 0755 -d /etc/apt/keyrings
   sudo curl -fsSL "${DOCKER_URL}/gpg" -o /etc/apt/keyrings/docker.asc
   sudo chmod a+r /etc/apt/keyrings/docker.asc

   echo -e "${AMARILLO}[DOCKER]=== Agregando el repo ===${FIN}"
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
}

function instalando_docker(){

   echo -e "${AMARILLO}[DOCKER]=== Actualizando la cache de los repos ===${FIN}"
   sudo apt-get -qq update

   echo -e "${AMARILLO}[DOCKER]=== Instalando docker ===${FIN}"
   sudo apt-get install -yq docker-ce docker-compose

   echo -e "${AMARILLO}[DOCKER]=== Agregando el usuario ${USUARIO} al grupo docker ===${FIN}"
   sudo usermod -aG docker "${USUARIO}" && newgrp docker 

   echo -e "${AMARILLO}[DOCKER]=== Chequeando instalacion docker ===${FIN}"
   docker --version
   docker-compose --version
}

configurando_dependencias
instalando_docker

