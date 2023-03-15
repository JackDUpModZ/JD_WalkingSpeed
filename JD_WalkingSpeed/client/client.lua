local active = false    -- Don't touch it
local walkingSpeed = 1.0    -- Default Speed
local minSpeed = 0.7    -- Min Speed
local maxSpeed = 1.5    -- Max Speed

CreateThread(function()
    while true do
        Wait(0)
        if active then
            SetPedMoveRateOverride(PlayerPedId(),walkingSpeed)   -- need to execute every tick
        end
    end
end)

RegisterCommand('walkingspeed', function()
    if active then
        active = false 
    else
        active = true
    end
end, false)

RegisterCommand('+increasewalkingspeed', function()
    if active then
        originalSpeed = walkingSpeed
        if originalSpeed <= maxSpeed then
            walkingSpeed = originalSpeed + 0.1
            print(walkingSpeed)
        end
    end
end, false)
RegisterCommand('-decreasewalkingspeed', function()
    if active then
        originalSpeed = walkingSpeed
        if originalSpeed >= minSpeed then
            walkingSpeed = originalSpeed - 0.1
            print(walkingSpeed)
        end
    end
end, false)
RegisterKeyMapping('+increasewalkingspeed', 'Increase Walking Speed', 'MOUSE_WHEEL', 'IOM_WHEEL_UP')
RegisterKeyMapping('-decreasewalkingspeed', 'Lower Walking Speed', 'MOUSE_WHEEL', 'IOM_WHEEL_DOWN')