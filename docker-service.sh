## Start and Enable docker service

for n in master-a master-b worker-a worker-b; do echo "*********$n********"; ssh -qt $n "systemctl enable docker; systemctl start docker"; done
