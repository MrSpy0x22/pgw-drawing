--[[-------------------------------------------------
Notes:

> This code is using a relative image filepath. This will only work as long as the location it is from always exists, and the resource it is part of is running.
    To ensure it does not break, it is highly encouraged to move images into your local resource and reference them there.



GUIEditor = {
    staticimage = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        GUIEditor.staticimage[1] = guiCreateStaticImage(432, 828, 46, 39, ":pgw-drawing//resources/scores.png", false)


        GUIEditor.staticimage[2] = guiCreateStaticImage(505, 830, 46, 39, ":pgw-drawing//resources/scores.png", false)    
    end
)

addEventHandler("onClientRender", root,
    function()
        dxDrawRectangle(110, 822, 304, 200, tocolor(255, 255, 255, 255), false)
        dxDrawRectangle(424, 822, 63, 59, tocolor(1, 1, 1, 162), false)
        dxDrawRectangle(424, 891, 63, 59, tocolor(1, 1, 1, 162), false)
        dxDrawRectangle(424, 963, 63, 59, tocolor(1, 1, 1, 162), false)
        dxDrawRectangle(497, 822, 63, 59, tocolor(1, 1, 1, 162), false)
        dxDrawLine(428, 874, 481, 874, tocolor(104, 104, 104, 162), 1, false)
        dxDrawLine(428, 874, 465, 874, tocolor(255, 255, 255, 255), 3, false)
    end
)
--]]-------------------------------------------------