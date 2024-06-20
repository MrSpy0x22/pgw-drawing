DeathList = {}

DeathList.renderTarget = nil
DeathList.queue = {}
DeathList.data = {}

--#region PRIVATE

local screenW, screenH = guiGetScreenSize()
local weaponFont = nil
local rows = 6
local itemOffsetX, itemOffsetY = screenW * 0.0052, screenH * 0.0052 --0.0352
local itemW, itemH = screenW * 0.0813, screenH * 0.0259
local iconW, iconH = screenW * 0.0161, screenH * 0.0259
local renderX, renderY = screenW * 0.7583, screenH * 0.3111
local renderW, renderH = itemW * 2 + itemOffsetX * 2 + iconW, rows * (itemH + itemOffsetY)

local function getRowPos(rowNumber)
    local killer, killed, icon
    local currentX = 0
    local currentY = renderH - ((itemH + itemOffsetY) * rowNumber)

    killer = { x = currentX, y = currentY }

    currentX = currentX + itemW + itemOffsetX
    icon = { x = currentX, y = currentY }

    currentX = currentX + itemOffsetX + iconW
    killed = { x = currentX, y = currentY }

    return killer, icon, killed
end

-- https://wiki.multitheftauto.com/wiki/Damage_Types
local function getDeathReasonImage(reason)
    local character, offX, offY = nil, 0, 2

    if reason == 0 then
        character = "%"
    elseif reason == 1 then
        character = "B"
    elseif reason == 2 then
        character = ">"
    elseif reason == 3 then
        character = "("
    elseif reason == 4 then
        character = "C"
    elseif reason == 5 then
        character = "?"
    elseif reason == 6 then
        character = "&"
    elseif reason == 7 then
        character = ""
    elseif reason == 8 then
        character = "!"
    elseif reason == 9 then
        character = "1"
    elseif reason == 10 then
        character = "E"
    elseif reason == 11 then
        character = "E"
    elseif reason == 12 then
        character = "E"
    elseif reason == 13 then
        character = "E"
    elseif reason == 14 then
        character = "$"
    elseif reason == 15 then
        character = "#"
    elseif reason == 16 then
        character = "@"
    elseif reason == 17 then
        character = "D"
    elseif reason == 22 then
        character = "6"
    elseif reason == 23 then
        character = "2"
    elseif reason == 24 then
        character = "3"
    elseif reason == 25 then
        character = "="
    elseif reason == 26 then
        character = "0"
    elseif reason == 27 then
        character = "+"
    elseif reason == 28 then
        character = "9"
    elseif reason == 29 then
        character = "8"
    elseif reason == 30 then
        character = "H"
    elseif reason == 31 then
        character = "5"
    elseif reason == 32 then
        character = "7"
    elseif reason == 33 then
        character = "."
    elseif reason == 34 then
        character = "A"
    elseif reason == 35 then
        character = "4"
    elseif reason == 36 then
        character = ")"
    elseif reason == 37 then
        character = "*"
    elseif reason == 38 then
        character = "F"
    elseif reason == 39 then
        character = "<"
    elseif reason == 40 then
        character = ";"
    elseif reason == 41 then
        character = "/"
    elseif reason == 42 then
        character = ","
    elseif reason == 44 then
        character = "-"
    elseif reason == 45 then
        character = "-"
    elseif reason == 46 then
        character = ":"
    elseif reason == 19 or reason == 51 or reason == 63 or reason == 59 then
        character = "Q"                                                                      -- eksplozja
    elseif reason == 50 then
        character = "R"                                                                      -- helikopter
    elseif reason == 37 then                                                                 -- ogień
        character = "P"
    elseif reason == 52 then
        character = "M"                                                                      -- Driveby
    elseif reason == 54 then
        character = "K"
    else
        character = "O"; offX = itemOffsetX; offY = -(itemOffsetX / 2)
    end

    return character, offX, offY
end

local function renderList()
    if not weaponFont then
        weaponFont = dxCreateFont("/resources/deathlist/gtaweap3.ttf", 16)

        if not weaponFont then
            outputDebugString("Nie udało się utworzyc czcionki!", 1)
        end
    end

    if type(DeathList.data) == "table" and #DeathList.data > 0 then
        dxSetRenderTarget(DeathList.renderTarget, true)
        dxSetBlendMode("modulate_add")

        for i = rows, 1, -1 do
            local index = rows - i + 1
            local record = DeathList.data[index] or nil
            local killerPos, iconPos, killedPos = getRowPos(index)

            if not record then return end

            if record.killer then
                dxDrawBorderedText(1, String.shorten(record.killer.name, 16), killerPos.x, killerPos.y, killerPos.x + itemW,
                    killerPos.y + itemH, record.killer.color, 1.1, 1.1, "default-bold", "right", "center", false, false,
                    false, true)
            end

            if record.killed then
                dxDrawBorderedText(1, String.shorten(record.killed.name, 16), killedPos.x, killedPos.y, killedPos.x + itemW,
                    killedPos.y + itemH, record.killed.color, 1.1, 1.1, "default-bold", "left", "center", false, false, false,
                    true)
            end

            if record.icon then
                dxDrawRectangle(iconPos.x, iconPos.y, iconW, iconH, tocolor(0, 0, 0, 255), false, true)
                if weaponFont then
                    local character, offX, offY = getDeathReasonImage(record.icon.reason)
                    dxDrawText(character, iconPos.x + offX, iconPos.y + offY, iconPos.x + iconW,
                        iconPos.y + iconH, tocolor(255, 255, 255), 1.1, 1.1, weaponFont, "center", "center")
                end
            end
        end

        dxSetBlendMode("blend")
        dxSetRenderTarget()
    end
end

--#endregion

DeathList.add = function(killer, killed, reason)
    local newTab = { }
    
    for i = 1, rows - 1 do
        newTab[i + 1] = DeathList.data[i] or { killer = nil, killed = nil, icon = nil}
    end
    outputConsole(toJSON(newTab))
    local newObject = {}
    
    if killer then
        newObject.killer = { name = getPlayerName(killer) or "", color = tocolor(getPlayerNametagColor(killer)) or tocolor(255, 255, 255) }
    end

    newObject.icon = { reason = reason }

    if killed then
        newObject.killed = { name = getPlayerName(killed) or "", color = tocolor(getPlayerNametagColor(killed)) or tocolor(255, 255, 255) }
    else
        newObject.killed = nil
    end

    newTab[1] = newObject
    DeathList.data = newTab
    renderList()
end

addEventHandler("onClientResourceStart", resourceRoot, function(startedRes)
    if startedRes == getThisResource() and not DeathList.renderTarget then
        DeathList.renderTarget = dxCreateRenderTarget(renderW, renderH, true)
        renderList()
    end
end)

addEventHandler("onClientRender", root, function()
    dxDrawImage(renderX, renderY, renderW, renderH, DeathList.renderTarget)
end)