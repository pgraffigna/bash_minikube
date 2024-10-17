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
    echo -e "\n${ROJO}[CRI-TOOLS]=== Programa Terminado por el usuario ===${FIN}"
    exit 0
}

# Variables
CRI_TOOL_VERSION="v1.25.0"
CRI_TOOL_URL="https://github.com/kubernetes-sigs/cri-tools/releases/download/${CRI_TOOL_VERSION}/crictl-${CRI_TOOL_VERSION}-linux-amd64.tar.gz"

function Instalando_critools(){

    echo -e "${AMARILLO}[CRI-TOOLS]=== Descargando binario ===${FIN}"
    wget -q --show-progress --progress=bar:force 2>&1 "${CRI_TOOL_URL}" -O "/tmp/crictl-${CRI_TOOL_VERSION}-linux-amd64.tar.gz"

    echo -e "${AMARILLO}[CRI-TOOLS]=== Descomprimiendo + moviendo el binario ===${FIN}"
    sudo tar xvf /tmp/crictl-${CRI_TOOL_VERSION}-linux-amd64.tar.gz -C /usr/local/bin
}

Instalando_critools