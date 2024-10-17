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
    echo -e "\n${ROJO}[KUBECTL]=== Programa Terminado por el usuario ===${FIN}"
    exit 0
}

# Variables
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
KUBECTL_URL="https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

function instalando_kubectl(){

    echo -e "${AMARILLO}[KUBECTL] Descargando binario ===${FIN}"
    curl -s -L "${KUBECTL_URL}" -o /tmp/kubectl

    echo -e "${AMARILLO}[KUBECTL] Modificando permisos ===${FIN}"
    chmod +x /tmp/kubectl

    echo -e "${AMARILLO}[KUBECTL] Moviendo el binario ===${FIN}"
    sudo mv /tmp/kubectl /usr/local/bin/kubectl
}

instalando_kubectl