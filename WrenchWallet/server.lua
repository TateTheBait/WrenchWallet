RegisterNetEvent("WrenchWallet:Open", function(plrid, metadata)
    local identifier = metadata.walletid2
    print(identifier)
    if identifier then
        if exports.ox_inventory:GetInventory(tostring(identifier)) then
            exports.ox_inventory:forceOpenInventory(plrid, 'stash', tostring(identifier))
        end
    end
end)


RegisterNetEvent("WrenchWallet:RegisterWallet", function(plrid)
    local identifier = GetPlayerIdentifier(plrid, 1)
    local specid = tostring(math.random(1,1000000))
    local metadata = {walletid2 = (identifier .. specid), label = "Wallet", image = "wrenchwallet"}
    exports.ox_inventory:AddItem(plrid, "wrenchwallet", 1, metadata)
    if not exports.ox_inventory:GetInventory(tostring(identifier .. specid)) then
        local stash = {
            id = tostring(identifier .. specid),
            label = 'Wallet',
            slots = 5,
            weight = 2000,
            owner = false
        }
        exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, stash.owner)
    end
end)