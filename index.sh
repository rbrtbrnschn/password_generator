#!/bin/bash

SEQ_LEN=5
MAX_CHAR=25
IS_CHOOSING=1
NEEDS_USE_CASE=1

while getopts "qsl:" OPTION; do
case $OPTION in
	q )
		NEEDS_USE_CASE=0
		;;
	s )
		SEQ_LEN=1
		;;
	l )
		MAX_CHAR=$OPTARG
		;;
	\? )
		echo "Correct Usage: ./index.sh [-s] [SINGLE] [-q] [NEEDS_USE_CASE] [-l] [MAX_CHAR]"
		exit 1
		;;
esac
done


PASSWORDS=$(./create.sh -x $SEQ_LEN -l $MAX_CHAR)
PASSWORDS_ARR=( $PASSWORDS )
# TODO Reassigning PASSWORDS to ( self )
# does not work

# No Need To Choose
if [ "${#PASSWORDS_ARR[@]}" == 1 ]
then
	IS_CHOOSING=0
fi

if [ "$IS_CHOOSING" == 0 ]
then
	SELECTED=$(./select.sh -a "${PASSWORDS[@]}" -i 0)
	./copy.sh $SELECTED
	if [ "$NEEDS_USE_CASE" == 1 ]
	then
		USE_CASE=$(./use_case.sh)
		./save.sh $SELECTED $USE_CASE
		./message.sh
		exit 0
	fi
	./save.sh $SELECTED
	./message.sh
	exit 0
fi
	
./display.sh "${PASSWORDS[@]}"
echo "----------------------------"
read -p "choosing #" INDEX
SELECTED=$(./select.sh -a "${PASSWORDS[@]}" -i $INDEX)

if [ "$NEEDS_USE_CASE" == 0 ]
then
	./copy.sh
	./save.sh $SELECTED
	./message.sh
else
	USE_CASE=$(./use_case.sh)
	./copy.sh $SELECTED
	./save.sh $SELECTED $USE_CASE
	./message.sh
fi
exit 0
