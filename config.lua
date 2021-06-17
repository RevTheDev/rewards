local type = {money=1,item=2,weapon=3} -- no touchey, thank you
Config = {}

Config.Command = false  -- Change command to true to switch to /daily
Config.EveryBody = false -- Change to false to stop using Daily Rewards for everyone
Config.random_rewards_enabled = true -- Set to False to Disable Random_Rewards
Config.rblip_enabled = true -- change to false to stop using Markers/blips
Config.AcePerms = true -- Set to true to use esx Perms E.G only superadmin can access it
Config.admin   = 'superadmin' -- Player.Group Only Access daily rewards for certain players

Config.rtime   = 43199  -- Seconds 24H:86399 12H:43199 6H:21399
Config.claimed = "~g~You claimed your daily reward"

Config.rewards = {
    {
        type = type.money,
        value = 1000
    },
    {
        type = type.item,
        item = "water",
        count = 3
    },
    {
        type = type.item,
        item = "water",
        count = 5
    },
    {
        type = type.weapon,
        weapon = "WEAPON_PISTOL", -- if they already have the weapon, they'll only get the ammo
        ammo = 10
    }
}

Config.random_rewards = {
    {
        chance = 45, -- this can be any whole number (higher = better chance)
        {
            type = type.money,
            value = 1000
        },
        {
            type = type.money,
            value = 2500
        },
        {
            type = type.money,
            value = 5000
        }
    },
    {
        chance = 35,
        {
            type = type.item,
            item = "bread",
            count = 5
        },
        {
            type = type.item,
            item = "water",
            count = 5
        }
    },
	{
        chance = 0, -- To enable Change this from 0 to any high number (higher = better chance)
        {
            type = type.weapon,
            weapon = "WEAPON_PISTOL", -- if they already have the weapon, they'll only get the ammo
            ammo = 100
        },
        {
            type = type.weapon,
            weapon = "WEAPON_PISTOL", -- if they already have the weapon, they'll only get the ammo
            ammo = 100
        }
    }
}

--Make sure these match
Config.rblip = {
    {id = 586, x = 210.947, y = -932.262, z = 30.691}, --Legion Square
    {id = 586, x = 1707.136, y = 3844.262, z = 34.929}
}
--These are the Markers Change the XYZ to match the Map blips
Config.mblip = { 
    {id = 29, x = 210.947, y = -932.262, z = 30.691}, --Legion Square
    {id = 29, x = 1707.136, y = 3844.262, z = 34.929}
}
