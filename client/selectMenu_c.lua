SelectMenu = {}

SelectMenu.format = {
    NONE = 1,
    MONEY = 2,
    PT = 3,
    XPT = 4,
    FPT = 5,
    JPT = 6,
}

--#region PRIVATE

local screenW, screenH = guiGetScreenSize()
local controls = {
    "action",
    "fire",
    "walk",
    "enter_exit",
    "enter_passenger",
    "sprint",
    "jump",
    "aim_weapon",
    "next_weapon",
    "previous_weapon",
    "forwards",
    "backwards",
    "left",
    "right",
    "vehicle_fire",
    "vehicle_secondary_fire",
    "vehicle_left",
    "vehicle_right",
    "radio_next",
    "radio_previous",
    "horn",
    "steer_forward",
    "steer_backward",
}

local dataAttributesValidation = {
    { name = "name", type = "string" },
    { name = "value", type = "string" },
    { name = "format", type = "number" },
    { name = "enabled", type = "boolean" },
}

local function takeControls(take)
    take = take == false

    for _, v in ipairs(controls) do
        toggleControl(v, take)
    end
end

local function validateData(data, outputMessages)
    local isValid = true

    if type(data) ~= "table" then
        isValid = false
    else
        for k, v in ipairs(data) do
            for _, attr in ipairs(dataAttributesValidation) do
                local key = attr.name
                local keyType = attr.type

                if not key or not keyType then
                    isValid = false

                    if outputMessages then
                        outputDebugString(string.format("Nieprawidłowy obiekt: nieokreślony błąd walidacji! (idx: %d)", k), 1)
                    end
                elseif v[key] == nil then
                    isValid = false
        
                    if not isValid and outputMessages then
                        outputDebugString(string.format("Nieprawidłowy obiekt: brak danych dla \"%s\" (ids: %d)", key, k), 1)
                    end
                elseif type(v[key]) ~= keyType then
                    isValid = false

                    if not isValid and outputMessages then
                        outputDebugString(string.format("Nieprawidłowy obiekt: zły typ dla \"%s\" -> %s != %s (ids: %d)", key,
                            tostring(keyType), type(v[key]), k), 1)
                    end
                    break
                end
            end
        end
    end

    return isValid
end

local function formatText(formatType, text)
    local textResult
    if type(formatType) == "number" then
        if formatType == SelectMenu.format.MONEY then
            textResult = String.toNumber(tonumber(text), " ", "$", false)
        elseif formatType == SelectMenu.format.PT then
            textResult = String.toNumber(tonumber(text), " ", "pt", true)
        elseif formatType == SelectMenu.format.XPT then
            textResult = String.toNumber(tonumber(text), " ", "xpt", true)
        elseif formatType == SelectMenu.format.FPT then
            textResult = String.toNumber(tonumber(text), " ", "fpt", true)
        elseif formatType == SelectMenu.format.JPT then
            textResult = String.toNumber(tonumber(text), " ", "jpt", true)
        else
            textResult = tostring(text)
        end

        return textResult
    end

    return false
end

--#endregionrn temp

SelectMenu.config = {
    menuId = 0,
    title = "",
    isVisible = false,
    selected = 1,
    highlighted = 1,
    pageSize = 6,
    columns = 1,
    rows = 0,
    color = tocolor(255, 255, 255),
    callbackEventName = nil,
    callbackEventSendTo = nil,
    controls = {},

    data = {}
}

SelectMenu.create = function(id, title, data, columns, elementsPerPage, color, eventName, sendToElement, formatType)
    if elementsPerPage == nil or elementsPerPage < 1 or elementsPerPage > 7 then
        columns = 7
    end
    if columns == nil or columns < 1 or columns > 2 then
        columns = 1
    end

    if not validateData(data, true) then return false end

    SelectMenu.config.menuId = id
    SelectMenu.config.title = title
    SelectMenu.config.selected = 1
    SelectMenu.config.highlighted = 1
    SelectMenu.config.columns = columns
    SelectMenu.config.pageSize = elementsPerPage
    SelectMenu.config.skip = 0
    SelectMenu.config.rows = #data
    SelectMenu.config.data = data
    SelectMenu.config.isVisible = true
    SelectMenu.config.color = color
    SelectMenu.config.callbackEventName = eventName
    SelectMenu.config.callbackEventSendTo = sendToElement
    SelectMenu.config.formatType = formatType or SelectMenu.format.NONE
    takeControls(true)

    addEventHandler("onClientRender", root, SelectMenu.draw)
    addEventHandler("onClientKey", root, SelectMenu.handleKeys)

    return true
end

