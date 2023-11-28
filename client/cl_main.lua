Main = {
    Wait = 2000,
    AnimDict = 'anim@mp_snowball',
    AnimName = 'pickup_snowball'
}

CreateThread(function()
    while true do 
        Wait(Main.Wait)
        if not IsPedInAnyVehicle(PlayerPedId(),true) and not IsPedUsingAnyScenario(PlayerId()) and not IsPedInCover(PlayerPedId()) and not IsPedSwimming(PlayerPedId()) and not IsPedFalling(PlayerPedId()) and not IsPedRunning(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) and not IsPedSprinting(PlayerPedId()) and GetInteriorFromEntity(PlayerPedId()) == 0 and not IsPlayerFreeAiming(PlayerPedId()) and not IsPedSwimmingUnderWater(PlayerPedId()) and not IsPedShooting(PlayerPedId(),0) then
            Main.Wait = 0
            if IsControlJustReleased(0,58) then
                Main:LoadanimDict(Main.AnimDict)
                TaskPlayAnim(PlayerPedId(),'anim@mp_snowball','pickup_snowball',8.0,-1,-1,0,1,0,0,0) 
                Main.Wait = 2000
                GiveWeaponToPed(PlayerPedId(),GetHashKey('weapon_snowball'),1)
                SetCurrentPedWeapon(PlayerPedId(),GetHashKey('weapon_snowball'),true)
            end
        else
            Main.Wait = 2000
        end
    end
end)

function Main:LoadanimDict(animDict) -- Load Anim
    local Anim = model
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
      Wait(0)
    end
end

