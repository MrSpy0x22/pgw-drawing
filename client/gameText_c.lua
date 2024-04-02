--addEvent(Events.client.serverAsksForGameText, true)

local screenW, screenH = guiGetScreenSize()

GameText = {}

-- Tabela z danymi stylów (do odtwarzania animacji)
GameText.texts = {}

-- Tabela z configuracją i zachowaniem każdego stylu
GameText.config = {
    -- GameTextTypeEnum.BIG_CENTER
    [1] = {
        defaultColor = function() return 255, 171, 112 end,
        renderFunction = function()
            local data = GameText.texts[GameTextTypeEnum.BIG_CENTER]

            if data then
                if data.isDone then
                    GameText.hide(GameTextTypeEnum.BIG_CENTER)
                else
                    GameText.texts[GameTextTypeEnum.BIG_CENTER] =  GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(2, cfg.text, screenW * 0.2719, screenH * 0.4278, screenW * 0.7281, screenH * 0.5917,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 3, 3, "pricedown", "center",
                            "center", false, false, true, true, false)
                    end)
                end
            end
        end,
    },
    -- GameTextTypeEnum.BIG_TOP
    [2] = {
        defaultColor = function() return 108, 184, 242 end,
        renderFunction = function()
            local data = GameText.texts[GameTextTypeEnum.BIG_TOP]

            if data then
                if data.isDone then
                    GameText.hide(GameTextTypeEnum.BIG_TOP)
                else
                    GameText.texts[GameTextTypeEnum.BIG_TOP] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(2, cfg.text, screenW * 0.2719, screenH * 0.1287, screenW * 0.7281, screenH * 0.2093,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 2, 2, "pricedown", "center",
                            "bottom", false, false, false, true, false)
                    end)
                end
            end
        end,
    },
    -- GameTextTypeEnum.STATUS
    [3] = {
        defaultColor = function() return 108, 184, 242 end,
        renderFunction = function()
            local data = GameText.texts[GameTextTypeEnum.STATUS]

            if data then
                if data.isDone then
                    GameText.hide(GameTextTypeEnum.STATUS)
                else
                    GameText.texts[GameTextTypeEnum.STATUS] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.2719, screenH * 0.6009, screenW * 0.7281, screenH * 0.6917,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 1.4, 1.4, "bankgothic", "center",
                            "center", false, true, false, true, false)
                    end)
                end
            end
        end,
    },
    -- GameTextTypeEnum.SCORES
    [4] = {
        defaultColor = function() return 141, 134, 92 end,
        renderFunction = function()
            local data = GameText.texts[GameTextTypeEnum.SCORES]

            if data then
                if data.isDone then
                    GameText.hide(GameTextTypeEnum.SCORES)
                else
                    GameText.texts[GameTextTypeEnum.SCORES] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.2719, screenH * 0.7009, screenW * 0.7281, screenH * 0.8028,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 1.2, 1.2, "pricedown", "center",
                            "bottom", false, false, false, true, false)
                    end)
                end
            end
        end,
    },
    -- GameTextTypeEnum.DIALOG
    [5] = {
        defaultColor = function() return 240, 240, 240 end,
        renderFunction = function()
            local data = GameText.texts[GameTextTypeEnum.DIALOG]

            if data then
                if data.isDone then
                    GameText.hide(GameTextTypeEnum.DIALOG)
                else
                    GameText.texts[GameTextTypeEnum.DIALOG] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.2719, screenH * 0.8139, screenW * 0.7281, screenH * 0.9157,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 2.0, 1.7, "sans", "center",
                            "top", false, true, false, true, false)
                    end)
                end
            end
        end,
    },
    -- GameTextTypeEnum.AREA_NAME
    [6] = {
        defaultColor = function() return 131, 134, 150 end,
        renderFunction = function()
            local data = GameText.texts[GameTextTypeEnum.AREA_NAME]

            if data then
                if data.isDone then
                    GameText.hide(GameTextTypeEnum.AREA_NAME)
                else
                    GameText.texts[GameTextTypeEnum.AREA_NAME] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.6240, screenH * 0.8028, screenW * 0.9891, screenH * 0.8722,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 2.5, 2.5, "beckett", "right",
                            "center", false, true, false, false, false)
                    end)
                end
            end
        end,
    },
    -- GameTextTypeEnum.VEH_NAME
    [7] = {
        defaultColor = function() return 52, 208, 88 end,
        renderFunction = function()
            local data = GameText.texts[GameTextTypeEnum.VEH_NAME]

            if data then
                if data.isDone then
                    GameText.hide(GameTextTypeEnum.VEH_NAME)
                else
                    GameText.texts[GameTextTypeEnum.VEH_NAME] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.6240, screenH * 0.7241, screenW * 0.9891, screenH * 0.7935,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 1.5, 1.5, "bankgothic", "right",
                            "center", false, true, false, false, false)
                    end)
                end
            end
        end,
    },
    -- GameTextTypeEnum.DAMAGES
    [8] = {
        defaultColor = function() return 240, 240, 240 end,
        renderFunction = function()
            local data = GameText.texts[GameTextTypeEnum.DAMAGES]

            if data then
                if data.isDone then
                    GameText.hide(GameTextTypeEnum.DAMAGES)
                else
                    GameText.texts[GameTextTypeEnum.DAMAGES] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.6542, screenH * 0.8815, screenW * 0.9891, screenH * 0.9157,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 1.1, 1.1, "sans", "right",
                            "center", false, true, false, false, false)
                    end)
                end
            end
        end,
    },
    -- GameTextTypeEnum.SHOUT
    [9] = {
        defaultColor = function() return 195, 61, 64 end,
        renderFunction = function()
            local data = GameText.texts[GameTextTypeEnum.SHOUT]

            if data then
                if data.isDone then
                    GameText.hide(GameTextTypeEnum.SHOUT)
                else
                    GameText.texts[GameTextTypeEnum.SHOUT] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.2719, screenH * 0.2185, screenW * 0.7281, screenH * 0.4185,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 3.0, 3.0, "default-bold", "center",
                            "top", false, true, true, true, false)
                    end)
                end
            end
        end,
    },
}

