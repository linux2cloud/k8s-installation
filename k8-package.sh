## Install kubeadm, kubectl, kubelet and docker package

for n in master-a master-b worker-a worker-b; do echo "*********$n********"; ssh -qt $n "yum install -y kubelet kubeadm kubectl docker-ce"; done
