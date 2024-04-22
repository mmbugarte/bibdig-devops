.ONESHELL:
SHELL := /bin/bash
DEPLOY_DIR := /var/mmbu

clean: 
	rm -rf bibdig-cms bibdig-ui

install: install_cms install_ui install_secrets run

install_cms:
	cd ${DEPLOY_DIR}
	git clone https://github.com/mmbugarte/bibdig-cms.git

install_ui:
	cd ${DEPLOY_DIR}
	git clone https://github.com/mmbugarte/bibdig-ui.git

install_secrets:
	cd ${DEPLOY_DIR}
	unzip -uo ~/secrets.zip

update: update_cms update_ui run

update_cms:
	cd ${DEPLOY_DIR}/bibdig-cms
	git pull
	cd ${DEPLOY_DIR}/devops
	sudo docker compose build cms

update_ui:
	cd ${DEPLOY_DIR}/bibdig-ui
	git pull

run:
	sudo docker compose up database -d
	sudo docker compose up -d
