ENV['VAGRANT_DEFAULT_PROVIDER'] = 'libvirt'
IMAGEN = "generic/ubuntu2204"
HOSTNAME = "minikube.home.lab"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.define "minikube" do |m|
    m.vm.box = IMAGEN
    m.vm.hostname = HOSTNAME
    m.vm.provision "shell", path: "docker.sh"
    m.vm.provision "shell", path: "helm.sh"
    m.vm.provision "shell", path: "kubectl.sh"
    m.vm.provision "shell", path: "kubecolor.sh"
    m.vm.provision "shell", path: "cri-dockerd.sh"
    m.vm.provision "shell", path: "cri-tools.sh"
    m.vm.provision "shell", path: "minikube.sh"
  end

  config.vm.provider :libvirt do |l|
    l.disk_bus = 'virtio'
    l.memory = "4096"
    l.cpus = "2"
    l.graphics_type = 'none'
  end
end

