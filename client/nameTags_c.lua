NameTags = {}

NameTags.style = {
    SEPARATED = 1,
    MERGED = 2
}

NameTags.styleUsed = NameTags.style.MERGED

-- TEST ONLY
addCommandHandler("nts", function()
    if NameTags.styleUsed == NameTags.style.MERGED then
        NameTags.styleUsed = NameTags.style.SEPARATED
    else
        NameTags.styleUsed = NameTags.style.MERGED
    end
end)

--#region PRIVATE

local function getPlayerNameWithId(player)
    if not isElement(player) or getElementType(player) ~= player then return "" end

    -- Wartość ustawiana jest postronie modułu grywalnego
    local playerName = getPlayerName(player)
    local sessionId = getElementData(player, "session.id", false)

    if type(sessionId) == "number" then
        return string.format("%s (%d)", playerName, sessionId)
    else
        return playerName
    end
end

--#endregion

NameTags.drawBar = function(style, x, y, health, armor)
    local border = 2
    local barBaseSizX, barBaseSizY = 75, border * 2 + 6
    local lineOffsetH = 0

    if NameTags.styleUsed == NameTags.style.MERGED then barBaseSizY = barBaseSizY + 2 end
    if health < 0 then health = 0 elseif health > 100 then health = 100 end
    if armor < 0 then armor = 0 elseif armor > 100 then armor = 100 end

    -- Życie
    x = x - barBaseSizX / 2
    y = y - barBaseSizY / 2

    local inPosX, inPosY = x + border, y + border
    local inbarBaseSizX, inbarBaseSizY = barBaseSizX - border * 2, barBaseSizY - border * 2
    local valBarHealthW = (health / 100) * inbarBaseSizX
    local valBarArmorW = armor and armor > 0 and ((armor / 100) * inbarBaseSizX) or 0

    if style == NameTags.style.MERGED then
        dxDrawRectangle(x, y, barBaseSizX, barBaseSizY, tocolor(0, 0, 0), true)

        if armor and armor > 0 then
            dxDrawRectangle(x, y, valBarArmorW, barBaseSizY, tocolor(110, 110, 110), true) -- Armor
        end

        dxDrawRectangle(inPosX, inPosY, inbarBaseSizX, inbarBaseSizY, tocolor(84, 19, 11), true)
        dxDrawRectangle(inPosX, inPosY, valBarHealthW, inbarBaseSizY, tocolor(190, 42, 28), true)
    else
        dxDrawRectangle(x, y, barBaseSizX, barBaseSizY, tocolor(0, 0, 0), true)
        dxDrawRectangle(inPosX, inPosY, inbarBaseSizX, inbarBaseSizY, tocolor(84, 19, 11), true)
        dxDrawRectangle(inPosX, inPosY, valBarHealthW, inbarBaseSizY, tocolor(190, 42, 28), true)

        if armor and armor > 0 then
            y = y + barBaseSizY + border * 2
            inPosY = y + border
            dxDrawRectangle(x, y, barBaseSizX, barBaseSizY, tocolor(0, 0, 0, 200), true)
            dxDrawRectangle(inPosX, inPosY, inbarBaseSizX, inbarBaseSizY, tocolor(110, 110, 110), true)
            dxDrawRectangle(inPosX, inPosY, valBarArmorW, inbarBaseSizY, tocolor(220, 220, 220), true)
        end
    end
end

NameTags.draw = function()
    local camX, camY, camZ = getCameraMatrix()
    local epX, epY, epZ = 0, 0, 0
    local headX, headY, headZ = 0, 0, 0
    local scrX, scrY = 0, 0
    local dxTx, dxTy = 0, 0
    local tagX, tagY = 0, 0
    local name = ""
    local dist = 0

    for k, v in ipairs(getElementsByType("ped", root, true)) do
        local hp, arm = getElementHealth(v), getPedArmor(v)
        epX, epY, epZ = getElementPosition(v)
        dist = math.sqrt((camX - epX) ^ 2 + (camY - epY) ^ 2 + (camZ - epZ) ^ 2)

        if dist < 30.0 then
            if isLineOfSightClear(camX, camY, camZ, epX, epY, epZ, true, false, false, true, false, false, false, localPlayer) then
                name = getPlayerNameWithId(v)
                headX, headY, headZ = getPedBonePosition(v, 5)
                scrX, scrY = getScreenFromWorldPosition(headX, headY, headZ)
                dxTx, dxTy = dxGetTextSize(name, 0, 1.0, 1.0, "default-bold", false, false)

                if scrX then
                    tagX = scrX - (dxTx / 2)

                    if NameTags.styleUsed == NameTags.style.MERGED then
                        tagY = scrY - 100 + (dist * 3)
                    else
                        tagY = scrY - 120 + (dist * 3)
                    end

                    dxDrawBorderedText(1, name, tagX, tagY, tagX, tagY, tocolor(255, 255, 255, 255), 1.0, 1.0,
                        "default-bold")
                    --drawHealthBar(v, scrX, tagY + 30)
                    NameTags.drawBar(NameTags.styleUsed, scrX, tagY + 25, hp, arm)
                end
            end
        end
    end
end

--#region EVENT-s

addEventHandler("onClientRender", root, NameTags.draw)

--#endregion
