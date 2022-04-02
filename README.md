# mcsw

Host Minecraft: Java Edition server via GitHub Workflows!

![screen](https://github.com/Google61/mcsw/raw/ngrok/screen.png)

## Hello world!
* **Use this template** or fork it
* Now you must pick tunneling method:
<details><summary>ngrok</summary>
1. Register/login at https://dashboard.ngrok.com/login<br>
2. Copy your authtoken <i>(from step 2 on Setup page, or at Authentication, Your authtoken)</i><br>
3. Go to repo's <b>Settings</b>, <b>Secrets</b>, create <code>NGROKAUTHTOKEN</code> secret, paste your authtoken in value and save it<br>
4. In <b>Actions</b>, select <code>Minecraft Server</code> workflow and run it manually<br>
5. 2 ways to get your server's IP:<br>
  5.1 At <b>ngrok dashboard</b>: go to <b>Status</b>, <b>Tunnels</b> - you'll see it under <code>URL</code> column<br>
  5.2 In <b>Actions</b> run: go to <b>Actions</b> tab, choose running workflow. Click on <code>server</code> job - you'll find IP in <code>Show ngrok URL</code> step<br>
6. Have fun!
</details>
<details><summary>playit.gg</summary>
1. In <code>setup-tunnel.cfg</code> change <code>method=ngrok</code> to <code>method=playit</code><br>
2. In <b>Actions</b> tab select <code>Minecraft Server</code> workflow, <b>Run workflow</b><br>
3. Go inside running action, under <code>Setup playit</code> step you should click confirmation link. This will redirect you to playit.gg panel<br>
4. Login with Discord<br>
5. Press <b>Claim server</b><br>
6. At <b>Minecraft Java</b> press <b>Add tunnel</b><br>
7. Leave local IP as is, press <b>Add</b><br>
8. Now you got your server's global IP, it will be like *.auto.playit.gg<br>
9. Have fun!
</details>
<details><summary>ZeroTier</summary>
1. In <code>setup-tunnel.cfg</code> change <code>method=ngrok</code> to <code>method=zerotier</code><br>
2. Register/login into account at https://my.zerotier.com<br>
3. Create <b>public</b> network <i>(In IPv4 auto assign select last option)</i><br>
4. Go to repo's <b>Settings</b>, <b>Secrets</b>. Create <code>ZEROTIERNETID</code> secret, in value paste your ZeroTier network ID<br>
5. Install ZeroTier One on your device and connect<br>
6. Go to your network and identify your device <i>(recommended to add name)</i><br>
7. In repo, go to <b>Actions</b> tab and select <code>Minecraft Server</code> workflow, <b>Run workflow</b><br>
8. Now go to your network again and find out server's IP <i>(if you've selected last option in auto assign, IP will be like 192.168.196.*)</i><br>
9. Have fun!
</details>

## Fun facts

* After cancelling run, it will upload `server` artifact, archive with server world and properties. You can download it, edit jsons, add mods, whatever, then upload it back in repo as `server.zip` *(max file size upload from browser is 25mb, so I've excluded server.jar and fabric; you can upload large files with `git lfs` anyway)*
* Workflow will unpack `server.zip` and remove it from repository later, or download artifact from last run if zip is gone.  
* By default, it will download latest `vanilla` server. In `setup-auto-mc.cfg` you can set it to `fabric`, `forge`, `custom`, or `none`. *Note: for custom/modded server you will have to specify installer jar link*
* Job timeout - 6 hours
* Your repository must be **public** to have unlimited actions time, else it will have 2000 minutes (33.3hrs) limit in a month for free account.