GameText.show = function(style, text, duration, r, g, b)
    if GameTextTypeEnum.isValid(style) then
        GameText.hide(style)

        -- Domyślna czas wyświetlania tekstu
        duration = duration or 3000
        -- Domyślny kolor jeżeli nie zdefiniowano
        if not r or not g or not b then
            r, g, b = GameText.config[style].defaultColor()
        end
    
        -- Rejestracja nowego tekstu do wyświetlenia
        GameText.texts[style] = {
            colorR = r,
            colorG = g,
            colorB = b,
            currentAlpha = 0,
            duration = duration,
            isShown = false,
            isDone = false,
            startTime = getTickCount(),
            stopTime = 0,
            text = text
        }
    
        return addEventHandler("onClientRender", root, GameText.config[style].renderFunction)
    end
    
    return nil
end

GameText.hide = function(style)
    if GameTextTypeEnum.isValid(style) then
        local attachedFunctions = getEventHandlers("onClientRender", root)
        if attachedFunctions then
            for _,v in ipairs(attachedFunctions) do
                if v == GameText.config[style].renderFunction then
                    removeEventHandler("onClientRender", root, GameText.config[style].renderFunction)
                    return true
                end
            end
        end
    end

    return false
end

GameText.processTextAnimation = function(config, func)
    local now = getTickCount()

    if not config.isDone then
        local fadeDuration = 1000

        if config.isShown then
            if config.startTime + config.duration < now then
                if config.stopTime == 0 then config.stopTime = getTickCount() end

                config.currentAlpha = interpolateBetween(255, 0, 0, 0, 0, 0, getProgress(config.stopTime, fadeDuration), "Linear")

                if config.currentAlpha <= 0 then
                    config.isDone = true
                end
            end
        else
            config.currentAlpha = interpolateBetween(config.currentAlpha, 0, 0, 255, 0, 0, getProgress(config.startTime, fadeDuration), "Linear")

            if config.currentAlpha >= 255 then
                config.isShown = true
            end
        end

        func(config)
    end

    return config
end

GameText.isAnimConfig = function(config)
    return config
       and config["currentAlpha"] ~= nil
       and config["duration"] ~= nil
       and config["isDone"] ~= nil
       and config["isShown"] ~= nil
       and config["startTime"] ~= nil
       and config["stopTime"] ~= nil
end

--[[ *** TESTOWANIE ***
currentStyle = 0
addCommandHandler("testgt", function(cmdName, style, ...)
    local numStyle = tonumber(style)
    if not GameTextTypeEnum.isValid(numStyle) then
        outputChatBox("Invalid style!", 255, 0, 0)
        return
    end

    local text = table.concat({...}, " ")
    if not text then
        outputChatBox("No text?!", 255, 0, 0)
        return
    end

    currentStyle = numStyle

    local result = GameText.show(numStyle, text, 3000) == true
    outputChatBox("GameText.show ==> ".. tostring(result))
end)]]