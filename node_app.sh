#!/bin/bash

read -p "Enter the absolute path of the directory to write log files " directory_name 

mkdir -p $directory_name
apt install nodejs -y
apt install npm -y

echo "Node version is $(node --version)"
echo "Npm version is $(npm --version)"

wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz -O /opt/nodeapp_folder.tgz
tar -xvzf /opt/nodeapp_folder.tgz -C /opt


sudo useradd -m -r myapp
sudo chown -R myapp /opt/package
sudo chown -R myapp $directory_name

cd /opt/package

su - myapp -c "cd /opt/package && npm install"
su - myapp -c "cd /opt/package && APP_ENV=dev DB_USER=myuser DB_PWD=mysecret LOG_DIR=$directory_name node server.js &"

sleep 2

node_process_name=$(pgrep -af "node server.js" | awk '{print $2, $3}')
node_port=$(sudo netstat -lntp | grep 3000 | awk -F '[:]' '{print $4}')
echo "$node_process_name is running on port $node_port"
