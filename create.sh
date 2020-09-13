#!/bin/bash
SEQ_LEN=1
MAX_CHAR=25
PASSWORDS=()
COUNTER=0

while getopts "x:l:" OPTION; do
	case $OPTION in
		x )
			SEQ_LEN="$OPTARG"
			;;
		l )
			MAX_CHAR="$OPTARG"
			;;
		\? )
			echo "correct usage: create [-x] [SEQ_LEN] [-l] [MAX_CHAR]"
			exit 1
			;;
	esac
done
shift "$(($OPTIND -1))"

for VAR in $(seq 1 $SEQ_LEN)
do
	PASS=$(openssl rand -base64 48 | cut -c1-$MAX_CHAR)
	PASSWORDS[$COUNTER]="$PASS"
	COUNTER=$(($COUNTER +1))
done
echo "${PASSWORDS[@]}"
