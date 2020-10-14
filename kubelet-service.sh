## Start and Enable kubelet Service

for n in master-a master-b worker-a worker-b; do echo "*********$n********"; ssh -qt $n "systemctl enable kubelet; systemctl start kubelet "; done
