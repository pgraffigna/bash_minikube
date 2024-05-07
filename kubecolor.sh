#!/bin/bash
KUBECOLOR_VERSION="0.0.20-1"
KUBECOLOR_URL="http://archive.ubuntu.com/ubuntu/pool/universe/k/kubecolor/kubecolor_${KUBECOLOR_VERSION}_amd64.deb"
KUBECOLOR_DEB="kubecolor_${KUBECOLOR_VERSION}_amd64.deb"
HOME=/home/vagrant

echo "[KUBECOLOR] Descargando paquete"
curl -s -L "${KUBECOLOR_URL}" -o "/tmp/${KUBECOLOR_DEB}"

echo "[KUBECOLOR] Instalando"
sudo dpkg -i "/tmp/${KUBECOLOR_DEB}"

echo "[KUBECOLOR] Agregando aliases"
echo -e "alias kubectl='kubecolor'\nalias k='kubectl'" >> $HOME/.bashrc

