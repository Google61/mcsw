# mcsw

Host Minecraft: Java Edition server via GitHub Workflows!

![screen](https://github.com/Google61/mcsw/raw/ngrok/screen.png)

## Hello world!
* **Use this template** or fork it
* Now choose your tunneling method:
<details><summary>playit.gg</summary>
1. <b>Note:</b> If you used ngrok before playit, remove <code>NGROKAUTHTOKEN</code> secret or set <code>method=playit</code> in <code>settings.cfg</code><br>
2. In <b>Actions</b> tab select <code>Minecraft Server</code> workflow, <b>Run workflow</b><br>
3. Go to <b>Actions</b> tab, choose running workflow, then <code>host</code> job, <code>Setup tunnel</code> step, click claim URL. This will redirect you to playit.gg panel<br>
4. Register/login<br>
5. ?<br>
6. ?<br>
7. ?<br>
8. ?<br>
9. Have fun!
</details>
<details><summary>ngrok</summary>
1. Register/login at https://dashboard.ngrok.com/login<br>
2. Copy your authtoken <i>(from step 2 on Setup page, or at Authentication, Your authtoken)</i><br>
3. Go to repo's <b>Settings</b>, <b>Secrets</b>, create <code>NGROKAUTHTOKEN</code> secret, paste your authtoken in value and save it<br>
4. In <b>Actions</b>, select <code>Minecraft Server</code> workflow and run it manually<br>
5. 2 ways to get your server's IP:<br>
  <s>5.1 At <b>ngrok dashboard</b>: go to <b>Status</b>, <b>Tunnels</b> - you'll see it under <code>URL</code> column</s> unavailable?<br>
  5.2 In <b>Actions</b> run: go to <b>Actions</b> tab, choose running workflow, then <code>host</code> job, <code>Setup tunnel</code> step<br>
6. Have fun!
</details>

## Fun facts

* After cancelling run, it will upload `server` artifact, archive with server world and properties. You can download it, edit jsons, add mods, whatever, then upload it back in repo as `server.zip` *(max file size upload from browser is 25mb, so I've excluded server.jar and fabric; you can upload large files with `git lfs` anyway)*
* Workflow will unpack `server.zip` and remove it from repository later, or download artifact from last run if zip is gone.  
* By default, it will download latest `vanilla` server. In `setup-auto-mc.cfg` you can set it to `fabric`, `forge`, `custom`, or `none`. *Note: for custom/modded server you will have to specify installer jar link*
* Job timeout - 6 hours
* Your repository must be **public** to have unlimited actions time, else it will have 2000 minutes (33.3hrs) limit in a month for free account.
