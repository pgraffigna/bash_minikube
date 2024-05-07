# minikube

Repo para crear un Cluster Kubernetes usando minikube a partir de scripts en bash.

Testeado con qemu + ubuntu2204 + vagrant 

---

### Descripción

El proyecto cuenta con los archivos necesarios para desplegar un cluster Kubernetes via [minikube](https://minikube.sigs.k8s.io/docs/start/) para pruebas de laboratorio, también se instala [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/), [kubecolor](https://github.com/hidetatz/kubecolor) y [helm](https://helm.sh/docs/intro/install/) para la gestión del servicio.

---

### Dependencias

* [Vagrant](https://developer.hashicorp.com/vagrant/install)

### Uso

```
git clone https://github.com/pgraffigna/bash_minikube.git
cd bash_minikube
vagrant up 
```

### Extras

* Vagrantfile: Archivo de configuración para desplegar una VM descartable con ubuntu-22.04 con libvirt como hipervisor.

---

### scripts:
- docker.sh
- helm.sh
- kubectl.sh
- kubecolor.sh
- minikube.sh
- cri-dockerd.sh
- cri-tools.sh


