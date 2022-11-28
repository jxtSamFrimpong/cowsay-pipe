#!/bin/bash

chmod +x build-jenkins-dock.sh
./build-jenkins-dock.sh

chmod +x make-.gitlab.sh
./make-.gitlab.sh

docker compose -f docker-compose.yml up -d --remove-orphans --build