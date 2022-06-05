#!/bin/bash
GPG=https://download.docker.com/linux/ubuntu/gpg
URL=https://download.docker.com/linux/ubuntu
USUARIO=vagrant

echo "docker: [√] Actualizando la cache de los repos"
sudo apt-get -qq update

echo "docker: [√] Instalando dependencias"
sudo apt-get install -yq apt-transport-https ca-certificates curl gnupg-agent software-properties-common

echo "docker: [√] Agregando la llave GPG de docker"
curl -fsSL  $GPG | sudo apt-key add -

echo "docker: [√] Agregando el repositorio"
sudo add-apt-repository \
   "deb [arch=amd64] $URL \
   $(lsb_release -cs) \
   stable"

echo "docker: [√] De nuevo actualizando la cache de los repos"
sudo apt-get -qq update

echo "docker: [√] Instalando docker y docker-compose" 
sudo apt-get install -yq docker-ce docker-compose

echo "docker: [√] Agregando el usuario vagrant al grupo docker"
sudo usermod -aG docker $USUARIO && newgrp docker