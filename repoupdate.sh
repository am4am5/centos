In order to convert from archived vault Centos 8 the procedure is
Under /etc/yum.repo.d
Change urls from Centos to vault.
Example :
name=CentOS Linux $releasever - BaseOS
#mirrorlist=http://mirrorlist.centos.org/?release=$ ... fra=$infra
mirrorlist=http://vault.centos.org/?release=$relea ... fra=$infra
baseurl=http://vault.centos.org/$contentdir/$re ... search/os/

dnf clean all
dnf swap centos-linux-repos centos-stream-repos ( This will produce erros , so repeat this command twice)
dnf update
reboot
