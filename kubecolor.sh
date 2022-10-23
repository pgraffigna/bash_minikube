#!/bin/bash
# script para instalar kubecolor

######## variables
VERSION="0.0.20-2"
KUBECOLOR_URL="http://archive.ubuntu.com/ubuntu/pool/universe/k/kubecolor/kubecolor_${VERSION}_amd64.deb"
DEB="kubecolor_${VERSION}_amd64.deb"

echo "kubecolor: descargando deb"
curl -s -L "${KUBECOLOR_URL}" --output /tmp/$DEB

echo "kubecolor: instalando deb"
sudo dpkg -i "/tmp/$DEB"

echo "kubecolor: editando .bashrc"
echo -e "alias kubectl='kubecolor'" >> ~/.bashrc

