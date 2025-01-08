# minikube
Repo para crear un Cluster Kubernetes usando minikube a partir de scripts en bash.

Testeado con qemu + ubuntu2204 + vagrant

### descripción
El proyecto cuenta con los archivos necesarios para desplegar un cluster Kubernetes via [minikube](https://minikube.sigs.k8s.io/docs/start/) para pruebas de laboratorio, también se instala [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/), [kubecolor](https://github.com/hidetatz/kubecolor) y [helm](https://helm.sh/docs/intro/install/) para la gestión del servicio.

### dependencias
* [Vagrant](https://developer.hashicorp.com/vagrant/install)

### uso
```shell
git clone https://github.com/pgraffigna/bash_minikube.git
cd bash_minikube
vagrant up
```

### extras
* Vagrantfile: Archivo de configuración para desplegar una VM descartable con ubuntu-22.04 con libvirt como hipervisor.

### scripts:
- docker.sh
- helm.sh
- kubectl.sh
- kubecolor.sh
- minikube.sh
- cri-dockerd.sh
- cri-tools.sh

### minikube-cli
```shell
# desplegar cluster
minikube start --driver=docker --nodes=2 --disk-size=10g --cpus=2 --memory=6g --kubernetes-version=v1.27.12 --cni=calico --profile minik8s

# configurar cluster por default
minikube profile minik8s

# enumerar nodos
minikube node list --profile minik8s
```

### minikube auto-completion
```shell
sudo apt install -y bash-completion
source /etc/bash_completion
source <(minikube completion bash)
minikube completion bash
```


