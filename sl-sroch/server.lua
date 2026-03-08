----ALL CREDITS TO SOL https://discord.gg/eB5Cnt8jAA
-- סנכרון רצועות בין שחקנים
local activeLanyards = {}

-- פונקציה לבדיקת תפקיד משטרה
local function IsPlayerPolice(playerId)
    if not Config.CheckPoliceJob then
        return true -- אם הבדיקה מבוטלת, כולם מורשים
    end

    -- ניסיון לזהות את סוג הפריימוורק
    local success, QBCore = pcall(function()
        return exports['qb-core']:GetCoreObject()
    end)
    
    if success and QBCore then
        -- QBCore Framework
        local Player = QBCore.Functions.GetPlayer(playerId)
        if Player then
            local job = Player.PlayerData.job.name
            for _, policeJob in ipairs(Config.PoliceJobs) do
                if job == policeJob then
                    return true
                end
            end
        end
    end
    
    -- אם לא נמצא פריימוורק או שחקן לא נמצא
    return false
end

RegisterNetEvent('sroch:attach')
AddEventHandler('sroch:attach', function()
    local playerId = source
    
    -- בדיקת הרשאה
    if not IsPlayerPolice(playerId) then
        return
    end
    
    activeLanyards[playerId] = true
    TriggerClientEvent('sroch:attach', -1, playerId)
end)

RegisterNetEvent('sroch:detach')
AddEventHandler('sroch:detach', function()
    local playerId = source
    activeLanyards[playerId] = nil
    TriggerClientEvent('sroch:detach', -1, playerId)
end)

AddEventHandler('playerDropped', function()
    local playerId = source
    if activeLanyards[playerId] then
        activeLanyards[playerId] = nil
        TriggerClientEvent('sroch:detach', -1, playerId)
    end
end)
