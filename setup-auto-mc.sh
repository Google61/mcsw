#!/bin/bash
. ./settings.cfg
mkdir -p server
cd server
[[ -z "$versiontype" ]] && echo "no versiontype?" && exit 1
case $versiontype in
fabric)
  echo "Downloading Minecraft $mcversion Fabric..."
  [[ -z "$jarlink" ]] && echo "no fabric link?" && exit 1
  wget -q -O fabric-installer.jar $jarlink
  java -jar fabric-installer.jar server $([[ ! -z "$mcversion" ]] && echo "-mcversion $mcversion") -downloadMinecraft
  echo jar=fabric-server-launch.jar>>../settings.cfg
;;
forge)
  echo "Downloading Minecraft Forge..."
  [[ -z "$jarlink" ]] && echo "no forge link?" && exit 1
  wget -q -O forge-installer.jar $jarlink
  java -jar forge-installer.jar --installServer
  echo jar=$(find . -name "forge-*-universal.jar")>>../settings.cfg
;;
vanilla)
  version_manifest_url="https://launchermeta.mojang.com/mc/game/version_manifest.json"
  tmp="version_manifest.json"
  curl -Ss -o "$tmp" "$version_manifest_url"
  if [[ ! -z "$mcversion" ]]
  then
  latest_version=$mcversion
  else
  latest_version=$(jq .latest.release -r "$tmp")
  fi
  latest_manifest_url=$(cat "$tmp" | jq -r ".versions[] | select(contains({type: \"release\", id: \"$latest_version\"})) | .url")
  manifest="/tmp/manifest.$latest_version.json"
  curl -Ss -o "$manifest" "$latest_manifest_url"
  jar_url=$(jq -r ".downloads.server.url" "$manifest")
  echo "Downloading Minecraft $latest_version..."
  curl -Ss -o "server.jar" "$jar_url"
  echo jar=server.jar>>../settings.cfg
;;
custom)
  echo "Downloading custom Minecraft..."
  [[ -z "$jarlink" ]] && echo "no custom jar link?" && exit 1
  wget -q -O server.jar $jarlink
  echo jar=server.jar>>../settings.cfg
;;
none)
  echo "NOT downloading Minecraft"
  test -f server.jar || echo "server.jar not found" && exit 1
  echo jar=server.jar>>../setttings.cfg
;;
*)
  echo "Unknown Minecraft version type: $versiontype"
  echo "Usage: fabric forge vanilla custom none"
  exit 1
;;
esac
