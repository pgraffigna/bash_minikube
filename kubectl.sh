#!/bin/bash
# script para instalar kubectl

###### variables
KUBECTL_VERSION="v1.25.0"
KUBECTL_URL="https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

echo "kubectl: descargando kubectl"
curl -s -L "${KUBECTL_URL}" --output /tmp/kubectl

echo "kubectl: cambiando permisos al binario"
chmod +x /tmp/kubectl

echo "kubectl: moviendo el binario al PATH"
sudo mv /tmp/kubectl /usr/local/bin/kubectl
