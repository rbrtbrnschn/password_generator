#!/bin/bash
#-------------------#
# Dependency: xclip
#-------------------#

TEXT="${!#}"
echo "$TEXT" | xclip -sel clip || clear && echo "password: ${TEXT}"
