local screenW, screenH = guiGetScreenSize()
currentStyle = 0

GameText = {}

-- Style tekstów
GameText.BIG_CENTER = 1
GameText.BIG_TOP = 2
GameText.STATUS = 3
GameText.SCORES = 4
GameText.DIALOG = 5
GameText.AREA_NAME = 6
GameText.VEH_NAME = 7
GameText.DAMAGES = 8
GameText.SHOUT = 9

-- Tabela z danymi stylów (do odtwarzania animacji)
GameText.texts = {}

-- Tabela z configuracją i zachowaniem każdego stylu
GameText.config = {
    -- GameText.BIG_CENTER
    [1] = {
        defaultColor = function() return 255, 171, 112 end,
        renderFunction = function()
            local data = GameText.texts[GameText.BIG_CENTER]

            if data then
                if data.isDone then
                    removeEventHandler("onClientRender", root, GameText.config[GameText.BIG_CENTER].renderFunction)
                else
                    GameText.texts[GameText.BIG_CENTER] =  GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(2, cfg.text, screenW * 0.2719, screenH * 0.4278, screenW * 0.7281, screenH * 0.5917,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 3, 3, "pricedown", "center",
                            "center", false, false, true, true, false)
                    end)
                end
            end
        end,
    },
    -- GameText.BIG_TOP
    [2] = {
        defaultColor = function() return 108, 184, 242 end,
        renderFunction = function()
            local data = GameText.texts[GameText.BIG_TOP]

            if data then
                if data.isDone then
                    removeEventHandler("onClientRender", root, GameText.config[GameText.BIG_TOP].renderFunction)
                else
                    GameText.texts[GameText.BIG_TOP] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(2, cfg.text, screenW * 0.2719, screenH * 0.1287, screenW * 0.7281, screenH * 0.2093,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 2, 2, "pricedown", "center",
                            "bottom", false, false, false, true, false)
                    end)
                end
            end
        end,
    },
    -- GameText.STATUS
    [3] = {
        defaultColor = function() return 108, 184, 242 end,
        renderFunction = function()
            local data = GameText.texts[GameText.STATUS]

            if data then
                if data.isDone then
                    removeEventHandler("onClientRender", root, GameText.config[GameText.STATUS].renderFunction)
                else
                    GameText.texts[GameText.STATUS] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.2719, screenH * 0.6009, screenW * 0.7281, screenH * 0.6917,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 1.4, 1.4, "bankgothic", "center",
                            "center", false, true, false, true, false)
                    end)
                end
            end
        end,
    },
    -- GameText.SCORES
    [4] = {
        defaultColor = function() return 141, 134, 92 end,
        renderFunction = function()
            local data = GameText.texts[GameText.SCORES]

            if data then
                if data.isDone then
                    removeEventHandler("onClientRender", root, GameText.config[GameText.SCORES].renderFunction)
                else
                    GameText.texts[GameText.SCORES] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.2719, screenH * 0.7009, screenW * 0.7281, screenH * 0.8028,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 1.2, 1.2, "pricedown", "center",
                            "bottom", false, false, false, true, false)
                    end)
                end
            end
        end,
    },
    -- GameText.DIALOG
    [5] = {
        defaultColor = function() return 240, 240, 240 end,
        renderFunction = function()
            local data = GameText.texts[GameText.DIALOG]

            if data then
                if data.isDone then
                    removeEventHandler("onClientRender", root, GameText.config[GameText.DIALOG].renderFunction)
                else
                    GameText.texts[GameText.DIALOG] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.2719, screenH * 0.8139, screenW * 0.7281, screenH * 0.9157,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 2.0, 1.7, "sans", "center",
                            "top", false, false, false, true, false)
                    end)
                end
            end
        end,
    },
    -- GameText.AREA_NAME
    [6] = {
        defaultColor = function() return 131, 134, 150 end,
        renderFunction = function()
            local data = GameText.texts[GameText.AREA_NAME]

            if data then
                if data.isDone then
                    removeEventHandler("onClientRender", root, GameText.config[GameText.AREA_NAME].renderFunction)
                else
                    GameText.texts[GameText.AREA_NAME] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.6240, screenH * 0.8028, screenW * 0.9891, screenH * 0.8722,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 2.5, 2.5, "beckett", "right",
                            "center", false, true, false, false, false)
                    end)
                end
            end
        end,
    },
    -- GameText.VEH_NAME
    [7] = {
        defaultColor = function() return 52, 208, 88 end,
        renderFunction = function()
            local data = GameText.texts[GameText.VEH_NAME]

            if data then
                if data.isDone then
                    removeEventHandler("onClientRender", root, GameText.config[GameText.VEH_NAME].renderFunction)
                else
                    GameText.texts[GameText.VEH_NAME] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.6240, screenH * 0.7241, screenW * 0.9891, screenH * 0.7935,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 3.0, 3.0, "bankghotic", "right",
                            "center", false, true, false, false, false)
                    end)
                end
            end
        end,
    },
    -- GameText.DAMAGES
    [8] = {
        defaultColor = function() return 240, 240, 240 end,
        renderFunction = function()
            local data = GameText.texts[GameText.DAMAGES]

            if data then
                if data.isDone then
                    removeEventHandler("onClientRender", root, GameText.config[GameText.DAMAGES].renderFunction)
                else
                    GameText.texts[GameText.DAMAGES] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, cfg.text, screenW * 0.6542, screenH * 0.8815, screenW * 0.9891, screenH * 0.9157,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 1.1, 1.1, "sans", "right",
                            "center", false, true, false, false, false)
                    end)
                end
            end
        end,
    },
    -- GameText.SHOUT
    [9] = {
        defaultColor = function() return 195, 61, 64 end,
        renderFunction = function()
            local data = GameText.texts[GameText.SHOUT]

            if data then
                if data.isDone then
                    removeEventHandler("onClientRender", root, GameText.config[GameText.SHOUT].renderFunction)
                else
                    GameText.texts[GameText.SHOUT] = GameText.processTextAnimation(data, function(cfg)
                        dxDrawBorderedText(1, screenW * 0.2719, screenH * 0.2185, screenW * 0.7281, screenH * 0.4185,
                            tocolor(cfg.colorR, cfg.colorG, cfg.colorB, cfg.currentAlpha), 3.0, 3.0, "default-bold", "center",
                            "top", false, true, true, true, false)
                    end)
                end
            end
        end,
    },
}

