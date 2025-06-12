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
    echo -e "\n${ROJO}[MINIKUBE]=== Programa Terminado por el usuario ===${FIN}"
    exit 0
}

# variables
MINIKUBE_URL="https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"

function instalando_minikube(){

    echo -e "${AMARILLO}[MINIKUBE]=== Instalando dependencias ===${FIN}"
    sudo apt-get install -y conntrack

    echo -e "${AMARILLO}[MINIKUBE]=== Descargando minikube ===${FIN}"
    curl -s -L "${MINIKUBE_URL}" -o /tmp/minikube-linux-amd64

    echo -e "${AMARILLO}[MINIKUBE]=== Instalando minikube ===${FIN}"
    sudo install /tmp/minikube-linux-amd64 /usr/local/bin/minikube
}

instalando_minikube
