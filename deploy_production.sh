#!/bin/bash
ssh SSH_ADDR << EOF
	cd DIR
	git checkout master
	git reset --hard origin/master
	git pull
	bundle install
	bundle --deployment
	rake RAILS_ENV=production db:migrate
	rake RAILS_ENV=production assets:precompile
	touch tmp/restart.txt
EOF
