#!/bin/bash
mkdir -p server
cd server
if test -f ../server.zip
then
  echo "Unpacking custom zip..."
  unzip ../server.zip
  echo "::set-output name=zip_unpacked::true"
else
  echo "server.zip is not present, skipping..."
  echo "::set-output name=zip_unpacked::false"
fi
