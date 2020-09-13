#!/bin/bash
ARRAY=()
INDEX=0

while getopts "a:i:" OPTION; do
	case $OPTION in
		a )
			ARRAY=( $OPTARG )
			;;
		i )
			INDEX=$OPTARG
			;;
		\? )
			echo "Correct Usage: select [-a] [PASSWORD_ARRAY] [-i] [SELECTED_INDEX]"
			;;
	esac
done

echo "${ARRAY[$INDEX]}"
