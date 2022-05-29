#!/bin/bash
URL_DEB="http://archive.ubuntu.com/ubuntu/pool/universe/k/kubecolor/kubecolor_0.0.9-2_amd64.deb"
DEB="kubecolor_0.0.9-2_amd64.deb"

echo "kubecolor: [√] Descargando deb"
curl -s -LO "$URL_DEB"

echo "kubecolor: [√] Instalando deb"
sudo dpkg -i "$DEB" && rm "$DEB"

echo "kubecolor: [√] Editando .bashrc"
echo -e "alias kubectl='kubecolor'" >> ~/.bashrc

 