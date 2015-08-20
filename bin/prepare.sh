#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y screen cmake vim
sudo apt-get install -y software-properties-common
sudo apt-get install -y curl flex bison zlib1g-dev libreadline6-dev gcc make supervisor git \
                    openssh-server openssh-client rsync
sudo apt-get install -y python-dev
sudo apt-get install -y pgxnclient


### PGXL

cd /tmp
git clone https://github.com/mbreisch/postgres-xl.git pgxl --depth 1
cd /tmp/pgxl
PATH=$PATH:/opt/anaconda/bin ./configure --with-python --prefix /opt/pgxl
make -j 4
cd /tmp/pgxl/contrib
make -j 4
cd /tmp/pgxl
sudo make install
cd /tmp/pgxl/contrib
sudo make install

echo "export PATH=/opt/pgxl/bin:$PATH" >> ~/.pgxl
echo "export PGDATA=/pom/pgxc" >> ~/.pgxl

