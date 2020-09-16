#!/bin/bash
# Dependency List: xclip

sudo apt-get install xclip -y 

PWD=$(pwd)
sudo cp -avr "$PWD" "/usr/local/bin/password_generator"
sudo cp "$PWD/pass-gen" "/usr/local/bin/pass-gen"
sudo chmod a+rwx "/usr/local/bin"

echo "installation completed"
echo "Correct Usage: pass-gen [-s] [SINGLE] [-q] [QUICK] [-l] [LENGTH]"
