# mcsw

Host Minecraft server via GitHub Workflows!

## Hello world!

* Hit `Use this template` *(assuming you're on desktop site)*
* In your brand new repo, edit **mc-auto-setup.cfg** for your needs
* Register/login into account at https://my.zerotire.com
* Create **public** network *(In IPv4 auto assign I use last option, for ease of use)*
* Go in repo **Settings** tab, then **Secrets**. Add a `ZEROTIERNETID` secret with value of your network ID
* Install ZeroTire One on your device and connect to network from previous step
* Go to your network and identify your device *(recommended to add name for your device)*
* In repo, go to Actions tab and select `Minecraft Server` workflow
* You should be able to run workflow manually, run it
* Wait until server generates world...
* Now go to your network again and find out server's IP *(if you've followed recommended step it will be like 192.168.196.xxx, just numbers after last dot will change)*
* In Minecraft add server with IP from previous step
* Voila!
![screen](https://github.com/Google61/mcsw/raw/main/screen.png)

## Fun facts

* After cancelling run, it will upload server artifact, it is an archive with server world and properties. You're able to download it, edit `ops.json`, add mods, whatever, and upload in main branch as `server.zip` (max file size upload from browser is 25mb, so I've excluded server.jar and fabric; you can upload large files with `git lfs` anyway)
* Workflow will unpack `server.zip`, or download artifact from last run if zip not present. So, after run you'll have to remove `server.zip`
* By default, it will download latest `vanilla` server. You can set it to `fabric`, `custom`, or `none`.
* Job limit - 6 hours, so every 6 hours you will have to run workflow again.
* Your repository has to be **public** to have unlimited actions time, else it will have 2000 minutes (33.3hrs) limit in a month for free account.
