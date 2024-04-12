AddEventHandler('ox_inventory:usedItem', function(name, slot, metadata)
    if name == "wrenchwallet" then
        TriggerServerEvent("WrenchWallet:Open", GetPlayerServerId(PlayerId()), metadata)
    end
end)

RegisterCommand("openwallet", function ()
    local id = GetPlayerServerId(PlayerId())
    TriggerServerEvent("WrenchWallet:Open", id)
end)

RegisterCommand("registerwallet", function ()
    local id = GetPlayerServerId(PlayerId())
    TriggerServerEvent("WrenchWallet:RegisterWallet", id)
end)