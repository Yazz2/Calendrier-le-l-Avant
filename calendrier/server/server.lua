ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterNetEvent('Calendrier:jour')
AddEventHandler('Calendrier:jour', function()
    local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)

        MySQL.Async.execute('INSERT INTO user_licenses ( type, owner) VALUES (@type, @owner)', {
            ['@type'] = "jour"..Config.jour,
            ['@owner'] = xPlayer.identifier
        })

        if Config.jour then 
            if Config.jour == 1 then 
                    xPlayer.addInventoryItem('glacev', 1)
            

              elseif Config.jour == 2 then
                xPlayer.addInventoryItem('water', 1)
            
              elseif Config.jour == 3 then     
                xPlayer.addAccountMoney('bank', 1000)
                Wait(1000)
                TriggerClientEvent('esx:showAdvancedNotification', _src, 'Banque', '~b~Banquier', "Vous venez d'avoir ~g~1000$ ~s~dans votre banque.", 'CHAR_BANK_MAZE', 1)

                elseif Config.jour == 4 then
                xPlayer.addInventoryItem("vodka", 1)
                xPlayer.addInventoryItem("beer", 1)

            elseif Config.jour == 5 then
             
                xPlayer.addInventoryItem("bread", 1)
                
            elseif Config.jour == 6 then

                xPlayer.addInventoryItem("hamburger", 1)

            elseif Config.jour == 7 then
                xPlayer.addInventoryItem("glaces", 1)

            elseif Config.jour == 8 then
                xPlayer.addInventoryItem("glaceci", 1)

            elseif Config.jour == 9 then
                xPlayer.addMoney(1500)
                Wait(1000)
                TriggerClientEvent('esx:showAdvancedNotification', _src, 'Banque', '~b~Banquier', "Vous venez de recevoir ~g~1000$~s~.", 'CHAR_BANK_MAZE', 1)
            elseif Config.jour == 10 then
                Wait(1000)
                TriggerClientEvent('esx:showNotification', _src, '~b~~h~Calendrier~h~~s~ \nVous venez de gagner un code promo a l\'épicerie : LTD10', 'CHAR_BANK_MAZE', 1)

            elseif Config.jour == 11 then
                Wait(1000)
                xPlayer.addMoney(10000)
                TriggerClientEvent('esx:showAdvancedNotification', _src, 'Banque', '~b~Banquier', "C'est le gros lots !!! Vous venez de recevoir ~g~10000$~s~.", 'CHAR_BANK_MAZE', 1)

            elseif Config.jour == 12 then
                --mettez se que vous voulais regarder dans le readme pour savoir les commandes
            elseif Config.jour == 13 then
                --mettez se que vous voulais regarder dans le readme pour savoir les commandes
            elseif Config.jour == 14 then
                --mettez se que vous voulais regarder dans le readme pour savoir les commandes
            elseif Config.jour == 15 then
                --mettez se que vous voulais regarder dans le readme pour savoir les commandes
            elseif Config.jour == 16 then
                --mettez se que vous voulais regarder dans le readme pour savoir les commandes
            elseif Config.jour == 17 then
                --mettez se que vous voulais regarder dans le readme pour savoir les commandes
            elseif Config.jour == 18 then
                --mettez se que vous voulais regarder dans le readme pour savoir les commandes
            elseif Config.jour == 19 then
                --mettez se que vous voulais regarder dans le readme pour savoir les commandes
            elseif Config.jour == 20 then
                --mettez se que vous voulais regarder dans le readme pour savoir les commandes

            elseif Config.jour == 21 then
                --mettez se que vous voulais regarder dans le readme pour savoir les commandes
            elseif Config.jour == 22 then
                --mettez se que vous voulais regarder dans le readme pour savoir les commandes
            elseif Config.jour == 23 then
                --mettez se que vous voulais regarder dans le readme pour savoir les commandes
            elseif Config.jour == 24 then
                Wait(1000)
                xPlayer.addMoney(10000)
                TriggerClientEvent('esx:showAdvancedNotification', _src, 'Banque', '~b~Banquier', "C'est le gros lots !!! Vous venez de recevoir ~g~100000$~s~ et un bisou.", 'CHAR_BANK_MAZE', 1)
            elseif Config.jour == 25 then
                TriggerClientEvent('esx:showNotification', "~b~~h~Staff~h~~s~ \nBon Noël à vous !!!")
                
                

            end
            
        end

        
end)


local cars 		  = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_givecarkeys:requestPlayerCars', function(source, cb, plate)

	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll(
		'SELECT * FROM owned_vehicles WHERE owner = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
		function(result)

			local found = false

			for i=1, #result, 1 do

				local vehicleProps = json.decode(result[i].vehicle)

				if trim(vehicleProps.plate) == trim(plate) then
					found = true
					break
				end

			end

			if found then
				cb(true)
			else
				cb(false)
			end

		end
	)
end)

