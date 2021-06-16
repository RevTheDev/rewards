# rewards
Daily rewards for FiveM  
Reward your players for playing on your server

ALL CREDIT GOES TO ORIGINAL CREATOR Elipse458
Original files: (https://github.com/Elipse458/el_daily_rewards/archive/master.zip)

## What's NEW???
Ability to change between /daily Command and Markers/Blips.
Cleaned files up adding folders.
Client.Lua Cleaned up.
Blip code Re-Written.
Marker code Re-Written.
Added option to config for both blips and markers for easier configuration.
Added option to config to change the timer countdown.
ESX Perms Added so that it can be restricted to a certain group of players Updated 15/2/20

## Configuration of Script
To turn off Markers/blips go into config and at the bottom set 
Config.rblip_enabled = true 
to 
Config.rblip_enabled = false

then to enable the /daily command go to the top of the config file and set 
Config.Command = false 
to 
Config.Command = true

To add more area to access the Rewards go to the bottom of the config and find 
Config.rblip = {
    {id = 586, x = -3.927, y = 4.825, z = 71.011}
}
You can add more locations by simply copying the first one and pasting it underneath like this
Config.rblip = {
    {id = 586, x = -3.927, y = 4.825, z = 71.011},
    {id = 586, x = -3.927, y = 4.825, z = 71.011}
}
this will allow you to access the rewards system from multiple places make sure to change the X Y Z
Changing the id changes the map blip you can choose from these [blipids](https://docs.fivem.net/docs/game-references/blips)

You can also change the marker on the ground if you navigate to client/client Line:58 it will look like this
DrawMarker(29, v.x, v.y, v.z-0.7, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.2001, 0, 0, 255, 100, 0, 0, 0, true)
you want to change the number right after it says DrawMarker, 29 is a Dollor sign floating/spinning you can choses more at this
[here](https://forum.cfx.re/t/resource-available-markers/99384). 

To change the markers Colour just edit the RGBA on the drawmarker E.G

DrawMarker(ID, v.x, v.y, v.z-0.7, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.2001, R, G,  B,   A,  0, 0, 0, true)

DrawMarker(29, v.x, v.y, v.z-0.7, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.2001, 0, 0, 255, 100, 0, 0, 0, true)

Just Change them so 0.0.255.100 is Solid Blue to have red with slightly Transparent just change it to 255.0.0.50

Any problems Feel free to create a issue
ENJOY 

## Installation
1. Download the [resource](https://github.com/RevTheDev/rewards.git)
2. Rename it to `rewards` and put it into your resources folder
3. Import sql.sql into your database
4. Edit the config to your liking
5. Add `start rewards` into your server.cfg **Make sure to add this after mysql-async and es_extended**
6. Start it and you're good to go

In the config make sure to set you ESX Perms it is default set to superadmin

## Documentation
Commands:
- /daily <- opens daily rewards menu
- Config has options to disable /daily and enable markers/blips <-- Enabled by defualt

## Errors? Read this first before complaining
If you're getting something like this:
```
SCRIPT ERROR: @es_extended/server/classes/player.lua:320: attempt to index a nil value (local 'item')
> ref (@es_extended/server/classes/player.lua:320)
> giveItem (@rewards/server.lua:57)
> claimRewards (@rewards/server.lua:71)
> ref (@rewards/server.lua:103)
> setImmediate (@mysql-async/mysql-async.js:14898)
```
that means that one or more items in your config don't exist in your database

## Important notes
This also silently stores how many times a player has redeemed their reward, i thought it could be useful. *(only in database)*  
If you rename the folder to something else than `rewards`, **it will break things**.  
To rename it successfully you'll have to do some additional stuff as well. First of all, make sure the new name is in lowercase.  
To do this, open `html/script.js` and replace every occurence of `rewards` with your new folder name, it should only be these lines
```
37 -> $.post('http://rewards/collect', JSON.stringify({ "t": new Date().getTime() }));
42 -> $.post('http://rewards/hidemenu', JSON.stringify({}));
```
After replacing it should look like this
```
37 -> $.post('http://<YOUR FOLDER NAME>/collect', JSON.stringify({ "t": new Date().getTime() }));
42 -> $.post('http://<YOUR FOLDER NAME>/hidemenu', JSON.stringify({}));
```
## Future updates 
1) Vehicle Rewards
2) Property Rewards
3) Config to easly set time---Done
4) Rewrite of Client.lua--- Done For now
5) Add multiple locations--- Done
6) Discord Perms 
7)ESX Perms--- Done
Much More

Please report any bugs or problems and i will do my best to help, The edits iv made arnt pretty but they work and dont cause any lag it has been test on my server and doesnt cause any time hitching as of yet.

ALL CREDIT GOES TO ORIGINAL CREATOR Elipse458
Original files: (https://github.com/Elipse458/el_daily_rewards/archive/master.zip)