SelectMenu.destroy = function()
    removeEventHandler("onClientRender", root, SelectMenu.draw)
    removeEventHandler("onClientKey", root, SelectMenu.handleKeys)

    SelectMenu.config.menuId = 0
    SelectMenu.config.title = ""
    SelectMenu.config.isVisible = false
    SelectMenu.config.color = tocolor(255, 255, 255)
    SelectMenu.config.selected = 1
    SelectMenu.config.highlighted = 1
    SelectMenu.config.columns = 1
    SelectMenu.config.rows = 0
    SelectMenu.config.pageSize = 7
    SelectMenu.config.skip = 0
    SelectMenu.config.data = {}
    SelectMenu.config.callbackEventName = nil
    SelectMenu.config.callbackEventSendTo = nil
    takeControls(false)
end

SelectMenu.draw = function()
    local sizeX, sizeY = 582, 361
    local titleSizeY = 51
    local posX, posY = screenW / 2 - sizeX / 2, screenH / 2 - sizeY / 2
    local color = SelectMenu.config.color

    -- Rysowanie menu
    dxDrawRectangle(posX, posY, sizeX, sizeY, tocolor(11, 0, 0, 167), false) -- Ramka
    dxDrawLine(posX, posY, posX, posY + sizeY, color)
    dxDrawLine(posX + sizeX, posY, posX + sizeX, posY + sizeY, color)
    dxDrawLine(posX, posY + sizeY, posX + sizeX, posY + sizeY, color)
    dxDrawRectangle(posX, posY, sizeX, titleSizeY, color, false)                           -- Tło tytułu
    dxDrawBorderedText(1, SelectMenu.config.title, posX, posY, posX + sizeX, posY + titleSizeY,
        tocolor(255, 255, 255, 255), 1.20, 1.20, "diploma", "center", "center", false, false, false, false, false) -- Tytuł

    -- Rysowanie zaznaczanie i scroll-a
    local posOffxetY, offsetX, offsetY = 11, 10, 42
    local firstItemX, firstItemY = posX + offsetX, posY + titleSizeY + posOffxetY
    local itemSizeX, itemSizeY = 570, 32
    local i = SelectMenu.config.highlighted - 1
    local itemSelected = SelectMenu.config.selected
    local isEnabled = SelectMenu.config.data[itemSelected].enabled == true
    local highlightColor = tocolor(254, 255, 255, isEnabled and 170 or 80)
    dxDrawRectangle(firstItemX, firstItemY + (offsetY * i), itemSizeX - offsetX * 2, itemSizeY, highlightColor, false)

    local progressBarOffsetX, progressBarPosX = 10, posX + sizeX
    local progressBarSizeY = sizeY - titleSizeY - (offsetX * 2)
    local scrollSizeY = 32
    local scrollState = (SelectMenu.config.selected - 1) / (SelectMenu.config.rows - 1)
    local scrollPositionY = firstItemY + (progressBarSizeY - itemSizeY) * scrollState
    dxDrawRectangle(progressBarPosX - progressBarOffsetX, firstItemY, 4, progressBarSizeY, tocolor(0, 0, 0, 150), false)
    dxDrawRectangle(progressBarPosX - progressBarOffsetX, scrollPositionY, 4, scrollSizeY, highlightColor, false)

    -- Rysowanie tekstów
    local textLeftSizeX, textRightSizeX, textSizeY = 369, 160, 33
    local textLeftPosX = firstItemX + 10
    local textRightPosX = textLeftPosX + textLeftSizeX
    for i = 1, SelectMenu.config.pageSize, 1 do
        local index = i + SelectMenu.config.skip

        if index > SelectMenu.config.rows then
            break
        end

        local name = SelectMenu.config.data[index].name or "???"
        local enabled = SelectMenu.config.data[index].enabled == true
        local itemPosY = firstItemY + (offsetY * (i - 1))
        local color = i == SelectMenu.config.highlighted and tocolor(0, 0, 0, enabled and 255 or 100) or tocolor(255, 255, 255, enabled and 255 or 100)

        if SelectMenu.config.columns == 2 then
            local formatType = SelectMenu.config.data[index].format
            local value = SelectMenu.config.data[index].value
            local valueColor = color

            if formatType ~= SelectMenu.format.NONE then
                local value = tonumber(value)

                if type(value) == "number" and value < 0 then
                    local alpha = enabled and 255 or 100
                    local r, g, b = getColorFromString(ColorEnum.GT_RED)
                    valueColor = tocolor(r, g, b, alpha)
                end
            end

            dxDrawText(name, textLeftPosX, itemPosY, textLeftSizeX + textLeftSizeX, itemPosY + textSizeY, color,
                1.50, "default-bold", "left", "center", false, false, true, false, false)
            dxDrawText(formatText(formatType, value), textRightPosX, itemPosY, textRightPosX + textRightSizeX,
                itemPosY + textSizeY, valueColor, 1.50, "default-bold", "right", "center", false, false, true, false, false)
        else
            dxDrawText(name, textLeftPosX, itemPosY, textLeftSizeX + textLeftSizeX + textRightSizeX,
                itemPosY + textSizeY, color, 1.50, "default-bold", "left", "center", false, false, true, false, false)
        end
    end
