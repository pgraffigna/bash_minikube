#!/bin/bash
# script para instalar minikube

###### variables
MINIKUBE_URL="https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"

echo "minikube: descargando minikube"
curl -s -L "${MINIKUBE_URL}" --output /tmp/minikube-linux-amd64

echo "minikube: instalando minikube"
sudo install /tmp/minikube-linux-amd64 /usr/local/bin/minikube

echo -e "Para iniciar el cluster ==> minikube start --memory=1983mb --vm-driver=docker"