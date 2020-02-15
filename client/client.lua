--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
local notify = false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
end)

--================================================================================================
--==   vvvvvvvvvvvvvvvvvvvvvvvvvvv  EVENTS - DO NOT EDIT  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv     ==
--================================================================================================
AddEventHandler('esx:playerLoaded', function(xPlayer)
	TriggerServerEvent("free:updateTimeout")
end)

RegisterNetEvent("free:toggleFreeMenu")
AddEventHandler("free:toggleFreeMenu", function(state)
	SetNuiFocus(state, state)
	SendNUIMessage({type = "toggleshow", enable = state})
end)

RegisterNetEvent("free:setTimeout")
AddEventHandler("free:setTimeout", function(t)
	SendNUIMessage({type = "settimeout", timeout = tonumber(t * 1000)})
end)

RegisterNetEvent("free:giveWpn")
AddEventHandler("free:giveWpn", function(wpn,ammo)
	local ped = GetPlayerPed(-1)
	wpn = GetHashKey(wpn)
	if HasPedGotWeapon(ped, wpn, false) then AddAmmoToPed(ped, wpn, ammo) else GiveWeaponToPed(ped, wpn, ammo, false, false) end
end)

RegisterNUICallback("hidemenu", function(data, cb)
	TriggerEvent("free:toggleFreeMenu", false)
end)

RegisterNUICallback("collect", function(data, cb)
	TriggerServerEvent("free:collect", data.t)
end)

Citizen.CreateThread(function()
	TriggerServerEvent("free:updateTimeout")
	while true do
		Citizen.Wait(600000)
		TriggerServerEvent("free:updateTimeout") -- update timeout every 10 minutes because why not
	end
end)

if Config.Command then
TriggerEvent('chat:addSuggestion', '/daily', 'Open daily rewards menu',{})
end

--================================================================================================
--==    ^^^^^^^^^^^^^^^^^^^^^^^^^^  EVENTS - DO NOT EDIT   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^       ==
--================================================================================================

--===============================================
--==             Open Reward ui                ==
--===============================================

Citizen.CreateThread(function(source, args, user)
if Config.EveryBody then
	  while true do
		  Wait(0)
		  
		  if nearREW()then
			ShowNotification(('Press ~r~E ~w~to check Daily Rewards'))
			notify = true

		 if IsControlJustPressed(1, 51) then

            TriggerEvent("free:toggleFreeMenu", source, true)
			end
		end
		
		if IsControlJustPressed(1, 322) then
		inMenu = false
			SetNuiFocus(false, false)
			SendNUIMessage({type = 'close'})
		end
	  end
	end
  end)

--===============================================
--==             Map Blips	                   ==
--===============================================

Citizen.CreateThread(function()
	if Config.rblip_enabled then
	  for k,v in ipairs(Config.rblip)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite (blip, v.id)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 1.0)
		SetBlipColour (blip, 38)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(('Daily Rewards'))
		EndTextCommandSetBlipName(blip)
	  end
	end
end)

Citizen.CreateThread(function()
if Config.rblip_enabled then
	while true do
     Citizen.Wait(0)
	 for k,v in ipairs(Config.mblip)do
     	 local distance =  GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),v.x, v.y, v.z,true)
	  if distance <= 25 then
         DrawMarker(v.id, v.x, v.y, v.z-0.7, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.2001, 0, 0, 255, 100, 0, 0, 0, true)
	 end
	end
   end
 end
end)

--===============================================
--==        Distance From Reward blip          ==
--===============================================

function nearREW()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)

	for _, search in pairs(Config.rblip) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
        
		if distance <= 2 then
			return true

		end
	end
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

--=====================================================
--======         ESXPerms Perms                  ======
--=====================================================

Citizen.CreateThread(function(source, args, user)
if Config.AcePerms then
	  while true do
		  Wait(0)
		  
		  if nearREW()then
			ShowNotification(('Press ~r~E ~w~to check Daily Rewards'))
			notify = true

		 if IsControlJustPressed(1, 51) then
		    ESX.TriggerServerCallback('Rewards:Admin_getUsergroup', function(plyGroup)
			if plyGroup ~= nil and (plyGroup == Config.admin) then

            TriggerEvent("free:toggleFreeMenu", source, true)
		else
			 --exports['mythic_notify']:SendAlert('error', "You dont have the Permission to use this!!") -- Disable as not every has mythic notify
             exports.pNotify:SendNotification({text = "You dont have the Permission to use this!!"})
			end
		end)
	end
end
		
		if IsControlJustPressed(1, 322) then
		inMenu = false
			SetNuiFocus(false, false)
			SendNUIMessage({type = 'close'})
		end
	  end
	end
  end)

--Ignore this part Below
--Ignore this part Below
--=====================================================
--======         Discord Perms                   ======
--=====================================================


--=====================================================
--======            Notifications                ======
--=====================================================
RegisterNetEvent("free:NoDiscordPerms")
AddEventHandler("free:NoDiscordPerms", function()
    --exports['mythic_notify']:SendAlert('error', "Discord must be open") -- Disable as not every has mythic notify
	ShowNotification(('Discord must be open'))
	notify = true
end)

RegisterNetEvent("free:NoDiscordRole")
AddEventHandler("free:NoDiscordRole", function()
    --exports['mythic_notify']:SendAlert('error', "You dont have the correct discord role")-- Disable as not every has mythic notify
	ShowNotification(('You dont have the correct discord role'))
	notify = true
end)
--Ignore this part Above
--Ignore this part Above
