. ./settings.cfg
[[ -z "$method" ]] && [[ -z "$ngrokauthtoken" ]] || method=ngrok
[[ -z "$method" ]] && method=playit
case $method in
ngrok)
[[ -z "$ngrokauthtoken" ]] && echo "no authtoken?" && exit 1
wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
chmod +x ngrok
./ngrok authtoken $ngrokauthtoken
./ngrok tcp --region=$ngrokregion 25565 &
sleep 2s
url=$(curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url)
echo "ngrok URL: $url"
echo "IPv4: $(dig +short $url)"
echo "Port: $(echo $url | grep -o -E '[^:]+$')"
;;
playit)
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | sudo apt-key add -
sudo curl -SsL -o /etc/apt/sources.list.d/playit-cloud.list https://playit-cloud.github.io/ppa/playit-cloud.list
sudo apt update
sudo apt install playit
playit -s > url.log &
sleep 2s
url=$(grep -io 'https://playit.gg/claim/[a-z0-9]*' url.log)
echo "Claim URL: $url"
;;
*)
echo "Unknown tunneling method: $method"
exit 1
;;
esac
