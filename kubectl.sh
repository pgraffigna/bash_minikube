#!/bin/bash
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
KUBECTL_URL="https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

echo "[KUBECTL] Descargando binario"
curl -s -L "${KUBECTL_URL}" -o /tmp/kubectl

echo "[KUBECTL] Modificando permisos"
chmod +x /tmp/kubectl

echo "[KUBECTL] Moviendo el binario"
sudo mv /tmp/kubectl /usr/local/bin/kubectl
