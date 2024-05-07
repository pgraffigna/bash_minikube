#!/bin/bash
DOCKER_URL="https://download.docker.com/linux/ubuntu"
USUARIO=vagrant

echo "[DOCKER] Actualizando la cache de los repos"
sudo apt-get -qq update

echo "[DOCKER] Instalando dependencias"
sudo apt-get install -yq apt-transport-https ca-certificates curl gnupg-agent software-properties-common

echo "[DOCKER] Agregando la llave"
curl -fsSL "${DOCKER_URL}/gpg" | sudo apt-key add -

echo "[DOCKER] Agregando el repo"
sudo add-apt-repository \
   "deb [arch=amd64] "${DOCKER_URL}" \
   $(lsb_release -cs) \
   stable"

echo "[DOCKER] Actualizando la cache de los repos"
sudo apt-get -qq update

echo "[DOCKER] Instalando docker"
sudo apt-get install -yq docker-ce

echo -e "[DOCKER] Agregando el usuario ${USUARIO} al grupo docker"
sudo usermod -aG docker "${USUARIO}" && newgrp docker 