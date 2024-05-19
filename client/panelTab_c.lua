--[[

local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientRender", root,
    function()
        dxDrawRectangle(110, 819, 303, 202, tocolor(127, 127, 127, 119), false)
        dxDrawRectangle(screenW * 0.0573, screenH * 0.6852, screenW * 0.1578, screenH * 0.0398, tocolor(1, 0, 0, 50), false)
        dxDrawText("Option line 1:", (screenW * 0.0625) - 1, (screenH * 0.6843) - 1, (screenW * 0.1573) - 1, (screenH * 0.7250) - 1, tocolor(0, 0, 0, 255), 1.50, "default", "left", "center", false, false, false, false, false)
        dxDrawText("Option line 1:", (screenW * 0.0625) + 1, (screenH * 0.6843) - 1, (screenW * 0.1573) + 1, (screenH * 0.7250) - 1, tocolor(0, 0, 0, 255), 1.50, "default", "left", "center", false, false, false, false, false)
        dxDrawText("Option line 1:", (screenW * 0.0625) - 1, (screenH * 0.6843) + 1, (screenW * 0.1573) - 1, (screenH * 0.7250) + 1, tocolor(0, 0, 0, 255), 1.50, "default", "left", "center", false, false, false, false, false)
        dxDrawText("Option line 1:", (screenW * 0.0625) + 1, (screenH * 0.6843) + 1, (screenW * 0.1573) + 1, (screenH * 0.7250) + 1, tocolor(0, 0, 0, 255), 1.50, "default", "left", "center", false, false, false, false, false)
        dxDrawText("Option line 1:", screenW * 0.0625, screenH * 0.6843, screenW * 0.1573, screenH * 0.7250, tocolor(255, 255, 255, 255), 1.50, "default", "left", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.0573, screenH * 0.6454, screenW * 0.1578, screenH * 0.0398, tocolor(1, 0, 0, 50), false)
        dxDrawText("Option line 2:", screenW * 0.0625, screenH * 0.6454, screenW * 0.1573, screenH * 0.6861, tocolor(255, 255, 255, 255), 1.50, "default", "left", "center", false, false, false, false, false)
        dxDrawText("5:00:00", (screenW * 0.1573) - 1, (screenH * 0.6843) - 1, (screenW * 0.2099) - 1, (screenH * 0.7250) - 1, tocolor(0, 0, 0, 255), 1.50, "default", "right", "center", false, false, false, false, false)
        dxDrawText("5:00:00", (screenW * 0.1573) + 1, (screenH * 0.6843) - 1, (screenW * 0.2099) + 1, (screenH * 0.7250) - 1, tocolor(0, 0, 0, 255), 1.50, "default", "right", "center", false, false, false, false, false)
        dxDrawText("5:00:00", (screenW * 0.1573) - 1, (screenH * 0.6843) + 1, (screenW * 0.2099) - 1, (screenH * 0.7250) + 1, tocolor(0, 0, 0, 255), 1.50, "default", "right", "center", false, false, false, false, false)
        dxDrawText("5:00:00", (screenW * 0.1573) + 1, (screenH * 0.6843) + 1, (screenW * 0.2099) + 1, (screenH * 0.7250) + 1, tocolor(0, 0, 0, 255), 1.50, "default", "right", "center", false, false, false, false, false)
        dxDrawText("5:00:00", screenW * 0.1573, screenH * 0.6843, screenW * 0.2099, screenH * 0.7250, tocolor(255, 255, 255, 255), 1.50, "default", "right", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.1620, screenH * 0.6574, screenW * 0.0479, screenH * 0.0185, tocolor(0, 0, 0, 254), false)
        dxDrawRectangle(screenW * 0.1635, screenH * 0.6602, screenW * 0.0448, screenH * 0.0130, tocolor(63, 0, 0, 254), false)
        dxDrawRectangle(screenW * 0.1635, screenH * 0.6602, screenW * 0.0333, screenH * 0.0130, tocolor(159, 0, 0, 254), false)
        dxDrawLine(screenW * 0.0573, screenH * 0.7407, screenW * 0.1339, screenH * 0.7407, tocolor(255, 255, 255, 255), 1, false)
        dxDrawLine(screenW * 0.1385, screenH * 0.7407, screenW * 0.2151, screenH * 0.7407, tocolor(255, 255, 255, 255), 1, false)
        dxDrawLine(screenW * 0.0573, screenH * 0.7407, screenW * 0.1339, screenH * 0.7407, tocolor(110, 11, 147, 254), 4, false)
        dxDrawRectangle(screenW * 0.0573, screenH * 0.6148, screenW * 0.1578, screenH * 0.0306, tocolor(1, 0, 0, 50), false)
        dxDrawText("EVENT NAME", (screenW * 0.0625) - 1, (screenH * 0.6148) - 1, (screenW * 0.2099) - 1, (screenH * 0.6454) - 1, tocolor(0, 0, 0, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawText("EVENT NAME", (screenW * 0.0625) + 1, (screenH * 0.6148) - 1, (screenW * 0.2099) + 1, (screenH * 0.6454) - 1, tocolor(0, 0, 0, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawText("EVENT NAME", (screenW * 0.0625) - 1, (screenH * 0.6148) + 1, (screenW * 0.2099) - 1, (screenH * 0.6454) + 1, tocolor(0, 0, 0, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawText("EVENT NAME", (screenW * 0.0625) + 1, (screenH * 0.6148) + 1, (screenW * 0.2099) + 1, (screenH * 0.6454) + 1, tocolor(0, 0, 0, 255), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawText("EVENT NAME", screenW * 0.0625, screenH * 0.6148, screenW * 0.2099, screenH * 0.6454, tocolor(155, 92, 2, 254), 0.80, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.0557, screenH * 0.6120, screenW * 0.1609, screenH * 0.1157, tocolor(1, 0, 0, 50), false)
    end
)]]