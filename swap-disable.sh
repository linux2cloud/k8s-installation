## Disable swap
for n in master-a master-b worker-a worker-b; do echo "*********$n********"; ssh -qt $n "sed -i '/swap/d' /etc/fstab; swapoff -a"; done
