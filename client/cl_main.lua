Main = {
    AnimDict = 'anim@mp_snowball',
    AnimName = 'pickup_snowball'
}

RegisterKeyMapping("snowball","Take SnowBall !","keyboard","G")

RegisterCommand('snowball',function()
    Main:LoadanimDict(Main.AnimDict)
    TaskPlayAnim(PlayerPedId(),'anim@mp_snowball','pickup_snowball',8.0,-1,-1,0,1,0,0,0) 
    GiveWeaponToPed(PlayerPedId(),GetHashKey('weapon_snowball'),1)
    SetCurrentPedWeapon(PlayerPedId(),GetHashKey('weapon_snowball'),true)
end)

function Main:LoadanimDict(animDict) -- Load Anim
    local Anim = animDict
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
      Wait(0)
    end
end

CreateThread(function()
    while true do
        Wait(0)
        if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey('WEAPON_SNOWBALL') then
            SetPlayerWeaponDamageModifier(PlayerId(), 0.0)
        end
    end
end)