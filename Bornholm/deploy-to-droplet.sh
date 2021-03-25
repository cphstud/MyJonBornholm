#!/usr/bin/env bash -vx

#SERVER_NAME below MUST mach the DIRECTORY created on your droplet in the /var folder
SERVER_NAME="my-server"

DROPLET_URL="64.227.114.223"
# Change the root below to the non-root user you have setup:
DROPLET_USER="thor"


echo "##############################"
echo "Building the Project          "
echo "##############################"

# If you have setup maven on your system, you can uncomment the line below
# this will compile your code, and copy the jar-file to the deploy folder

# mvn package
tar cvf a.tar css/ js/ img/ *html

ssh thor@${DROPLET_URL} "rm /var/www/Netfarmers/a.tar"

echo "##############################"
echo "Deploying The project..."
echo "##############################"

cat a.tar | ssh thor@${DROPLET_URL} "cd /var/www/netfarmers/;tar xvf -"
ssh thor@${DROPLET_URL} "ls -l /var/www/netfarmers/"
