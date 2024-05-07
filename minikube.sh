#!/bin/bash
MINIKUBE_URL="https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"

echo "[MINIKUBE] Instalando dependencias"
sudo apt-get install -y conntrack

echo "[MINIKUBE] Descargando minikube"
curl -s -L "${MINIKUBE_URL}" -o /tmp/minikube-linux-amd64

echo "[MINIKUBE] Instalando minikube"
sudo install /tmp/minikube-linux-amd64 /usr/local/bin/minikube