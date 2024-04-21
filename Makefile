.ONESHELL:
SHELL := /bin/bash
DEPLOY_DIR := /var/mmbu

clean:
	cd ${DEPLOY_DIR}
	rm -rf bibdig-cms bibdig-ui

install:
	echo Deploying ...
	cd ${DEPLOY_DIR}

	if [ ! -d bibdig-cms ]; then
		git clone https://github.com/mmbugarte/bibdig-cms.git
	else
		cd bibdig-cms
		git pull
		cd ..
	fi

	unzip ~/upload.zip bibdig-cms/.env

	if [ ! -d bibdig-ui ]; then
		git clone https://github.com/mmbugarte/bibdig-ui.git
	else
		cd bibdig-ui
		git pull
		cd ..
	fi

	cd devops
	sudo docker compose up 
	echo Deploy completed
