#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  #Linux
  HOSTFILE="/etc/hosts"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  HOSTFILE="/private/etc/hosts"
else
  echo "Sorry not supported!"
  sleep 1
  exit
fi

HEADER="# Start Spotify Ad-Bypass"
FOOTER="# End Spotify Ad-Bypass"

if [ "$EUID" -ne 0 ]
then
  printf "requires root privileges!\nPlease run as root."
  sleep 1
  exit
fi


line_start=$(grep -n "$HEADER" "$HOSTFILE" | grep -Eo '^[^:]+')
if [ "$line_start" ]
then
  echo "[-] removing old script..."
  line_end=$(grep -n "$FOOTER" "$HOSTFILE" | grep -Eo '^[^:]+')
  sed -i.bak -e "${line_start},${line_end}d" "$HOSTFILE"
  sleep 1
else
  echo "Ad-Bypass is already removed"
  sleep 1
  exit
fi

echo "Done, Ad-Bypass is gone....!!"
exit
# Happy Hacking.......!!
# Raj Chowdhury
