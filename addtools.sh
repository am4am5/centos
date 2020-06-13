dnf install -y epel-release centos-release-stream && dnf install -y nano htop ncdu wget tar telnet

dnf install cockpit && systemctl enable --now cockpit.socket

