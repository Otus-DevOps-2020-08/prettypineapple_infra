#!/bin/bash
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
# Проблемы с аутентификацией репозитория, в котором находится mongodb. Ключ [trusted=yes] помогает решить эту проблему
bash -c 'echo "deb [trusted=yes] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
apt update
apt install -y mongodb-org
systemctl start mongod
systemctl enable mongod
