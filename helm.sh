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
    echo -e "\n${ROJO}[HELM]=== Programa Terminado por el usuario ===${FIN}"
    exit 0
}

# Variables
HELM_URL="https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3"

function instalando_helm(){
    echo -e "${AMARILLO}[HELM]=== Descargando script para instalar HELM ===${FIN}"
    curl -fsSL "${HELM_URL}" -o /tmp/get_helm.sh

    echo -e "${AMARILLO}[HELM]=== Modificando permisos ===${FIN}"
    chmod 700 /tmp/get_helm.sh

    echo -e "${AMARILLO}[HELM]=== Instalando helm ===${FIN}"
    bash /tmp/get_helm.sh
}

instalando_helm