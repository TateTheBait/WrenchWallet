RegisterNetEvent("WrenchWallet:Open", function(plrid, metadata)
    local identifier = metadata.walletid2 -- DO NOT CHANGE
    if identifier then 
        if exports.ox_inventory:GetInventory(tostring(identifier)) then -- DO NOT CHANGE
            exports.ox_inventory:forceOpenInventory(plrid, 'stash', tostring(identifier)) -- DO NOT CHANGE
        end
    end
end)


RegisterNetEvent("WrenchWallet:RegisterWallet", function(plrid)
    if exports.ox_inventory:GetItemCount(plrid, "wrenchwallet") == 0 then
            
        repeat
            local identifier = GetPlayerIdentifier(plrid, 1)
            local specid = tostring(math.random(1,1000000))
        until not exports.ox_inventory:GetInventory(tostring(identifier .. specid))
            
        local metadata = {walletid2 = (identifier .. specid), label = "Wallet", image = "wrenchwallet"} -- DO NOT CHANGE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        exports.ox_inventory:AddItem(plrid, "wrenchwallet", 1, metadata)
        if not exports.ox_inventory:GetInventory(tostring(identifier .. specid)) then
            local stash = {
                id = tostring(identifier .. specid), -- DO NOT CHANGE
                label = 'Wallet',
                slots = 5,
                weight = 2000,
                owner = false
            }
            exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, stash.owner) -- DO NOT CHANGE
        end
    end
end)
