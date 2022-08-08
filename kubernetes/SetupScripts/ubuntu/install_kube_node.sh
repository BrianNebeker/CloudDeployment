#!/bin/bash
sudo apt update
sudo apt install -y docker.io

sudo cp -i ./cgroup /etc/docker/daemon.json

sudo systemctl enable docker.service --now

sudo systemctl status docker --no-pager
sudo docker --version

sudo swapoff -a

sudo apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt update
sudo apt install -y kubelet kubeadm kubectl

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