GameText.show = function(style, text, duration, r, g, b)
    if GameText.isValidStyle(style) then
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

addEventHandler("onClientRender", root, function()
    if GameText.isValidStyle(currentStyle) then
        local config = GameText.texts[currentStyle] or {}

        dxDrawText("Alpha:", 1622, 851, 1761, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "right", "top", false, false, false, false, false)
        dxDrawText(tostring(config.currentAlpha), 1771, 851, 1910, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("IsShown:", 1622, 871, 1761, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "right", "top", false, false, false, false, false)
        dxDrawText(tostring(config.isShown), 1771, 871, 1910, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
        dxDrawText("IsDone:", 1622, 891, 1761, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "right", "top", false, false, false, false, false)
        dxDrawText(tostring(config.isDone), 1771, 891, 1910, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)

        local attachedFunctions = getEventHandlers("onClientRender", root)
        local eventAttached = false
        if attachedFunctions then
            for k,v in ipairs(attachedFunctions) do
                if v == GameText.config[currentStyle].renderFunction then
                    eventAttached = true
                end
            end
        end

        dxDrawText("Event?:", 1622, 911, 1761, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "right", "top", false, false, false, false, false)
        dxDrawText(tostring(eventAttached), 1771, 911, 1910, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)
    end
end)

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
GameText.isValidStyle = function(style)
    return type(style) == "number"
       and (style == GameText.BIG_CENTER
        or style == GameText.BIG_TOP
        or style == GameText.STATUS
        or style == GameText.SCORES
        or style == GameText.DIALOG
        or style == GameText.AREA_NAME
        or style == GameText.VEH_NAME
        or style == GameText.DAMAGES
        or style == GameText.SHOUT)
end

addCommandHandler("testgt", function(cmdName, style, ...)
    local numStyle = tonumber(style)
    if not GameText.isValidStyle(numStyle) then
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
end)