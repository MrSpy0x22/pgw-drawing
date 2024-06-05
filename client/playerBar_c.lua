local screenW, screenH = guiGetScreenSize()
local screenScale = screenH / 1080
--local scaleX, scaleY = screenW / 2560, screenH / 1080

PlayerBar = {}

PlayerBar.config = {
    forPlayer = nil,
    eventAdded = false
}

PlayerBar.create = function(forPlayer)
    forPlayer = forPlayer or localPlayer

    PlayerBar.config.forPlayer = forPlayer

    if not PlayerBar.config.eventAdded then
        addEventHandler("onClientRender", root, PlayerBar.draw)
        PlayerBar.config.eventAdded = true
    end
end

PlayerBar.destroy = function()
    PlayerBar.config.forPlayer = nil
    PlayerBar.config.eventAdded = false

    removeEventHandler("onClientRender", root, PlayerBar.draw)
end

PlayerBar.draw = function()
    local offsetX = screenW * 0.0200
    local iconRightMargin = screenW * 0.0070
    local posX, currentX, sizeX = 0, 0, 0
    local iconW, iconH = screenW * 0.0141, screenH * 0.0241
    local fontScale = 1.70
    local data = PlayerBar.getData(PlayerBar.config.forPlayer)

    if screenH <= 720 then
        fontScale = 1.30
    end

    -- Tło
    dxDrawRectangle(screenW * 0.0000, screenH * 0.9574, screenW * 1.0000, screenH * 0.0426, tocolor(0, 0, 0, 79), false)
    dxDrawRectangle(screenW * 0.0000, screenH * 0.9602, screenW * 1.0000, screenH * 0.0398, tocolor(0, 0, 0, 79), false)
    dxDrawRectangle(screenW * 0.0000, screenH * 0.9630, screenW * 1.0000, screenH * 0.0370, tocolor(0, 0, 0, 79), false)

    -- Wersja
    --dxDrawText("PGW ".. data.ver, screenW * 0.9431, screenH * 0.9605, screenW * 0.9979, screenH * 0.9927,
    --   tocolor(145, 141, 139, 255), 1.00, "default", "left", "top", false, false, false, false, false)

    -- Pasek poziomu
    dxDrawRectangle(screenW * 0.0000, screenH * 0.9972, (screenW * 1.0000) * data.levelProgress, screenH * 0.0028, tocolor(174, 4, 4, 255), false)

    -- TODO: VIP mark
    local pR, pG, pB = getPlayerNametagColor(localPlayer)
    dxDrawText("★", screenW * 0.0021, screenH * 0.9630, screenW * 0.0135, screenH * 0.9944, tocolor(pR, pG, pB, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)

    -- Nick
    local elementText = string.format("%s (%d)", data.nick, data.id)
    sizeX = dxGetTextSize(elementText, 0, fontScale, "default-bold", false, false)

    sizeX = sizeX * screenScale
    currentX = screenW * 0.0156
    dxDrawText(elementText, currentX, screenH * 0.9639, sizeX, screenH * 0.9972, tocolor(pR, pG, pB, 255),
        fontScale, "default-bold", "left", "center", false, false, false, false, false)

    -- Punkty
    currentX = currentX + sizeX + offsetX
    sizeX = iconW
    dxDrawImage(currentX, screenH * 0.9687, sizeX, screenH * 0.0241, "/resources/scores.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

    currentX = currentX + sizeX + iconRightMargin
    elementText = string.format("%.02f", data.scores)
    sizeX = dxGetTextSize(elementText, 0, fontScale, "default-bold", false, false)
    dxDrawText(elementText, currentX, screenH * 0.9639, sizeX, screenH * 0.9972, tocolor(255, 255, 255, 255), fontScale, "default-bold", "left", "center", false, false, false, false, false)

    -- Poziom
    currentX = currentX + sizeX + offsetX
    sizeX = iconW
    dxDrawImage(currentX, screenH * 0.9687, sizeX, screenH * 0.0241, "/resources/levelBadge.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

    currentX = currentX + sizeX + iconRightMargin
    elementText = string.format("%d/%d", data.level, CLevelMax)
    sizeX = dxGetTextSize(elementText, 0, fontScale, "default-bold", false, false)
    dxDrawText(elementText, currentX, screenH * 0.9639, sizeX, screenH * 0.9972, tocolor(255, 255, 255, 255), fontScale, "default-bold", "left", "center", false, false, false, false, false)

    -- Xpunkty
    if data.xscores then
        currentX = currentX + sizeX + offsetX
        sizeX = iconW
        dxDrawImage(currentX, screenH * 0.9687, sizeX, screenH * 0.0241, "/resources/xscores.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)

        currentX = currentX + sizeX + iconRightMargin
        elementText = tostring(data.xscores)
        sizeX = dxGetTextSize(elementText, 0, fontScale, "default-bold", false, false)
        dxDrawText(elementText, currentX, screenH * 0.9639, sizeX, screenH * 0.9972, tocolor(255, 255, 255, 255), fontScale, "default-bold", "left", "center", false, false, false, false, false)
    end

    -- Frakcja
    if data.fract then
        currentX = currentX + sizeX + offsetX
        sizeX = iconW
        dxDrawImage(currentX, screenH * 0.9687, sizeX, screenH * 0.0241, "/resources/group.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        currentX = currentX + sizeX + iconRightMargin
        elementText = CFractionsArray[data.fract] or data.fract
        sizeX = dxGetTextSize(elementText, 0, fontScale, "default-bold", false, false)
        dxDrawText(elementText, currentX, screenH * 0.9639, sizeX, screenH * 0.9972, tocolor(255, 255, 255, 255), fontScale, "default-bold", "left", "center", false, false, false, false, false)

        -- Ranga
        currentX = currentX + sizeX + offsetX
        sizeX = iconW
        dxDrawImage(currentX, screenH * 0.9687, sizeX, screenH * 0.0241, "/resources/rank.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        currentX = currentX + sizeX + iconRightMargin
        if data.frank >= CFRankMax then
            elementText = tostring(data.frank)
        else
            elementText = string.format("%d/%d", data.frank, CFRankMax - 1)
        end
        sizeX = dxGetTextSize(elementText, 0, fontScale, "default-bold", false, false)
        dxDrawText(elementText, currentX, screenH * 0.9639, sizeX, screenH * 0.9972, tocolor(255, 255, 255, 255), fontScale, "default-bold", "left", "center", false, false, false, false, false)

        -- Punkty frakcji
        currentX = currentX + sizeX + offsetX
        sizeX = iconW
        dxDrawImage(currentX, screenH * 0.9687, sizeX, screenH * 0.0241, "/resources/weapon.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        currentX = currentX + sizeX + iconRightMargin
        elementText = tostring(data.fscores)
        sizeX = dxGetTextSize(elementText, 0, fontScale, "default-bold", false, false)
        dxDrawText(elementText, currentX, screenH * 0.9639, sizeX, screenH * 0.9972, tocolor(255, 255, 255, 255), fontScale, "default-bold", "left", "center", false, false, false, false, false)
    end

    if data.job then
        currentX = currentX + sizeX + offsetX
        sizeX = iconW
        dxDrawImage(currentX, screenH * 0.9667, sizeX, screenH * 0.0241, "/resources/job.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        currentX = currentX + sizeX + iconRightMargin
        sizeX = dxGetTextSize(data.job, 0, fontScale, "default-bold", false, false)
        dxDrawText(data.job, currentX, screenH * 0.9639, sizeX, screenH * 0.9972, tocolor(255, 255, 255, 255), fontScale, "default-bold", "left", "center", false, false, false, false, false)

        -- Praca
        currentX = currentX + sizeX + offsetX
        sizeX = iconW
        dxDrawImage(currentX, screenH * 0.9667, sizeX, screenH * 0.0241, "/resources/jobScores.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

        currentX = currentX + sizeX + iconRightMargin
        sizeX = dxGetTextSize(tostring(data.jscores or 0), 0, fontScale, "default-bold", false, false)
        dxDrawText(tostring(data.jscores or 0), currentX, screenH * 0.9639, sizeX, screenH * 0.9972, tocolor(255, 255, 255, 255), fontScale, "default-bold", "left", "center", false, false, false, false, false)
    end
end

PlayerBar.getData = function(forPlayer)
    local ver, stars, nick, id, scores, xscores, level, levelProgress, fract, frank, fscores, job, jscores

    ver = getElementData(root, "global.version", false)
    stars = 1 -- TODO:
    nick = getPlayerName(forPlayer)
    id = getElementData(forPlayer, "session.playerId", false)
    scores = getElementData(forPlayer, "player.scores", false) or 0
    level = getLevelFromScores(scores)
    levelProgress = getLevelProgressForScores(scores)
    fract = getElementData(forPlayer, "player.fract", false)
    frank = getElementData(forPlayer, "player.frank", false)
    fscores = getElementData(forPlayer, "player.fscores", false)
    job = getJobName(getPlayerJob(forPlayer))
    jscores = getElementData(forPlayer, "player.jscores", false)

    -- Nadpisywanie nazwyidentyfikatora frakcji
    if CFractionsArray then
        for _, v in ipairs(CFractionsArray) do
            if v.key == fract then
                fract = v.value
            end
        end
    end

    return {
        ver = ver, stars = stars, nick = nick, id = id, scores = scores, xscores = xscores, level = level,
        levelProgress = levelProgress, fract = fract, frank = frank, fscores = fscores, job = job, jscores = jscores
    }
end