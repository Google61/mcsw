wget -q https://playit.gg/downloads/playit-linux_64-0.2.0-beta-rc-3
chmod +x playit-linux_64-0.2.0-beta-rc-3
./playit-linux_64-0.2.0-beta-rc-3 2>url.log &
sleep 5s
echo "Click the link below!"
grep -io 'https://playit.gg/claim/v2/[a-z0-9]*' url.log
