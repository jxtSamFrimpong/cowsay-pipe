#!/bin/bash
apt-get update

chmod +x docker-install.sh
./docker-install.sh

apt-get update
apt-get install git -y

git clone https://github.com/jxtSamFrimpong/cowsay.git