CLevelArray = {}
CFractionsArray = {}
CLevelMax = nil
CLevelBase = nil
CFRankMax = nil

------------------------------------------------------------------------------------------------------------------------

local configurationAttempts = 0

------------------------------------------------------------------------------------------------------------------------

function delayedConfiguration()
    local resToCall = getResourceFromName("pgw-play")

    if resToCall and getResourceState(resToCall) == "running" then
        -- Lista frakcji (async!)
        call(resToCall, "getAvailableFractionsAsync", localPlayer, Events.client.serverSendsFractionDict)
        -- Słownik poziomów
        CLevelArray = call(resToCall, "getLevelArray")
        -- Maksymalny poziom
        CLevelMax = call(resToCall, "getLevelMax")
        -- Podstawa poziomu
        CLevelBase = call(resToCall, "getLevelBase")
        -- Mksymalna ranga we frakcji
        CFRankMax = call(resToCall, "getFRankMax")
    else
        configurationAttempts = configurationAttempts + 1

        if configurationAttempts >= 5 then
            outputDebugString("Opóźniona konfiguracja się nie udała!")
        end
    end
end

------------------------------------------------------------------------------------------------------------------------

addEventHandler("onClientResourceStart", resourceRoot, function(startedRes)
    if startedRes == getThisResource() then
        setTimer(delayedConfiguration, 250, 5)
    end
end)

------------------------------------------------------------------------------------------------------------------------

addEvent(Events.client.serverSendsFractionDict, true)
addEventHandler(Events.client.serverSendsFractionDict, localPlayer, function(dict)
    CFractionsArray = dict or {}
end)

------------------------------------------------------------------------------------------------------------------------
