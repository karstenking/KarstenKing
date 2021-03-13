-- Discord Rich Presence script by Ramlov
-- Buttons tilføjet af KarstenKing

local DiscordAppId = tonumber(GetConvar("RichAppId", "")) -- Sæt dit client id ind her
local DiscordAppAsset = GetConvar("RichAssetId", "logo") -- Husk at kald den logo


local UpdateTime = 1500 -- Set update time (delay between each update) here (ms).

Citizen.CreateThread(function()
	while true do
		local playerName = GetPlayerName(PlayerId())
		local onlinePlayers = 0
		
		for i = 0, 255 do
			if NetworkIsPlayerActive(i) then
				onlinePlayers = onlinePlayers+1
			end
		end
	
		SetDiscordAppId(DiscordAppId)
		
		SetDiscordRichPresenceAsset(DiscordAppAsset)
		
		SetDiscordRichPresenceAction(0, "Join KarstenKings Butik", "https://discord.gg/HFfeKSbwGx") -- Her kan du sætte dine knapper ind
                SetDiscordRichPresenceAction(1, "Join her fyr", "https://discord.gg/HFfeKSbwGx") 

		SetDiscordRichPresenceAssetText(playerName)
		
		SetDiscordRichPresenceAssetSmall(DiscordAppAssetSmall)
		
		SetDiscordRichPresenceAssetSmallText("FiveM")

		SetRichPresence("Online: "..onlinePlayers.."/48") -- Husk at sætte de slots ind du har på din server
		
		Citizen.Wait(UpdateTime)
	end
end)
