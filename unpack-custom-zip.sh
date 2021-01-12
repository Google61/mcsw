#!/bin/bash
mkdir -p server
cd server
if test -f ../server.zip
then
  echo "Unpacking custom zip..."
  unzip ../server.zip
else
  echo "Custom zip not found!"
  echo "Downloading latest save..."
  exit 1
fi
