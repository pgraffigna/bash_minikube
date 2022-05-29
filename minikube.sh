#!/bin/bash
MINI_URL="https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"

echo "minikube: [√] Instalando dependencias"
sudo apt-get install -yq conntrack

echo "minikube: [√] Descargando Minikube"
curl -Lso minikube "$MINI_URL" 

echo "minikube: [√] Configurando Minikube"
sudo cp minikube /usr/local/bin/minikube && sudo chmod +x /usr/local/bin/minikube

echo "minikube: [√] Iniciando el cluster"
minikube start --vm-driver=docker
