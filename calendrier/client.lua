ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

------------[pas enlevé!!]
print("^0======================================================================^7")
print("^3By Yazz'#7393 avec l'aide de Yamsoo#1111")
print("^0[Téléchargement^1] ^7:^0 ^5https://discord.gg/kjHbNDE469^7")
print("^0[Preview^1] ^7:^0 ^5https://www.youtube.com/watch?v=nr5p-efg6OY&t=360s^7")
print("^0[Discord Yamsoo^1] ^7:^0 ^5https://discord.gg/eSzkfnGNdy^7")
print("^0======================================================================^7")

-- MENU FUNCTION --


local open = false 
local mainMenu6 = RageUI.CreateMenu(nil, "Intéraction Disponibles", 0, 0, "casinoui_card_blackjack", "casinoui_card_blackjack")
local ActionMenu = RageUI.CreateSubMenu(mainMenu6, nil, 'Intéraction Disponibles')

mainMenu6.Display.Header = true 
mainMenu6.Closed = function()
  open = true
  FreezeEntityPosition(PlayerPedId(), false)
end



local function checkLicense()
  ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
      verifjour = hasWeaponLicense
  end, GetPlayerServerId(PlayerId()), 'jour'..Config.jour)
end


cooldown = false
checkLicense()

function OpenMenuCalendrier()
     if open then 
         open = false
         RageUI.Visible(mainMenu6, false)
         return
     else
         open = true 
         RageUI.Visible(mainMenu6, true)
         
         CreateThread(function()
         while open do 
            RageUI.IsVisible(mainMenu6,function() 


                
              RageUI.Button('Action', nil, {RightLabel = "→→"}, true, {
              
                },ActionMenu)
                
                RageUI.Separator("→ ~b~Calendrier de l'avant~s~ →")

                RageUI.Button("Prendre la récompense du jour "..Config.jour, nil, { RightLabel = "→→"}, verifjour == false, {
                  onSelected = function()
                    TriggerServerEvent("Calendrier:jour", "jour"..Config.jour)
                    verifjour = true
                
                    PlaySoundFrontend( -1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
                    Wait(850)
                    --ESX.ShowNotification("~b~~h~Calendrier~h~~s~ \nVous avez reçus votre récompense du jour !")
                    ESX.ShowAdvancedNotification("Calendrier","~b~Père Noël~s~", "Vous avez reçus votre récompense du jour !", "CHAR_CALENDRIER", 1)
                    if Config.jour == 25 then
                      give_vehi("blista")
                      ESX.ShowAdvancedNotification("Calendrier","~b~Père Noël~s~", "Tu as reçu uen blista elle a apparue derrière de toi, Bon noël !!", "CHAR_CALENDRIER", 1)

                          
                    end 

                  end
                })

                
            
            end)
            
            RageUI.IsVisible(ActionMenu,function() 
              RageUI.Button("Ramasser une boule de neige", nil, { RightLabel = "→→"}, cooldown == false , {
                onSelected = function()
                  cooldown = true
                  BoulesdeNeige()
                end
              })

            end)

      
              
                
            
          Wait(0)
         end
      end)
   end
end




function BoulesdeNeige()

  RequestAnimDict('anim@mp_snowball')
  TaskPlayAnim(PlayerPedId(), 'anim@mp_snowball', 'pickup_snowball', 8.0, -1, -1, 0, 0, 0, 0, 0)
  FreezeEntityPosition(PlayerPedId(), true)
  Citizen.Wait(2000)
  FreezeEntityPosition(PlayerPedId(), false)
  ESX.ShowAdvancedNotification("Calendrier","~b~Père Noël~s~", "Vous avez ramsser une ~b~x3~s~ de neige", "CHAR_CALENDRIER", 1)

  GiveWeaponToPed(PlayerPedId(), GetHashKey('WEAPON_SNOWBALL'), 3, false, true)
end



local position = {
	{x = 185.78, y = -958.56, z = 30.09}
}

Citizen.CreateThread(function()
    while true do

      local wait = 750

        for k in pairs(position) do
        if ESX.PlayerData  then 
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
              if dist <= 2.0 then
               wait = 1
               DrawMarker(2, 185.78, -958.56, 30.09, 0, 0, 0, 0, 0, 0, 0.3, 0.3, 0.3, 255, 255, 255, 255, 1, 0, 0, 2)
                ESX.ShowHelpNotification("Appuyer sur~b~ ~INPUT_PICKUP~ pour ouvrir le calendrier de l'avant") 
                if IsControlJustPressed(1,51) then
                  OpenMenuCalendrier()
            end
        end
      end
    Citizen.Wait(wait)
    end
  end
end)


-----------------[Blips]
Citizen.CreateThread(function() -------------[Calendrier]
  if Config.blip then
      for k, v in pairs(position) do
          local blip = AddBlipForCoord(v.x, v.y, v.z)

          SetBlipSprite(blip, Config.Id)
          SetBlipScale (blip, Config.Taille)
          SetBlipColour(blip, Config.Couleur)
          SetBlipAsShortRange(blip, Config.Range)

          BeginTextCommandSetBlipName('STRING')
          AddTextComponentSubstringPlayerName('Calendrier de l\'avant')
          EndTextCommandSetBlipName(blip)
      end
  end
end)



