## Check swap status
for n in master-a master-b worker-a worker-b; do echo "*********$n********"; ssh -qt $n "swapon -s"; done
