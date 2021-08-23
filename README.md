# mcsw

Host Minecraft: Java Edition server via GitHub Workflows!

## Branches

`ngrok` (default) - implements tunneling over ngrok   
`playit` (alternative method) - implements playit tunneling, supports UDP protocol (used by Minecraft: Bedrock Edition and Geyser). If connecting over mobile network, hotspot has to be enabled.   
`zerotier` (old method) - implements ZeroTier, one of "lan-over-internet" solutions. Creates a local network among connected over client users


## Hello world!
* Hit **Use this template**, check **Include all branches** if you want to use `playit` or `zerotier`
* Register/login at https://dashboard.ngrok.com/login
* Copy your authtoken *(from step 2 on Setup page, or at Authentication, Your authtoken)*
* Go to repo's **Settings**, **Secrets**, create a `NGROKAUTHTOKEN` secret with value of your authtoken
* In **Actions**, select `Minecraft Server` workflow and run it manually
* Wait until server generate world (first run takes up to 1 minute)...
* 2 ways to know your server's IP:
  At **ngrok dashboard**: go to **Status**, **Tunnels** - you'll see it under `URL` column
  Inside **Actions** run: go to **Actions** tab, choose running workflow. Click on `server` job - you'll find IP in `Show ngrok URL` step
* In Minecraft add server with that IP
* Voila!
![screen](https://github.com/Google61/mcsw/raw/ngrok/screen.png)

## Fun facts

* After cancelling run, it will upload `server` artifact, archive with server world and properties. You can download it, edit jsons, add mods, whatever, then upload it back in repo as `server.zip` *(max file size upload from browser is 25mb, so I've excluded server.jar and fabric; you can upload large files with `git lfs` anyway)*
* Workflow will unpack `server.zip`, or download artifact from last run if zip not present. ~~So, after the "unpacking" run you'll have to remove `server.zip`~~ To simplify things a bit, now it'll automatically remove `server.zip` from repository!
* By default, it will download latest `vanilla` server. In `setup-auto-mc.cfg` you can set it to `fabric`, `forge`, `custom`, or `none`. *Note: for custom/modded server you will have to specify installer jar link*
* Job timeout - 6 hours, I can't do anything about that
* Your repository has to be **public** to have unlimited actions time, else it will have 2000 minutes (33.3hrs) limit in a month for free account.
