scriptpath="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
. $scriptpath/setup-zerotier.cfg
curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join $zerotiernetid
