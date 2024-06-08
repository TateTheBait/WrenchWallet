local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()


RegisterNetEvent("WrenchWallet:Open", function(plrid, metadata)
    local identifier = metadata.walletid2 -- DO NOT CHANGE
    if identifier then 
        if exports.ox_inventory:GetInventory(tostring(identifier)) then -- DO NOT CHANGE
            exports.ox_inventory:forceOpenInventory(plrid, 'stash', tostring(identifier)) -- DO NOT CHANGE
        end
    end
end)

AddEventHandler('ox:playerLoaded', function(source, userid, charid)
    while exports.ox_inventory:GetInventory(source) == nil do
        Wait(100)
    end
    local plrid = source
    local identifier = charid
    if exports.ox_inventory:GetItemCount(plrid, "wrenchwallet") == 0 then
        local specid = tostring(math.random(1,1000000))
        repeat
            specid = tostring(math.random(1,1000000))
        until not exports.ox_inventory:GetInventory(tostring(identifier .. specid))
        SetResourceKvp(tostring(identifier), tostring(identifier .. specid))
            
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
    else
        local savedhash = GetResourceKvpString(tostring(identifier))
        local metadata = {walletid2 = savedhash, label = "Wallet", image = "wrenchwallet"}
        print(savedhash)
        exports.ox_inventory:SetMetadata(plrid, exports.ox_inventory:GetSlotWithItem(plrid, "wrenchwallet"), metadata)
    end
end)




for _, plr in ipairs(GetPlayers()) do
    while exports.ox_inventory:GetInventory(plr) == nil do
        Wait(100)
    end
    local plrid = tonumber(plr)
    local identifier = Ox.GetPlayer(plr).charId
    if exports.ox_inventory:GetItemCount(plrid, "wrenchwallet") == 0 then
        local specid = tostring(math.random(1,1000000))
        repeat
            specid = tostring(math.random(1,1000000))
        until not exports.ox_inventory:GetInventory(tostring(identifier .. specid))
        SetResourceKvp(tostring(identifier), tostring(identifier .. specid))
        local metadata = {walletid2 = (identifier .. specid), label = "Wallet", image = "wrenchwallet"} -- DO NOT CHANGE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        local p, add = exports.ox_inventory:AddItem(plrid, "wrenchwallet", 1, metadata)
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
    else
        local savedhash = GetResourceKvpString(tostring(identifier))
        print(savedhash)
        local metadata = {walletid2 = savedhash, label = "Wallet", image = "wrenchwallet"}
        print(savedhash)
        exports.ox_inventory:SetMetadata(plrid, exports.ox_inventory:GetSlotWithItem(plrid, "wrenchwallet"), metadata)
    end
end
