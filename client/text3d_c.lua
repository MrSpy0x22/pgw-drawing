Text3D = {}

Text3D = {
    texts = {}
}

Text3D.addOrUpdate = function(id, text, x, y, z, distance, border, font, color, top, left, right, bottom, alignX,
    alignY, scaleX, scaleY, checkLOS)
    if type(id) ~= "string" then
        outputDebugString("Text3D musi posiadać tekstowy identyfikator!")
        return false
    end

    if type(text) ~= "string" or string.len(text) < 1 then
        outputDebugString("Text3D mie ma tekstu!")
        return false
    end

    -- Wartości domyślne
    border = type(border) == "number" and border > 0 and border or 0
    font = font or "default-bold"
    scaleX = scaleX or 1.1
    scaleY = scaleY or scaleX
    checkLOS = checkLOS == true
    alignX = alignX or "left"
    alignY = alignY or "top"

    -- Tworzenie obiektu tekstu
    Text3D.texts[id] = {
        text = text,
        color = color,
        border = border,
        font = font,
        scale = { x = scaleX, y = scaleY },
        distance = distance,
        align = { x = alignX, y = alignY },
        pos = { x = x, y = y, z = z },
        checkLOS = checkLOS
    }
end

Text3D.remove = function(id)
    if Text3D.texts[id] then
        Text3D.texts[id] = nil
        return true
    end

    return false
end

addEventHandler("onClientRender", root, function()
    for _, t in pairs(Text3D.texts) do
        local platyerX, playerY, playerZ = getElementPosition(localPlayer)
        local distance = getDistanceBetweenPoints3D(t.pos.x, t.pos.y, t.pos.z, platyerX, playerY, playerZ)

        if distance <= t.distance then
            local isLOSClear = isLineOfSightClear(t.pos.x, t.pos.y, t.pos.z, platyerX, playerY, playerZ)

            if not t.checkLOS or isLOSClear then
                dxDrawTextOnPosition(t.pos.x, t.pos.y, t.pos.z, t.text, t.border, 0, t.distance, t.color, 1,
                    "default-bold")
            end
        end
    end
end)
