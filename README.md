# mcsw

Host Minecraft: Java Edition server via GitHub Workflows!

## Hello world!

* Hit `Use this template` *(assuming you're on desktop site)*
* Register/login into account at https://my.zerotire.com
* Create **public** network *(In IPv4 auto assign I use last option, for ease of use)*
* Go in repo's **Settings**, then **Secrets**. Add a `ZEROTIERNETID` secret with value of your ZeroTier network ID
* Install ZeroTier One on your device and connect
* Go to your network and identify your device *(recommended to add name)*
* In repo, go to **Actions** tab and select `Minecraft Server` workflow
* Run workflow manually
* Wait until server generates world (first run takes about 1 minute)...
* Now go to your network again and find out server's IP *(if you've followed recommended step it will be like 192.168.196.xxx, just last numbers will change)*
* In Minecraft add server with that IP
* Voila!
![screen](https://github.com/Google61/mcsw/raw/zerotier/screen.png)

## Fun facts

* After cancelling run, it will upload `server` artifact, archive with server world and properties. You can to download it, edit jsons, add mods, whatever, then upload it back in repo as `server.zip` *(max file size upload from browser is 25mb, so I've excluded server.jar and fabric; you can upload large files with `git lfs` anyway)*
* Workflow will unpack `server.zip`, or download artifact from last run if zip not present. So, after the "unpacking" run you'll have to remove `server.zip`
* By default, it will download latest `vanilla` server. In `setup-auto-mc.cfg` you can set it to `fabric`, `forge`, `custom`, or `none`. *Note: for custom/modded server you will have to specify installer jar link*
* Job limit - 6 hours, so every 6 hours you will have to run workflow again.
* Your repository has to be **public** to have unlimited actions time, else it will have 2000 minutes (33.3hrs) limit in a month for free account.

# Branches

`ngrok` (default) - implements ngrok tunneling, exposes server to a global IP    
`zerotier` (old method) - implements ZeroTier, one of "lan-over-internet" solutions. Creates a local network among connected over client users
