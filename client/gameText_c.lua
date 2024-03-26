local screenW, screenH = guiGetScreenSize()

--[[-------------------------------------------------
Notes:

> This code is using a relative image filepath. This will only work as long as the location it is from always exists, and the resource it is part of is running.
    To ensure it does not break, it is highly encouraged to move images into your local resource and reference them there.
--]]-------------------------------------------------


GUIEditor = {
    staticimage = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        GUIEditor.staticimage[1] = guiCreateStaticImage(0.86, 0.34, 0.01, 0.02, ":guieditor/images/dot_white.png", true)


        GUIEditor.staticimage[2] = guiCreateStaticImage(0.86, 0.31, 0.01, 0.02, ":guieditor/images/dot_white.png", true)


        GUIEditor.staticimage[3] = guiCreateStaticImage(0.86, 0.37, 0.01, 0.02, ":guieditor/images/dot_white.png", true)


        GUIEditor.staticimage[4] = guiCreateStaticImage(0.86, 0.40, 0.01, 0.02, ":guieditor/images/dot_white.png", true)


        GUIEditor.staticimage[5] = guiCreateStaticImage(0.86, 0.43, 0.01, 0.02, ":guieditor/images/dot_white.png", true)


        GUIEditor.staticimage[6] = guiCreateStaticImage(0.86, 0.46, 0.01, 0.02, ":guieditor/images/dot_white.png", true)    
    end
)


