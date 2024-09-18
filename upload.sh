#!/bin/zsh
echo Uploading ...

server_url=ec2-52-43-212-35.us-west-2.compute.amazonaws.com

rm -f secrets.zip
zip -u secrets.zip bibdig-cms/.env
scp -i ~/.ssh/docker-uqbar.pem secrets.zip ubuntu@$server_url:.
rm -f secrets.zip

deploy=$(cat << 'EOF'
echo Preparing deploy

sudo rm -rf /var/mmbu
if [ ! -d /var/mmbu ]; then
    sudo mkdir -p /var/mmbu
    sudo chown ubuntu:ubuntu /var/mmbu
fi

cd /var/mmbu
git clone https://github.com/mmbugarte/bibdig-devops.git devops

cd devops
make run

EOF
)

echo Upload completed, executing remote deploy.
ssh -i ~/.ssh/docker-uqbar.pem ubuntu@$server_url "$deploy"
