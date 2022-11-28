#!/bin/bash

docker_exists=$(which docker | grep -c "")

#echo $docker_exists

if [ $docker_exists -eq 0 ]
then
    echo "proceed to install docker"
    apt-get remove docker docker-engine docker.io containerd runc
    apt-get update
    
    apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

    mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    apt-get update

    chmod a+r /etc/apt/keyrings/docker.gpg
    apt-get update

    apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
    apt-get update

    groupadd docker
    usermod -aG docker $USER
    newgrp docker

else
    echo "docker already exists"
fi