## Install haproxy

yum install haproxy -y

## Append haproxy.cfg

cat >> /etc/haproxy/haproxy.cfg <<EOF
frontend fe-apiserver
        bind *:6443
        mode tcp
        option tcplog
        default_backend be-apiserver

backend be-apiserver 
        mode tcp
        option tcplog
        option tcp-check
        balance roundrobin
        server master-a 172.24.0.161:6443 check
        server master-b 172.24.0.162:6443 check
EOF

## Start and Enable haproxy service
systemctl restart haproxy
systemctl enable haproxy
systemctl status haproxy

## Disable Firewalld on Loadbalacer Server
systemctl disable firewalld
systemctl stop firewalld
