## Install haproxy

yum install haproxy -y

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
