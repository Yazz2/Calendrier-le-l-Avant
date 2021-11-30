
local voituregive = {}
    
function give_vehi(veh)
    TriggerEvent('esx:showAdvancedNotification', 'Boutique', '', 'Vous avez reçu votre :\n '..veh, img_notif, 3)
    local plyCoords = Config.SpawnVehicules
    
    Wait(10)
    ESX.Game.SpawnVehicle("blista", {x = plyCoords.x+2 ,y = plyCoords.y, z = plyCoords.z+2}, 90.11, function (vehicle)
        
            local plate = GeneratePlate()
            table.insert(voituregive, vehicle)		
            
            local vehicleProps = ESX.Game.GetVehicleProperties(voituregive[#voituregive])
            vehicleProps.plate = plate
            SetVehicleNumberPlateText(voituregive[#voituregive] , plate)
            TriggerServerEvent('shop:vehiculeboutique', vehicleProps, plate)
    end)
end


