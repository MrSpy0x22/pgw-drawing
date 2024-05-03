--#region Funkcje pomocnicze

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

function enableControl()
    local temp = {}
    for _, v in ipairs(controls) do
        temp[v] = false
        toggleControl(v, temp[v])
    end

    return temp
end

function disableControl()
    for k, v in pairs(InventoryList.config.controls) do
        if v == isControlEnabled(k) then
            toggleControl(k, true)
        else
            outputConsole("%s: %s ~= %s", k, tostring(v), isControlEnabled(k))
        end
    end

    return {}
end

--#endregion

InventoryList = {}

InventoryList.TYPE_BAG = 1

InventoryList.config = {
    inventoryType = 0,
    title = "",
    isVisible = false,
    selected = 1,
    highlighted = 1,
    pageSize = 5,
    rows = 0,
    color = "#FFFFFF",
    callbackEventName = nil,
    callbackEventSendTo = nil,
    controls = {},

    inventoryData = {}
}

InventoryList.show = function(typeId, title, data, color, limit, eventName, sendToElement)
    InventoryList.config.typeId = typeId
    InventoryList.config.title = title
    InventoryList.config.selected = 1
    InventoryList.config.highlighted = 1
    InventoryList.config.skip = 0
    InventoryList.config.rows = #data or 0
    InventoryList.config.inventoryData = data
    InventoryList.config.isVisible = true
    InventoryList.config.limit = limit
    InventoryList.config.color = color
    InventoryList.config.callbackEventName = eventName
    InventoryList.config.callbackEventSendTo = sendToElement
    InventoryList.config.controls = enableControl()

    addEventHandler("onClientRender", root, InventoryList.draw)
    addEventHandler("onClientKey", root, InventoryList.handleKeys)
end

InventoryList.destroy = function()
    removeEventHandler("onClientRender", root, InventoryList.draw)
    removeEventHandler("onClientKey", root, InventoryList.handleKeys)

    InventoryList.config.typeId = 0
    InventoryList.config.title = ""
    InventoryList.config.selected = 1
    InventoryList.config.highlighted = 1
    InventoryList.config.skip = 0
    InventoryList.config.rows = 0
    InventoryList.config.inventoryData = {}
    InventoryList.config.isVisible = false
    InventoryList.config.limit = 0
    InventoryList.config.color = "#FFFFFF"
    InventoryList.config.callbackEventName = nil
    InventoryList.config.callbackEventSendTo = nil
    InventoryList.config.controls = disableControl()
end

InventoryList.draw = function()
    local accentR, accentG, accentB = getColorFromString(InventoryList.config.color)

    -- Ramka
    dxDrawRectangle(screenW * 0.7448, screenH * 0.4954, screenW * 0.2094, screenH * 0.4130, tocolor(0, 0, 0, 126), false)
    dxDrawRectangle(screenW * 0.7448, screenH * 0.4954, screenW * 0.2094, screenH * 0.0509, tocolor(accentR, accentG,
        accentB, 255), false)
    dxDrawLine(screenW * 0.7448, screenH * 0.4954, screenW * 0.7448, screenH * 0.9093, tocolor(accentR, accentG, accentB, 255), 1,
        false)
    dxDrawLine(screenW * 0.9542, screenH * 0.4954, screenW * 0.9542, screenH * 0.9093, tocolor(accentR, accentG, accentB, 255), 1,
        false)
    dxDrawLine(screenW * 0.7448, screenH * 0.9093, screenW * 0.9542, screenH * 0.9093, tocolor(accentR, accentG, accentB, 255), 1,
        false)

    -- Tytuł
    dxDrawBorderedText(1, "Schowek", screenW * 0.7495, screenH * 0.4954, screenW * 0.8964, screenH * 0.5463,
        tocolor(255, 255, 255, 255), 1.60, 1.60, "diploma", "left", "center", false, false, false, false, false)

    -- Limit
    local capacityText = string.format("%d/%d", InventoryList.config.rows, InventoryList.config.limit)
    dxDrawBorderedText(1, capacityText, screenW * 0.8995, screenH * 0.4954, screenW * 0.9490, screenH * 0.5463,
        tocolor(255, 255, 255, 255), 2.00, 2.00, "ddefault", "right", "center", false, false, false, false, false)

    -- Elementy listy
    for i = 1, InventoryList.config.pageSize do
        local itemIndex = i + InventoryList.config.skip
        local item = InventoryList.config.inventoryData[itemIndex] or {}
        local offsetY = (i - 1) * 0.0704
        local bgR, bgB, bgG, bgA = 63, 63, 63, 200
        local fgR, fgG, fgB = 200, 200, 200

        if itemIndex > InventoryList.config.rows then
            break
        end

        if i == InventoryList.config.highlighted then
            bgR, bgB, bgG, bgA = 255, 255, 255, 200
            fgR, fgG, fgB = 0, 0, 0
        end

        -- Tło elementu
        dxDrawRectangle(screenW * 0.7500, screenH * (0.5556 + offsetY), screenW * 0.1901, screenH * 0.0611,
            tocolor(bgR, bgB, bgG, bgA), false)

        -- Ikona
        dxDrawImage(screenW * 0.7521, screenH * (0.5593 + offsetY), screenW * 0.0312, screenH * 0.0528,
            InventoryList.getImageForItem(item.model), 0, 0, 0, tocolor(fgR, fgG, fgB), false)

        -- Nazwa przedmiotu
        dxDrawText(item.name or "???", screenW * 0.7885, screenH * (0.5593 + offsetY),
            screenW * 0.9349, screenH * (0.5870 + offsetY), tocolor(fgR, fgG, fgB), 1.50, 1.50, "default-bold", "left",
            "top", false, false, false, false, false)

        -- Opis przedmiotu
        dxDrawText(item.amountText, screenW * 0.7885, screenH * (0.5870 + offsetY), screenW * 0.9349,
            screenH * (0.6120 + offsetY), tocolor(fgR, fgG, fgB), 1.20, 1.20, "default-bold", "left", "center", false,
            false, false, false, false)
    end

    -- Scroll
    local scrollStartY = screenH * 0.5556
    local scrollState = (InventoryList.config.selected - 1) / (InventoryList.config.rows - 1)
    local scrollBgSizeY, scrollFgSizeY = screenH * 0.3435, screenH * 0.0630
    local strollPositionY = scrollStartY + (scrollBgSizeY - scrollFgSizeY) * scrollState
    dxDrawRectangle(screenW * 0.9464, scrollStartY, screenW * 0.0026, scrollBgSizeY, tocolor(109, 109, 109, 150),
        false)
    dxDrawRectangle(screenW * 0.9464, strollPositionY--[[screenH * 0.5556]], screenW * 0.0026, scrollFgSizeY, tocolor(accentR, accentG,
        accentB, 255), false)
