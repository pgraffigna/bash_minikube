#!/bin/bash
# script para instalar docker + docker-compose

###### variables
DOCKER_URL=https://download.docker.com/linux/ubuntu
USUARIO=vagrant

echo "docker: actualizando la cache de los repos"
sudo apt-get -qq update

echo "docker: instalando dependencias"
sudo apt-get install -yq apt-transport-https ca-certificates curl gnupg-agent software-properties-common

echo "docker: agregando la llave GPG de docker"
curl -fsSL  "${DOCKER_URL}/gpg" | sudo apt-key add -

echo "docker: agregando el repositorio"
sudo add-apt-repository \
   "deb [arch=amd64] "${DOCKER_URL}" \
   $(lsb_release -cs) \
   stable"

echo "docker: de nuevo actualizando la cache de los repos"
sudo apt-get -qq update

echo "docker: instalando docker y docker-compose"
sudo apt-get install -yq docker-ce docker-compose

echo "docker: agregando el usuario vagrant al grupo docker"
sudo usermod -aG docker "${USUARIO}" && newgrp docker