end

SelectMenu.handleKeys = function(key, pressing)
    -- Scrollowanie
    if (key == "arrow_d" or key == "mouse_wheel_down") and pressing then
        local highlighted = SelectMenu.config.highlighted
        local selected = SelectMenu.config.selected
        local skip = SelectMenu.config.skip

        if highlighted < SelectMenu.config.pageSize then
            if selected < SelectMenu.config.rows then
                SelectMenu.config.highlighted = highlighted + 1
            end
        elseif skip + SelectMenu.config.pageSize < SelectMenu.config.rows then
            SelectMenu.config.skip = skip + 1
        end

        if selected < SelectMenu.config.rows then
            SelectMenu.config.selected = selected + 1
        end
    elseif (key == "arrow_u" or key == "mouse_wheel_up") and pressing then
        local highlighted = SelectMenu.config.highlighted
        local selected = SelectMenu.config.selected
        local skip = SelectMenu.config.skip

        if highlighted > 1 then
            SelectMenu.config.highlighted = highlighted - 1
        elseif selected ~= 1 then
            SelectMenu.config.skip = skip - 1
        end

        if selected > 1 then
            SelectMenu.config.selected = selected - 1
        end
    elseif (key == "enter" or key == "lshift") and pressing then
        local selected = SelectMenu.config.selected
        local isEnabled = SelectMenu.config.data[selected].enabled == true

        if isEnabled then
            local eventName = SelectMenu.config.callbackEventName
            
            if eventName then
                triggerServerEvent(eventName, SelectMenu.config.callbackEventSendTo, SelectMenu.config.menuId, true,
                    SelectMenu.config.selected, SelectMenu.config.highlighted)
            end

            SelectMenu.destroy()
        end
    elseif (key == "backspace" or key == "f") and pressing then
        local eventName = SelectMenu.config.callbackEventName
        if eventName then
            triggerServerEvent(eventName, SelectMenu.config.callbackEventSendTo, SelectMenu.config.menuId, false,
                SelectMenu.config.selected, SelectMenu.config.highlighted)
        end

        SelectMenu.destroy()
    end
end

--[[addCommandHandler("testmenu", function()
    if SelectMenu.config.isVisible then
        SelectMenu.destroy()
        outputChatBox("Hiding menu")
    else
        --SelectMenu.create(1, "Select Menu Test", {"test1", "test2", "test3", "test4", "test5", "test6", "test7"}, 1, 7, true)
        SelectMenu.create(1, "Select Menu Test",
            {
                { "test1",  "$0" },
                { "test2",  "$0" },
                { "test3",  "$0" },
                { "test4",  "$0" },
                { "test5",  "$0" },
                { "test6",  "$0" },
                { "test7",  "$0" },
                { "test8",  "$0" },
                { "test9",  "$0" },
                { "test10", "$0" },
                { "test11", "$0" },
            }, 2, 7, tocolor(192, 233, 79, 255), true)
        outputChatBox("Showing menu")
    end
end)

addEventHandler("onClientRender", root, function()
    if SelectMenu.config.isVisible then
        dxDrawText("Selected:", 1622, 851, 1761, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "right", "top",
            false, false, false, false, false)
        dxDrawText(string.format("%s/%s", tostring(SelectMenu.config.selected), tostring(SelectMenu.config.rows)), 1771,
            851, 1910, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false,
            false)
        dxDrawText("Highlighted:", 1622, 871, 1761, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "right", "top",
            false, false, false, false, false)
        dxDrawText(string.format("%s/%s", tostring(SelectMenu.config.highlighted), tostring(SelectMenu.config.pageSize)),
            1771, 871, 1910, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false,
            false, false)
        dxDrawText("Skip:", 1622, 891, 1761, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "right", "top", false,
            false, false, false, false)
        dxDrawText(tostring(SelectMenu.config.skip), 1771, 891, 1910, 1044, tocolor(255, 255, 255, 255), 1.00, "default",
            "left", "top", false, false, false, false, false)
    end
end)]]