end

InventoryList.handleKeys = function(key, pressing)
    -- Scrollowanie
    if (key == "arrow_d" or key == "mouse_wheel_down") and pressing then
        local highlighted = InventoryList.config.highlighted
        local selected = InventoryList.config.selected
        local skip = InventoryList.config.skip

        if highlighted < InventoryList.config.pageSize then
            if selected < InventoryList.config.rows then
                InventoryList.config.highlighted = highlighted + 1
            end
        elseif skip + InventoryList.config.pageSize < InventoryList.config.rows then
            InventoryList.config.skip = skip + 1
        end

        if selected < InventoryList.config.rows then
            InventoryList.config.selected = selected + 1
        end
    elseif (key == "arrow_u" or key == "mouse_wheel_up") and pressing then
        local highlighted = InventoryList.config.highlighted
        local selected = InventoryList.config.selected
        local skip = InventoryList.config.skip

        if highlighted > 1 then
            InventoryList.config.highlighted = highlighted - 1
        elseif selected ~= 1 then
            InventoryList.config.skip = skip - 1
        end

        if selected > 1 then
            InventoryList.config.selected = selected - 1
        end
    elseif (key == "enter" or key == "lshift") and pressing then
        InventoryList.destroy()

        local eventName = InventoryList.config.callbackEventName
        if eventName then
            triggerServerEvent(eventName, InventoryList.config.callbackEventSendTo, InventoryList.config.menuId, true,
            InventoryList.config.selected, InventoryList.config.highlighted)
        end
    elseif (key == "backspace" or key == "f") and pressing then
        InventoryList.destroy()

        local eventName = InventoryList.config.callbackEventName
        if eventName then
            triggerServerEvent(eventName, InventoryList.config.callbackEventSendTo, InventoryList.config.menuId, false,
            InventoryList.config.selected, InventoryList.config.highlighted)
        end
    end
end

InventoryList.getImageForItem = function(itemId)
    local iconFilleName = "unknownIcon.png"

    if type(itemId) == "number" then

    end

    return "/resources/" .. iconFilleName
