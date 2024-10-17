#!/usr/bin/env bash
#
# Autor: Pablo Graffigna
# URL: www.linkedin.com/in/pablo-graffigna
#
# debug
set -e

# Colores
VERDE="\e[0;32m\033[1m"
ROJO="\e[0;31m\033[1m"
AMARILLO="\e[0;33m\033[1m"
FIN="\033[0m\e[0m"

# Ctrl-C
trap ctrl_c INT
function ctrl_c(){
    echo -e "\n${ROJO}[KUBECOLOR]=== Programa Terminado por el usuario ===${FIN}"
    exit 0
}

# Variables
KUBECOLOR_VERSION="0.0.20-1"
KUBECOLOR_URL="http://archive.ubuntu.com/ubuntu/pool/universe/k/kubecolor/kubecolor_${KUBECOLOR_VERSION}_amd64.deb"
KUBECOLOR_DEB="kubecolor_${KUBECOLOR_VERSION}_amd64.deb"
HOME=/home/vagrant

function instalando_kubecolor(){
    
    echo -e "${AMARILLO}[KUBECOLOR]=== Descargando paquete ===${FIN}"
    curl -s -L "${KUBECOLOR_URL}" -o "/tmp/${KUBECOLOR_DEB}"

    echo -e "${AMARILLO}[KUBECOLOR]=== Instalando ===${FIN}"
    sudo dpkg -i "/tmp/${KUBECOLOR_DEB}"

    echo -e "${AMARILLO}[KUBECOLOR]=== Agregando aliases ===${FIN}"
    echo -e "alias kubectl='kubecolor'\nalias k='kubectl'" >> $HOME/.bashrc
}

instalando_kubecolor