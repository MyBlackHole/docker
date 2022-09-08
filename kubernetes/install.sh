
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B57C5C2836F4BEB
sudo add-apt-repository "deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main"
sudo apt-get install -y kubelet kubeadm kubectl

/etc/docker/daemon.json
{
  "dns":["8.8.8.8"],
  "exec-opts": ["native.cgroupdriver=systemd"],
  "registry-mirrors": ["https://98bnyivl.mirror.aliyuncs.com"]
}

kubeadm init \
--apiserver-advertise-address=192.168.5.228  \
--ignore-preflight-errors=all \
--image-repository registry.aliyuncs.com/google_containers \
--service-cidr=10.1.0.0/16 \
--pod-network-cidr=10.244.0.0/16


