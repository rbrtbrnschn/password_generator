#!/bin/bash
if [ -f ".env" ]; then
	export $(cat .env | sed 's/#.*//g' | xargs)
fi
echo $(cat /usr/local/bin/password_generator/path_to_database)
