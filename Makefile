.ONESHELL:
SHELL := /bin/bash
DEPLOY_DIR := /var/mmbu

clean:
	cd ${DEPLOY_DIR}
	rm -rf bibdig-cms bibdig-ui

install: instal_cms install_ui run
	cd ${DEPLOY_DIR}/devops

install_cms:
	git clone https://github.com/mmbugarte/bibdig-cms.git

install_ui:
	git clone https://github.com/mmbugarte/bibdig-ui.git

update: update_cms update_ui run

update_cms:
	cd ${DEPLOY_DIR}/bibdig-cms
	git pull

update:ui
	cd ${DEPLOY_DIR}/bibdig-ui
	git pull

run:
	sudo docker compose up database -d
	sudo docker compose up
