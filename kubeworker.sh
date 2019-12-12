ip a
hostnamectl set-hostname <name>

nano .bashrc
alias u='dnf update'

nano /etc/hosts
172.16.9.47 kubemaster1
172.16.9.49 kubeworker1
172.20.240.149 kubeworker2
172.20.240.171 kubeworker3
172.20.240.136 kubeworker4
172.20.236.178 kubeworker5

swapoff -a
nano /etc/fstab
#swap

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

dnf install -y kubelet kubeadm kubectl
systemctl enable --now kubelet

setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system

modprobe br_netfilter
echo "modprobe br_netfilter" >> .bashrc

systemctl disable --now firewalld

#kubemaster
kubeadm token create --print-join-command

