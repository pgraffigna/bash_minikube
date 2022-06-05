#!/bin/bash
MINI_URL="https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"

echo "minikube: [√] Instalando dependencias"
sudo apt-get install -yq conntrack

echo "minikube: [√] Descargando Minikube"
curl -Lso minikube "$MINI_URL" 

echo "minikube: [√] Configurando Minikube"
sudo mv minikube /usr/local/bin/minikube && sudo chmod +x /usr/local/bin/minikube

echo "Iniciar el cluster --> minikube start --vm-driver=docker"
