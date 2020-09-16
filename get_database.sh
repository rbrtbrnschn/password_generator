#!/bin/bash

if [ -f ".env" ]; then
	export $(cat .env | sed 's/#.*//g' | xargs)
fi
echo "$PATH_TO_DATABASE"
