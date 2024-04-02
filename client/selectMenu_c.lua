local screenW, screenH = guiGetScreenSize()

SelectMenu = {}

SelectMenu.config = {
    menuId = 0,
    title = "",
    isVisible = false,
    selected = 1,
    highlighted = 1,
    pageSize = 6,
    columns = 1,
    rows = 0,
    color = nil,
    enableSounds = true,
    callbackEventName = "",
    --restoreControl = true,

    data = {}
}

SelectMenu.create = function(id, title, data, columns, elementsPerPage, playSound)
    playSound = playSound or false
    if elementsPerPage == nil or elementsPerPage < 1 or elementsPerPage > 7 then
        columns = 7
    end
    if columns == nil or columns < 1 or columns > 3 then
        columns = 1
    end

    local tempData = {}
    local rowCount, colCount = 0, 0
    for rowIdx, rowData in ipairs(data) do
        local rowDataType = type(rowData)
        rowCount = rowCount + 1
        colCount = 0

        if columns > 1 and rowDataType == "table" then
            for colIdx, colData in ipairs(rowData) do
                colCount = colCount + 1
    
                if colCount > columns then
                    outputDebugString(
                        string.format("Nieprawidłowa struktura danych - oczekiwano liczba kolumn to %d (%d:%d)!",
                            columns, rowIdx, colIdx),
                        1)
                     return false
                end
    
                local colDataType = type(colData)
    
                if colDataType ~= "string" then
                    outputDebugString(
                        string.format("Oczekiwano tekstu zamiast \"%s\" (%d:%d)!", colDataType, rowIdx, colIdx),
                    1)
    
                    return false
                end
            end

            table.insert(tempData, rowData)
        elseif columns == 1 and rowDataType == "string" then
            table.insert(tempData, rowData)
        else
            outputDebugString(
                string.format("Nieprawidłowa struktura danych (idx: %d)!",
                    columns, rowIdx),
            1)
        end
    end

    SelectMenu.config.menuId = id
    SelectMenu.config.title = title
    SelectMenu.config.selected = 1
    SelectMenu.config.highlighted = 1
    SelectMenu.config.columns = columns
    SelectMenu.config.enableSounds = playSound
    SelectMenu.config.pageSize = elementsPerPage
    SelectMenu.config.rows = rowCount
    SelectMenu.config.data = tempData
    SelectMenu.config.isVisible = true
    SelectMenu.config.callbackEventName = ""
    --SelectMenu.config.restoreControl = isControlEnabled()

    addEventHandler("onClientRender", root, SelectMenu.draw)
    addEventHandler("onClientKey", root, SelectMenu.handleKeys)

    return true
end

SelectMenu.destroy = function()
    SelectMenu.config.isVisible = false
    
    removeEventHandler("onClientRender", root, SelectMenu.draw)
    removeEventHandler("onClientKey", root, SelectMenu.handleKeys)

    SelectMenu.config.menuId = 0
    SelectMenu.config.title = ""
    SelectMenu.config.isVisible = false
    SelectMenu.config.selected = 1
    SelectMenu.config.highlighted = 1
    SelectMenu.config.columns = 1
    SelectMenu.config.rows = 0
    SelectMenu.config.enableSounds = false
    SelectMenu.config.pageSize = 7
    SelectMenu.config.data = {}
    SelectMenu.config.callbackEventName = ""
end

SelectMenu.draw = function()
    local sizeX, sizeY = 582, 361
    local titleSizeY = 51
    local posX, posY = screenW / 2 - sizeX / 2, screenH / 2 - sizeY / 2

    -- Rysowanie menu
    dxDrawRectangle(posX, posY, sizeX, sizeY, tocolor(11, 0, 0, 167), false) -- Ramka
    dxDrawRectangle(posX, posY, sizeX, titleSizeY, tocolor(147, 0, 0, 255), false)  -- Tło tytułu
    dxDrawBorderedText(1, SelectMenu.config.title, posX, posY, posX + sizeX, posY + titleSizeY,
        tocolor(255, 255, 255, 255), 1.20, "diploma", "center", "center", false, false, false, false, false) -- Tytuł

    -- Rysowanie zaznaczanie i scroll-a
    local posOffxetY, offsetX, offsetY = 11, 10, 42
    local firstItemX, firstItemY = posX + offsetX, posY + titleSizeY + posOffxetY
    local itemSizeX, itemSizeY = 570, 32
    local i = SelectMenu.config.highlighted - 1
    dxDrawRectangle(firstItemX, firstItemY + (offsetY * i), itemSizeX - offsetX * 2, itemSizeY, tocolor(255, 255, 255, 170), false)
    
    local progressBarOffsetX, progressBarPosX = 10, posX + sizeX
    local progressBarSizeY = sizeY - titleSizeY - (offsetX * 2)
    local scrollSizeY = 32
    local scrollState = i / (SelectMenu.config.rows - 1)
    local scrollPositionY = firstItemY + (progressBarSizeY - itemSizeY) * scrollState
    dxDrawRectangle(progressBarPosX - progressBarOffsetX, firstItemY, 4, progressBarSizeY, tocolor(0, 0, 0, 150), false)
    dxDrawRectangle(progressBarPosX - progressBarOffsetX, scrollPositionY, 4, scrollSizeY, tocolor(254, 255, 255, 42), false)

    -- Rysowanie tekstów
    
end

SelectMenu.handleKeys = function(key, pressing)
    -- Scrollowanie
    if (key == "arrow_d" or key == "mouse_wheel_down") and pressing then
        local highlighted = SelectMenu.config.highlighted
        local selected = SelectMenu.config.selected

        if highlighted < SelectMenu.config.pageSize then
            SelectMenu.config.highlighted = highlighted + 1
        end

        if selected < SelectMenu.config.rows then
            SelectMenu.config.selected = selected + 1
        end
    elseif (key == "arrow_u" or key == "mouse_wheel_up") and pressing then
        local highlighted = SelectMenu.config.highlighted
        local selected = SelectMenu.config.selected

        if highlighted > 1 then
            SelectMenu.config.highlighted = highlighted - 1
        end

        if selected > 1 then
            SelectMenu.config.selected = selected - 1
        end
    elseif (key == "enter" or key == "lshift") and pressing then
        SelectMenu.destroy()
    elseif (key == "backspace" or key == "f") and pressing then
        SelectMenu.destroy()
    end
end

addCommandHandler("testmenu", function()
    if SelectMenu.config.isVisible then
        SelectMenu.destroy()
        outputChatBox("Hiding menu")
    else
        SelectMenu.create(1, "Test of Select Menu behaviours", {"test1", "test2", "test3", "test4", "test5", "test6", "test7"}, 1, 7, true)
        outputChatBox("Showing menu")
    end
end)

--[[



addEventHandler("onClientRender", root,
    function()
        dxDrawText("Item 1", 684, 421, 1053, 454, tocolor(1, 0, 0, 255), 1.50, "default-bold", "left", "center", false, false, true, false, false)
        dxDrawText("-$10,000", 1053, 421, 1223, 454, tocolor(1, 0, 0, 255), 1.50, "default-bold", "right", "center", false, false, true, false, false)
    end
)
]]