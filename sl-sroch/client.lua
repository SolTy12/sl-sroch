----ALL CREDITS TO SOL https://discord.gg/eB5Cnt8jAA
local currentWeapon = `WEAPON_UNARMED`
local playerLanyards = {}
local isLanyardActive = false

-- בדיקה אם כלי הנשק נתמך
local function IsWeaponSupported(weaponHash)
    for _, supportedWeapon in ipairs(Config.EnabledWeapons) do
        if weaponHash == supportedWeapon then
            return true
        end
    end
    return false
end

-- לולאה ראשית לניטור החלפת נשק
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)

        if currentWeapon ~= weapon then
            -- הסרת רצועה קיימת
            if isLanyardActive then
                TriggerServerEvent('sroch:detach')
                isLanyardActive = false
            end

            -- יצירת רצועה חדשה אם הנשק נתמך
            if IsWeaponSupported(weapon) then
                TriggerServerEvent('sroch:attach')
                isLanyardActive = true
            end

            currentWeapon = weapon
        end

        Wait(100)
    end
end)

-- יצירת רצועה לשחקן
RegisterNetEvent('sroch:attach')
AddEventHandler('sroch:attach', function(playerId)
    RopeLoadTextures()
    Wait(250)

    local targetPed = GetPlayerPed(GetPlayerFromServerId(playerId))
    local weaponEntity = GetCurrentPedWeaponEntityIndex(targetPed)
    
    if not DoesEntityExist(weaponEntity) then
        return
    end

    local pedCoords = GetEntityCoords(targetPed)
    local pelvisBone = GetEntityBoneIndexByName(targetPed, 'SKEL_Pelvis')
    local pelvisCoords = GetPedBoneCoords(targetPed, pelvisBone, vector3(0, 0, 0))
    local relativeCoords = pelvisCoords - pedCoords

    -- בחירת עצם הנשק
    local weaponBone = 'gun_gripr'
    if Config.WeaponBones[weaponEntity] then
        weaponBone = Config.WeaponBones[weaponEntity]
    end

    -- יצירת החבל
    local rope = AddRope(
        pedCoords.x, pedCoords.y, pedCoords.z,
        0.0, 0.0, 0.0,
        0.1, 5, 4.0, 0.001, 1.0,
        true, false, true, 1.0, false
    )

    AttachEntitiesToRope(
        rope, targetPed, weaponEntity,
        relativeCoords.x, relativeCoords.y, relativeCoords.z,
        0.0, 0.0, 0.0,
        3.0, false, false,
        'SKEL_Pelvis', weaponBone
    )

    playerLanyards[playerId] = rope
end)

-- הסרת רצועה משחקן
RegisterNetEvent('sroch:detach')
AddEventHandler('sroch:detach', function(playerId)
    if playerLanyards[playerId] then
        DeleteRope(playerLanyards[playerId])
        playerLanyards[playerId] = nil
    end
end)
