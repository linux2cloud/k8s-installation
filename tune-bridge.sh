## Create a file having required parameted

cat <<EOF > k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

## Send it to all nodes 
for n in master-a master-b worker-a worker-b; do echo "*********$n********"; scp /etc/sysctl.d/k8s.conf $n:/etc/sysctl.d/; done

## Update the sysctl
for n in master-a master-b worker-a worker-b; do echo "*********$n********"; ssh -qt $n "sysctl -p"; done
