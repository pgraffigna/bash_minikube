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
    echo -e "\n${ROJO}[CRI-DOCKERD] === Programa Terminado por el usuario ===${FIN}"
    exit 0
}

# variables
CRI_DOCKERD_VERSION="v0.2.0"
CRI_DOCKERD_URL="https://github.com/Mirantis/cri-dockerd/releases/download/${CRI_DOCKERD_VERSION}/cri-dockerd-${CRI_DOCKERD_VERSION}-linux-amd64.tar.gz"
CRI_DOCKERD_SERVICE="https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.service"
CRI_DOCKERD_SOCKET="https://raw.githubusercontent.com/Mirantis/cri-dockerd/master/packaging/systemd/cri-docker.socket"

function descargando_dependencias(){

    echo -e "${AMARILLO}[CRI-DOCKERD]=== Descargando binario ===${FIN}"
    wget -q --show-progress --progress=bar:force 2>&1 "${CRI_DOCKERD_URL}" -O "/tmp/cri-dockerd-${CRI_DOCKERD_VERSION}-linux-amd64.tar.gz"

    echo -e "${AMARILLO}[CRI-DOCKERD]=== Descargando servicio ===${FIN}"
    wget -q --show-progress --progress=bar:force 2>&1 "${CRI_DOCKERD_SERVICE}" -O "/tmp/cri-docker.service"

    echo -e "${AMARILLO}[CRI-DOCKERD]=== Descargando socket ===${FIN}"
    wget -q --show-progress --progress=bar:force 2>&1 "${CRI_DOCKERD_SOCKET}" -O "/tmp/cri-docker.socket"
}

function configurando(){

    echo -e "${AMARILLO}[CRI-DOCKERD]=== Descomprimiendo tar.gz ===${FIN}"
    sudo tar xvf /tmp/cri-dockerd-"${CRI_DOCKERD_VERSION}"-linux-amd64.tar.gz -C /usr/local/bin

    echo -e "${AMARILLO}[CRI-DOCKERD]=== Moviendo socket + servicio ===${FIN}"
    sudo mv /tmp/cri-docker.socket /tmp/cri-docker.service /etc/systemd/system/

    echo -e "${AMARILLO}[CRI-DOCKERD]=== Configurando el servicio ===${FIN}"
    sudo sed -i -e 's,/usr/bin/cri-dockerd,/usr/local/bin/cri-dockerd,' /etc/systemd/system/cri-docker.service

    echo -e "[CRI-DOCKERD]${VERDE}=== Activando el servicio ===${FIN}"
    sudo systemctl daemon-reload && sudo systemctl enable cri-docker.service --now
}

descargando_dependencias
configurando

