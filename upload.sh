#!/bin/zsh
echo Uploading ...

server_url=ec2-18-236-78-170.us-west-2.compute.amazonaws.com

rm -f upload.zip
zip upload.zip -r db_data 
zip -u upload.zip devops/compose.yml 
zip -u upload.zip devops/deploy.sh 
zip -u upload.zip bibdig-cms/.env

scp -i ~/.ssh/docker-uqbar.pem upload.zip ubuntu@$server_url:.

rm -f upload.zip

deploy=$(cat << 'EOF'
echo Preparing deploy

sudo rm -rf /var/mmbu
if [ ! -d /var/mmbu ]; then
    sudo mkdir -p /var/mmbu
    sudo chown ubuntu:ubuntu /var/mmbu
fi

cd /var/mmbu
unzip -uo ~/upload.zip

sudo chmod +x devops/deploy.sh
devops/deploy.sh
EOF
)

echo Upload completed, executing remote deploy.
ssh -i ~/.ssh/docker-uqbar.pem ubuntu@$server_url "$deploy"
