#!/bin/bash
set -x
set -e

rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum install puppet ruby-devel gcc gcc-c++ libxml2 libxml2-devel libxslt libxslt-devel -y
puppet resource package puppet ensure=latest
puppet help help help

chown -R vagrant /usr/lib/ruby
chmod 777 /usr/bin
echo "gem: --no-rdoc --no-ri" > /etc/gemrc

wget --quiet https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.5_x86_64.rpm -O vagrant_1.6.5_x86_64.rpm
rpm -Uvh vagrant_1.6.5_x86_64.rpm

yum -y groupinstall "Development Tools"
wget --quiet -O /etc/yum.repos.d/virtualbox.repo http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
yum update -y
yum install -y binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms

yum -y install VirtualBox-4.3

# reboot
# /etc/init.d/vboxdrv setup
