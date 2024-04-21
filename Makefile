.ONESHELL:
SHELL := /bin/bash
DEPLOY_DIR := /var/mmbu

clean:
	cd ${DEPLOY_DIR}
	rm -rf bibdig-cms bibdig-ui

install: install_cms install_ui run
	git clone https://github.com/mmbugarte/bibdig-cms.git
	git clone https://github.com/mmbugarte/bibdig-ui.git
	cd ${DEPLOY_DIR}/devops

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
