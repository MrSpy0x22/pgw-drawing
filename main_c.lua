CLevelArray = {}
CFractionsArray = {}
CLevelMax = nil
CLevelBase = nil
CFRankMax = nil

------------------------------------------------------------------------------------------------------------------------

local configurationAttempts = 0

------------------------------------------------------------------------------------------------------------------------

setTimer(function()
    Text3D.addOrUpdate("textXXXX", "Test\ntext", 410.927, -1718.329, 8.811, 50, 1, "default-bold", tocolor(255, 0, 255), 1, 20, 20)
    addOrUpdateText3D("textYYYY", "Test text", 415.927, -1718.329, 8.811, 50, 1, "default-bold", tocolor(255, 255, 0), 1, 20, 20)
end, 10000, 1)

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
