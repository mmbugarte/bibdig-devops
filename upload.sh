#!/bin/zsh
echo Uploading ...

ls
server_url=ec2-34-209-244-214.us-west-2.compute.amazonaws.com

rm -f upload.zip
zip upload.zip -r db_data 
zip -u upload.zip devops/compose.yml 
zip -u upload.zip devops/deploy.sh 

scp -i ~/.ssh/docker-uqbar.pem upload.zip ubuntu@$server_url:.

rm -f upload.zip

deploy=$(cat << 'EOF'
echo Preparing deploy

rm -rf /var/mmbu
if [ ! -d /var/mmbu ]; then
    sudo mkdir -p /var/mmbu
    sudo chown ubuntu:ubuntu /var/mmbu
fi

cd /var/mmbu
unzip -uo ~/upload.zip

cd devops
sudo chmod +x ./deploy.sh
./deploy.sh
EOF
)

echo Upload completed, executing remote deploy.
ssh -i ~/.ssh/docker-uqbar.pem ubuntu@$server_url "$deploy"