end
--[[
addCommandHandler("invtest", function()
    if InventoryList.config.isVisible then
        InventoryList.destroy()
    else
        InventoryList.show(0, "Inventory test", {
            {name = "Item 1", amountText = "Plantable, 5szt", model = 0 },
            {name = "Item 2", amountText = "Plantable, 5szt", model = 0 },
            {name = "Item 3", amountText = "Plantable, 5szt", model = 0 },
            {name = "Item 4", amountText = "Plantable, 5szt", model = 0 },
            {name = "Item 5", amountText = "Plantable, 5szt", model = 0 },
            {name = "Item 6", amountText = "Plantable, 5szt", model = 0 },
            {name = "Item 7", amountText = "Plantable, 5szt", model = 0 },
            {name = "Item 8", amountText = "Plantable, 5szt", model = 0 },
            {name = "Item 9", amountText = "Plantable, 5szt", model = 0 },
            {name = "Item 10", amountText = "Plantable, 5szt", model = 0 },
            {name = "Item 11", amountText = "Plantable, 5szt", model = 0 },
        }, "#5869FA", 10)
    end
end)
addEventHandler("onClientRender", root, function()
    if InventoryList.config.isVisible then
        dxDrawText("Selected:", 1622, 851, 1761, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "right", "top",
            false, false, false, false, false)
        dxDrawText(string.format("%s/%s", tostring(InventoryList.config.selected), tostring(InventoryList.config.rows)), 1771,
            851, 1910, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false,
            false)
        dxDrawText("Highlighted:", 1622, 871, 1761, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "right", "top",
            false, false, false, false, false)
        dxDrawText(string.format("%s/%s", tostring(InventoryList.config.highlighted), tostring(InventoryList.config.pageSize)),
            1771, 871, 1910, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false,
            false, false)
        dxDrawText("Skip:", 1622, 891, 1761, 1044, tocolor(255, 255, 255, 255), 1.00, "default", "right", "top", false,
            false, false, false, false)
        dxDrawText(tostring(InventoryList.config.skip), 1771, 891, 1910, 1044, tocolor(255, 255, 255, 255), 1.00, "default",
            "left", "top", false, false, false, false, false)
    end
end)




local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientRender", root,
    function()
        dxDrawRectangle(screenW * 0.7448, screenH * 0.4954, screenW * 0.2094, screenH * 0.4130, tocolor(0, 0, 0, 126), false)
        dxDrawRectangle(screenW * 0.7448, screenH * 0.4954, screenW * 0.2094, screenH * 0.0509, tocolor(76, 19, 106, 255), false)
        dxDrawLine(screenW * 0.7448, screenH * 0.4954, screenW * 0.7448, screenH * 0.9093, tocolor(76, 19, 106, 255), 1, false)
        dxDrawLine(screenW * 0.9542, screenH * 0.4954, screenW * 0.9542, screenH * 0.9083, tocolor(76, 19, 106, 255), 1, false)
        dxDrawLine(screenW * 0.7448, screenH * 0.9093, screenW * 0.9536, screenH * 0.9083, tocolor(76, 19, 106, 255), 1, false)
        dxDrawText("Schowek", (screenW * 0.7495) - 1, (screenH * 0.4954) - 1, (screenW * 0.8964) - 1, (screenH * 0.5463) - 1, tocolor(0, 0, 0, 255), 1.70, "diploma", "left", "center", false, false, false, false, false)
        dxDrawText("Schowek", (screenW * 0.7495) + 1, (screenH * 0.4954) - 1, (screenW * 0.8964) + 1, (screenH * 0.5463) - 1, tocolor(0, 0, 0, 255), 1.70, "diploma", "left", "center", false, false, false, false, false)
        dxDrawText("Schowek", (screenW * 0.7495) - 1, (screenH * 0.4954) + 1, (screenW * 0.8964) - 1, (screenH * 0.5463) + 1, tocolor(0, 0, 0, 255), 1.70, "diploma", "left", "center", false, false, false, false, false)
        dxDrawText("Schowek", (screenW * 0.7495) + 1, (screenH * 0.4954) + 1, (screenW * 0.8964) + 1, (screenH * 0.5463) + 1, tocolor(0, 0, 0, 255), 1.70, "diploma", "left", "center", false, false, false, false, false)
        dxDrawText("Schowek", screenW * 0.7495, screenH * 0.4954, screenW * 0.8964, screenH * 0.5463, tocolor(255, 255, 255, 255), 1.70, "diploma", "left", "center", false, false, false, false, false)
        dxDrawText("88/88", (screenW * 0.8995) - 1, (screenH * 0.4954) - 1, (screenW * 0.9490) - 1, (screenH * 0.5463) - 1, tocolor(0, 0, 0, 255), 2.00, "default", "right", "center", false, false, false, false, false)
        dxDrawText("88/88", (screenW * 0.8995) + 1, (screenH * 0.4954) - 1, (screenW * 0.9490) + 1, (screenH * 0.5463) - 1, tocolor(0, 0, 0, 255), 2.00, "default", "right", "center", false, false, false, false, false)
        dxDrawText("88/88", (screenW * 0.8995) - 1, (screenH * 0.4954) + 1, (screenW * 0.9490) - 1, (screenH * 0.5463) + 1, tocolor(0, 0, 0, 255), 2.00, "default", "right", "center", false, false, false, false, false)
        dxDrawText("88/88", (screenW * 0.8995) + 1, (screenH * 0.4954) + 1, (screenW * 0.9490) + 1, (screenH * 0.5463) + 1, tocolor(0, 0, 0, 255), 2.00, "default", "right", "center", false, false, false, false, false)
        dxDrawText("88/88", screenW * 0.8995, screenH * 0.4954, screenW * 0.9490, screenH * 0.5463, tocolor(255, 255, 255, 255), 2.00, "default", "right", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.7500, screenH * 0.5556, screenW * 0.1901, screenH * 0.0611, tocolor(194, 85, 56, 254), false)
        dxDrawRectangle(screenW * 0.7495, screenH * 0.6259, screenW * 0.1906, screenH * 0.0611, tocolor(63, 63, 63, 255), false)
        dxDrawRectangle(screenW * 0.7495, screenH * 0.6963, screenW * 0.1906, screenH * 0.0611, tocolor(63, 63, 63, 255), false)
        dxDrawRectangle(screenW * 0.7495, screenH * 0.7667, screenW * 0.1906, screenH * 0.0611, tocolor(63, 63, 63, 255), false)
        dxDrawRectangle(screenW * 0.7495, screenH * 0.8370, screenW * 0.1917, screenH * 0.0620, tocolor(63, 63, 63, 255), false)
        dxDrawRectangle(screenW * 0.9464, screenH * 0.5556, screenW * 0.0026, screenH * 0.3435, tocolor(109, 109, 109, 255), false)
        dxDrawRectangle(screenW * 0.7521, screenH * 0.5593, screenW * 0.0312, screenH * 0.0528, tocolor(225, 0, 0, 126), false)
        dxDrawRectangle(screenW * 0.9464, screenH * 0.5556, screenW * 0.0026, screenH * 0.0630, tocolor(76, 19, 106, 255), false)
        dxDrawRectangle(screenW * 0.7521, screenH * 0.6296, screenW * 0.0312, screenH * 0.0528, tocolor(225, 0, 0, 126), false)
        dxDrawRectangle(screenW * 0.7521, screenH * 0.7000, screenW * 0.0312, screenH * 0.0528, tocolor(225, 0, 0, 126), false)
        dxDrawRectangle(screenW * 0.7521, screenH * 0.7704, screenW * 0.0312, screenH * 0.0528, tocolor(225, 0, 0, 126), false)
        dxDrawRectangle(screenW * 0.7521, screenH * 0.8417, screenW * 0.0312, screenH * 0.0528, tocolor(225, 0, 0, 126), false)
        dxDrawText("Item name 1", screenW * 0.7885, screenH * 0.5593, screenW * 0.9349, screenH * 0.5870, tocolor(255, 255, 255, 255), 1.50, "default", "left", "top", false, false, false, false, false)
        dxDrawText("Item name 2", screenW * 0.7885, screenH * 0.6296, screenW * 0.9349, screenH * 0.6574, tocolor(255, 255, 255, 255), 1.50, "default", "left", "top", false, false, false, false, false)
        dxDrawText("Item name 4", screenW * 0.7885, screenH * 0.7704, screenW * 0.9349, screenH * 0.7981, tocolor(255, 255, 255, 255), 1.50, "default", "left", "top", false, false, false, false, false)
        dxDrawText("Item name 3", screenW * 0.7885, screenH * 0.7000, screenW * 0.9349, screenH * 0.7278, tocolor(255, 255, 255, 255), 1.50, "default", "left", "top", false, false, false, false, false)
        dxDrawText("Item name 5", screenW * 0.7885, screenH * 0.8417, screenW * 0.9349, screenH * 0.8694, tocolor(255, 255, 255, 255), 1.50, "default", "left", "top", false, false, false, false, false)
        dxDrawText("Weapon, plantable", screenW * 0.7885, screenH * 0.5870, screenW * 0.9349, screenH * 0.6120, tocolor(255, 255, 255, 255), 1.20, "default", "left", "center", false, false, false, false, false)
        dxDrawText("Weapon, plantable", screenW * 0.7885, screenH * 0.6574, screenW * 0.9349, screenH * 0.6824, tocolor(254, 254, 254, 126), 1.20, "default", "left", "center", false, false, false, false, false)
        dxDrawText("Weapon, plantable", screenW * 0.7885, screenH * 0.7278, screenW * 0.9349, screenH * 0.7528, tocolor(254, 254, 254, 126), 1.20, "default", "left", "center", false, false, false, false, false)
        dxDrawText("Weapon, plantable", screenW * 0.7885, screenH * 0.7981, screenW * 0.9349, screenH * 0.8231, tocolor(254, 254, 254, 126), 1.20, "default", "left", "center", false, false, false, false, false)
        dxDrawText("Weapon, plantable", screenW * 0.7885, screenH * 0.8694, screenW * 0.9349, screenH * 0.8944, tocolor(254, 254, 254, 126), 1.20, "default", "left", "center", false, false, false, false, false)
    end
)
]]
