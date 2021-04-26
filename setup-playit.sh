wget -q https://playit.gg/downloads/playit-linux_64-0.3.12
chmod +x playit-linux_64-0.3.12
./playit-linux_64-0.3.12 2>url.log &
sleep 5s
echo "Click the link below!"
grep -io 'https://playit.gg/claim/v2/[a-z0-9]*' url.log
