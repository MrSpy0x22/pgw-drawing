function showClientGameText(style, text, duration, r, g, b)
    return GameText.show(style, text, duration, r, g, b)
end

function showClientSelectMenu(id, title, data, columns, elementsPerPage, color, eventName, sendToElement)
    return SelectMenu.create(id, title, data, columns, elementsPerPage, color, eventName, sendToElement)
end

function setClientPlayerBarVisible(visibilityFlag, forPlayer)
    forPlayer = forPlayer or localPlayer

    if visibilityFlag == true then
        PlayerBar.create(forPlayer)
    else
        PlayerBar.destroy()
    end
end