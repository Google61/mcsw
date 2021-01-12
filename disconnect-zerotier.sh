scriptpath="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
. $scriptpath/setup-zerotier.cfg
sudo zerotier-cli leave $zerotiernetid
