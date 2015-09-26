#!/bin/bash -ex

# wait executing user_data
sleep 30

# install packages
sudo yum -y install git docker

# set docker
sudo usermod -g docker ec2-user
sudo chkconfig --add docker

# install chefDK
wget https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.8.0-1.el6.x86_64.rpm
sudo rpm -Uvh chefdk-0.8.0-1.el6.x86_64.rpm
chef verify
echo "eval \"$(chef shell-init `basename $SHELL`)\"" >> ~/.bashrc