addEventHandler("onClientRender", root,
    function()
        dxDrawText("*** Vercetti ***\n#FFFFFFThe player is shouting like hell!\nLine 2\nLine 3", (screenW * 0.2719) - 1, (screenH * 0.2185) - 1, (screenW * 0.7281) - 1, (screenH * 0.4185) - 1, tocolor(0, 0, 0, 255), 3.00, "default-bold", "center", "center", false, false, false, true, false)
        dxDrawText("*** Vercetti ***\n#FFFFFFThe player is shouting like hell!\nLine 2\nLine 3", (screenW * 0.2719) + 1, (screenH * 0.2185) - 1, (screenW * 0.7281) + 1, (screenH * 0.4185) - 1, tocolor(0, 0, 0, 255), 3.00, "default-bold", "center", "center", false, false, false, true, false)
        dxDrawText("*** Vercetti ***\n#FFFFFFThe player is shouting like hell!\nLine 2\nLine 3", (screenW * 0.2719) - 1, (screenH * 0.2185) + 1, (screenW * 0.7281) - 1, (screenH * 0.4185) + 1, tocolor(0, 0, 0, 255), 3.00, "default-bold", "center", "center", false, false, false, true, false)
        dxDrawText("*** Vercetti ***\n#FFFFFFThe player is shouting like hell!\nLine 2\nLine 3", (screenW * 0.2719) + 1, (screenH * 0.2185) + 1, (screenW * 0.7281) + 1, (screenH * 0.4185) + 1, tocolor(0, 0, 0, 255), 3.00, "default-bold", "center", "center", false, false, false, true, false)
        dxDrawText("*** Vercetti ***\n#FFFFFFThe player is shouting like hell!\nLine 2\nLine 3", screenW * 0.2719, screenH * 0.2185, screenW * 0.7281, screenH * 0.4185, tocolor(83, 83, 83, 255), 3.00, "default-bold", "center", "center", false, false, false, true, false)
        dxDrawText("Mission Passed!\n#FFFFFF+respect", (screenW * 0.2719) - 1, (screenH * 0.4278) - 1, (screenW * 0.7281) - 1, (screenH * 0.5917) - 1, tocolor(0, 0, 0, 255), 3.00, "pricedown", "center", "center", false, false, false, true, false)
        dxDrawText("Mission Passed!\n#FFFFFF+respect", (screenW * 0.2719) + 1, (screenH * 0.4278) - 1, (screenW * 0.7281) + 1, (screenH * 0.5917) - 1, tocolor(0, 0, 0, 255), 3.00, "pricedown", "center", "center", false, false, false, true, false)
        dxDrawText("Mission Passed!\n#FFFFFF+respect", (screenW * 0.2719) - 1, (screenH * 0.4278) + 1, (screenW * 0.7281) - 1, (screenH * 0.5917) + 1, tocolor(0, 0, 0, 255), 3.00, "pricedown", "center", "center", false, false, false, true, false)
        dxDrawText("Mission Passed!\n#FFFFFF+respect", (screenW * 0.2719) + 1, (screenH * 0.4278) + 1, (screenW * 0.7281) + 1, (screenH * 0.5917) + 1, tocolor(0, 0, 0, 255), 3.00, "pricedown", "center", "center", false, false, false, true, false)
        dxDrawText("Mission Passed!\n#FFFFFF+respect", screenW * 0.2719, screenH * 0.4278, screenW * 0.7281, screenH * 0.5917, tocolor(243, 153, 11, 255), 3.00, "pricedown", "center", "center", false, false, false, true, false)
        dxDrawText("Drzwi: #FFFFFFotwarte\nLinia 2", (screenW * 0.2719) - 1, (screenH * 0.6009) - 1, (screenW * 0.7281) - 1, (screenH * 0.6917) - 1, tocolor(0, 0, 0, 255), 1.40, "bankgothic", "center", "center", false, true, false, true, false)
        dxDrawText("Drzwi: #FFFFFFotwarte\nLinia 2", (screenW * 0.2719) + 1, (screenH * 0.6009) - 1, (screenW * 0.7281) + 1, (screenH * 0.6917) - 1, tocolor(0, 0, 0, 255), 1.40, "bankgothic", "center", "center", false, true, false, true, false)
        dxDrawText("Drzwi: #FFFFFFotwarte\nLinia 2", (screenW * 0.2719) - 1, (screenH * 0.6009) + 1, (screenW * 0.7281) - 1, (screenH * 0.6917) + 1, tocolor(0, 0, 0, 255), 1.40, "bankgothic", "center", "center", false, true, false, true, false)
        dxDrawText("Drzwi: #FFFFFFotwarte\nLinia 2", (screenW * 0.2719) + 1, (screenH * 0.6009) + 1, (screenW * 0.7281) + 1, (screenH * 0.6917) + 1, tocolor(0, 0, 0, 255), 1.40, "bankgothic", "center", "center", false, true, false, true, false)
        dxDrawText("Drzwi: #FFFFFFotwarte\nLinia 2", screenW * 0.2719, screenH * 0.6009, screenW * 0.7281, screenH * 0.6917, tocolor(3, 162, 44, 255), 1.40, "bankgothic", "center", "center", false, true, false, true, false)
        dxDrawText("+$10,000\n+5 xpkt\n+5 rep", (screenW * 0.2719) - 1, (screenH * 0.7009) - 1, (screenW * 0.7281) - 1, (screenH * 0.8028) - 1, tocolor(0, 0, 0, 255), 1.20, "pricedown", "center", "bottom", false, false, false, true, false)
        dxDrawText("+$10,000\n+5 xpkt\n+5 rep", (screenW * 0.2719) + 1, (screenH * 0.7009) - 1, (screenW * 0.7281) + 1, (screenH * 0.8028) - 1, tocolor(0, 0, 0, 255), 1.20, "pricedown", "center", "bottom", false, false, false, true, false)
        dxDrawText("+$10,000\n+5 xpkt\n+5 rep", (screenW * 0.2719) - 1, (screenH * 0.7009) + 1, (screenW * 0.7281) - 1, (screenH * 0.8028) + 1, tocolor(0, 0, 0, 255), 1.20, "pricedown", "center", "bottom", false, false, false, true, false)
        dxDrawText("+$10,000\n+5 xpkt\n+5 rep", (screenW * 0.2719) + 1, (screenH * 0.7009) + 1, (screenW * 0.7281) + 1, (screenH * 0.8028) + 1, tocolor(0, 0, 0, 255), 1.20, "pricedown", "center", "bottom", false, false, false, true, false)
        dxDrawText("+$10,000\n+5 xpkt\n+5 rep", screenW * 0.2719, screenH * 0.7009, screenW * 0.7281, screenH * 0.8028, tocolor(255, 255, 255, 255), 1.20, "pricedown", "center", "bottom", false, false, false, true, false)
        dxDrawText("San Fierro", (screenW * 0.6240) - 1, (screenH * 0.8028) - 1, (screenW * 0.9891) - 1, (screenH * 0.8722) - 1, tocolor(0, 0, 0, 255), 2.50, "beckett", "right", "center", false, true, false, false, false)
        dxDrawText("San Fierro", (screenW * 0.6240) + 1, (screenH * 0.8028) - 1, (screenW * 0.9891) + 1, (screenH * 0.8722) - 1, tocolor(0, 0, 0, 255), 2.50, "beckett", "right", "center", false, true, false, false, false)
        dxDrawText("San Fierro", (screenW * 0.6240) - 1, (screenH * 0.8028) + 1, (screenW * 0.9891) - 1, (screenH * 0.8722) + 1, tocolor(0, 0, 0, 255), 2.50, "beckett", "right", "center", false, true, false, false, false)
        dxDrawText("San Fierro", (screenW * 0.6240) + 1, (screenH * 0.8028) + 1, (screenW * 0.9891) + 1, (screenH * 0.8722) + 1, tocolor(0, 0, 0, 255), 2.50, "beckett", "right", "center", false, true, false, false, false)
        dxDrawText("San Fierro", screenW * 0.6240, screenH * 0.8028, screenW * 0.9891, screenH * 0.8722, tocolor(255, 255, 255, 255), 2.50, "beckett", "right", "center", false, true, false, false, false)
        dxDrawText("<< Vercetti | -10.7 HP\n>> Vercetti | -56.4 HP", screenW * 0.6542, screenH * 0.8815, screenW * 0.9891, screenH * 0.9157, tocolor(255, 255, 255, 255), 1.10, "sans", "right", "center", false, false, false, false, false)
        dxDrawText("Maverick", screenW * 0.6240, screenH * 0.7241, screenW * 0.9891, screenH * 0.7935, tocolor(255, 255, 255, 255), 2.00, "bankgothic", "right", "center", false, true, false, false, false)
        dxDrawText("Player 2-2", screenW * 0.8745, screenH * 0.3444, screenW * 0.9604, screenH * 0.3648, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("Player 2-1", screenW * 0.8745, screenH * 0.3148, screenW * 0.9604, screenH * 0.3352, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("Player 2-3", screenW * 0.8745, screenH * 0.3741, screenW * 0.9604, screenH * 0.3944, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("Player 2-4", screenW * 0.8745, screenH * 0.4037, screenW * 0.9604, screenH * 0.4241, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("Player 2-5", screenW * 0.8745, screenH * 0.4333, screenW * 0.9604, screenH * 0.4537, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("Player 2-6", screenW * 0.8745, screenH * 0.4630, screenW * 0.9604, screenH * 0.4833, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("Player 1-1", screenW * 0.7651, screenH * 0.3148, screenW * 0.8510, screenH * 0.3352, tocolor(255, 255, 255, 255), 1.00, "default-bold", "right", "center", false, false, false, false, false)
        dxDrawText("Player 1-1", screenW * 0.7651, screenH * 0.3444, screenW * 0.8510, screenH * 0.3648, tocolor(255, 255, 255, 255), 1.00, "default-bold", "right", "center", false, false, false, false, false)
        dxDrawText("Player 1-1", screenW * 0.7651, screenH * 0.3741, screenW * 0.8510, screenH * 0.3944, tocolor(255, 255, 255, 255), 1.00, "default-bold", "right", "center", false, false, false, false, false)
        dxDrawText("Player 1-1", screenW * 0.7651, screenH * 0.4037, screenW * 0.8510, screenH * 0.4241, tocolor(255, 255, 255, 255), 1.00, "default-bold", "right", "center", false, false, false, false, false)
        dxDrawText("Player 1-1", screenW * 0.7651, screenH * 0.4333, screenW * 0.8510, screenH * 0.4537, tocolor(255, 255, 255, 255), 1.00, "default-bold", "right", "center", false, false, false, false, false)
        dxDrawText("Player 1-1", screenW * 0.7651, screenH * 0.4630, screenW * 0.8510, screenH * 0.4833, tocolor(255, 255, 255, 255), 1.00, "default-bold", "right", "center", false, false, false, false, false)
        dxDrawText("Message!", screenW * 0.2719, screenH * 0.1287, screenW * 0.7281, screenH * 0.2093, tocolor(243, 153, 11, 255), 2.00, "pricedown", "center", "bottom", false, false, false, true, false)
    end
)

GameText = {}

GameText.BIG_CENTER = 1

GameText.show = function(style, text, time, color)
	if style == GameText.BIG_CENTER then
		dxDrawBorderedText(2, text, screenW * 0.2719, screenH * 0.4278, screenW * 0.7281, screenH * 0.5917, tocolor(255, 255, 0, 255), 3, 3, "pricedown", "center", "center", false, false, true, true, false)
	end
end