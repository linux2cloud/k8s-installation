## Stop and Disable firewall

for n in master-a master-b worker-a worker-b; do echo "*********$n********"; ssh -qt $n "systemctl disable firewalld; systemctl stop firewalld "; done
