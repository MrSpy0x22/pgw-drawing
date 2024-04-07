function showClientGameText(style, text, duration, r, g, b)
    return GameText.show(style, text, duration, r, g, b)
end

function showClientSelectMenu(id, title, data, columns, elementsPerPage, color, eventName, sendToElement)
    return SelectMenu.create(id, title, data, columns, elementsPerPage, color, eventName, sendToElement)
end