#!/bin/sh

sudo apt-get update
sudo curl -sSL https://get.docker.com/ | sh
sudo curl -sSL https://bootstrap.pypa.io/get-pip.py | sudo python
sudo pip install fig

sudo wget -O /usr/local/bin/weave \
  https://git.io/weave
sudo chmod a+x /usr/local/bin/weave

sudo gpasswd -a ${USER} docker

sudo apt-get install -y postgresql

