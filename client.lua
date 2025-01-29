Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if DoesEntityExist(vehicle) then
            local roll = GetEntityRoll(vehicle)

            -- If the vehicle is upside down or almost upside down, this will disable your ability to tilt the car back over
            if math.abs(roll) > 75 then
                -- Disable A/D and W/S controls to prevent flipping it back over
                DisableControlAction(0, 59, true) -- Disable A/D vehicle control this should be disabled in air not on ground :D  
                DisableControlAction(0, 60, true) -- Disable W/S to tilt the car forward or backward :)
            end

            -- Disable all air control when the vehicle is off the ground
            if not IsVehicleOnAllWheels(vehicle) then
                DisableControlAction(0, 59, true) -- Disable A/D vehicle control
                DisableControlAction(0, 60, true) -- Disable W/S
            end
        end
    end
end)
