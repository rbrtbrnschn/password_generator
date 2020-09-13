#!/bin/bash
PASS=$1 || "<UNK>"
USE_CASE=$2 || "<UNK>"
TIME=$(date +%s%N)
PATH_TO_DB="database.csv"

if [ ! "$2" ]
then
	USE_CASE="<UNK>"
fi

while getopts "u:p:nd:" OPTION; do
case $OPTION in
	d )
		# Database Path
		PATH_TO_DB=$OPTARG
		;;
	u )
		# Use Case
		USE_CASE=$OPTARG
		;;
	p )
		# Pass
		PASS=$OPTARG
		;;
	n )
		# No Use Case
		USE_CASE="<UNK>"
		;;
	\? )
		echo "Correct Usage: ./save.sh [-u]"
		exit 1
		;;
esac
done

# Check If Database Exists
# And Save Or Append
if [ -f "$PATH_TO_DB" ]
then
	echo "$PASS, $USE_CASE, $TIME" >> $PATH_TO_DB
else
	echo "$PASS, $USE_CASE, $TIME" > $PATH_TO_DB
fi
