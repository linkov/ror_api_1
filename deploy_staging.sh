#!/bin/bash
ssh SSH_ADDR << EOF
    cd DIR
	git checkout develop
	git reset --hard origin/develop
	git pull
	bundle install
	bundle --deployment
	rake RAILS_ENV=staging db:migrate
	rake RAILS_ENV=staging assets:precompile
	touch tmp/restart.txt
	whenever --update-crontab --set environment='staging'
EOF
