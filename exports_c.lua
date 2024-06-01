function showClientGameText(style, text, duration, r, g, b)
    return GameText.show(style, text, duration, r, g, b)
end

function showClientSelectMenu(id, title, data, columns, elementsPerPage, color, eventName, sendToElement, formatType)
    return SelectMenu.create(id, title, data, columns, elementsPerPage, color, eventName, sendToElement, formatType)
end

function setClientPlayerBarVisible(visibilityFlag, forPlayer)
    forPlayer = forPlayer or localPlayer

    if visibilityFlag == true then
        PlayerBar.create(forPlayer)
    else
        PlayerBar.destroy()
    end
end

function addOrUpdateText3D(id, text, x, y, z, distance, border, font, color, top, left, right, bottom, alignX,
    alignY, scaleX, scaleY, checkLOS)
    Text3D.addOrUpdate(id, text, x, y, z, distance, border, font, color, top, left, right, bottom, alignX,
        alignY, scaleX, scaleY, checkLOS)
end

function removeText3D(id)
    Text3D.remove(id)
end