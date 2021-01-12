#!/bin/bash
scriptpath="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
. $scriptpath/setup-auto-mc.cfg
mkdir -p server
cd server
if [[ "$versiontype" == "fabric" ]]
then
  echo "Downloading Fabric..."
  wget -O fabric-installer.jar $fabriclink
  java -jar fabric-installer.jar server -downloadMinecraft
elif [[ "$versiontype" == "vanilla" ]]
then
  version_manifest_url="https://launchermeta.mojang.com/mc/game/version_manifest.json"
  tmp="version_manifest.json"
  latest_version=$(curl -Ss -o "$tmp" "$version_manifest_url" && jq .latest.release -r "$tmp")
  latest_manifest_url=$(cat "$tmp" | jq -r ".versions[] | select(contains({type: \"release\", id: \"$latest_version\"})) | .url")
  manifest="/tmp/manifest.$latest_version.json"
  curl -Ss -o "$manifest" "$latest_manifest_url"
  jar_url=$(jq -r ".downloads.server.url" "$manifest")
  echo "Downloading Minecraft $latest_version..."
  curl -Ss -o "server.jar" "$jar_url"
elif [[ "$versiontype" == "none" ]]
then
  exit
else
  echo "Unknown Minecraft version type: $versiontype"
  echo "Possible values: fabric vanilla none"
  exit 1
fi
