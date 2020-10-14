## Create Kubernetes Repository

cat > kubernetes.repo <<EOF
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

## Send repository file to all cluster nodes and configure repository

for n in master-a master-b worker-a worker-b; do echo "*********$n********"; scp kubernetes.repo $n:/etc/yum.repos.d/; done
