

local screenW, screenH = guiGetScreenSize()

addEventHandler("onClientRender", root,
    function()
        dxDrawRectangle(screenW * 0.7797, screenH * 0.0000, screenW * 0.2203, screenH * 1.0000, tocolor(11, 0, 0, 151), false)
        dxDrawText("Shop Name", screenW * 0.7797, screenH * 0.0000, screenW * 0.9969, screenH * 0.1185, tocolor(255, 255, 255, 255), 2.00, "beckett", "center", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.7797, screenH * 0.0000, screenW * 0.2203, screenH * 0.1185, tocolor(169, 0, 0, 233), false)
        dxDrawLine(screenW * 0.7797, screenH * -0.0028, screenW * 0.7792, screenH * 0.9972, tocolor(169, 0, 0, 233), 2, false)
        dxDrawImage(screenW * 0.7844, screenH * 0.1278, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Item name (1)", screenW * 0.8250, screenH * 0.1278, screenW * 0.9948, screenH * 0.1833, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("$1000", screenW * 0.8250, screenH * 0.1537, screenW * 0.9948, screenH * 0.1833, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawImage(screenW * 0.7844, screenH * 0.3870, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7844, screenH * 0.3222, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7844, screenH * 0.2574, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7844, screenH * 0.1926, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7849, screenH * 0.4519, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7849, screenH * 0.5167, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7844, screenH * 0.5815, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7844, screenH * 0.6463, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7844, screenH * 0.7111, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7849, screenH * 0.7759, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7844, screenH * 0.8407, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.7844, screenH * 0.9056, screenW * 0.0349, screenH * 0.0556, ":guieditor/images/dot_white.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("Item name (2)", screenW * 0.8245, screenH * 0.1926, screenW * 0.9943, screenH * 0.2481, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("Item name (3)", screenW * 0.8250, screenH * 0.2574, screenW * 0.9948, screenH * 0.3130, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("Item name (4)", screenW * 0.8245, screenH * 0.3222, screenW * 0.9943, screenH * 0.3778, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("Item name (5)", screenW * 0.8250, screenH * 0.3870, screenW * 0.9948, screenH * 0.4426, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("Item name (6)", screenW * 0.8245, screenH * 0.4519, screenW * 0.9943, screenH * 0.5074, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("Item name (7)", screenW * 0.8250, screenH * 0.5167, screenW * 0.9948, screenH * 0.5722, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("Item name (8)", screenW * 0.8250, screenH * 0.5815, screenW * 0.9948, screenH * 0.6370, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("Item name (9)", screenW * 0.8245, screenH * 0.6463, screenW * 0.9943, screenH * 0.7019, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("Item name (10)", screenW * 0.8250, screenH * 0.7111, screenW * 0.9948, screenH * 0.7667, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("Item name (11)", screenW * 0.8245, screenH * 0.7759, screenW * 0.9943, screenH * 0.8315, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("Item name (12)", screenW * 0.8250, screenH * 0.8407, screenW * 0.9948, screenH * 0.8963, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("Item name (13)", screenW * 0.8245, screenH * 0.9056, screenW * 0.9943, screenH * 0.9611, tocolor(255, 255, 255, 255), 0.90, "bankgothic", "left", "top", false, false, false, false, false)
        dxDrawText("$2000", screenW * 0.8245, screenH * 0.2185, screenW * 0.9943, screenH * 0.2481, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawText("$3000", screenW * 0.8245, screenH * 0.2833, screenW * 0.9943, screenH * 0.3130, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawText("$4000", screenW * 0.8250, screenH * 0.3481, screenW * 0.9948, screenH * 0.3778, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawText("$5000", screenW * 0.8250, screenH * 0.4130, screenW * 0.9948, screenH * 0.4426, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawText("$6000", screenW * 0.8250, screenH * 0.4778, screenW * 0.9948, screenH * 0.5074, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawText("$7000", screenW * 0.8250, screenH * 0.5426, screenW * 0.9948, screenH * 0.5722, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawText("$8000", screenW * 0.8250, screenH * 0.6074, screenW * 0.9948, screenH * 0.6370, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawText("$9000", screenW * 0.8250, screenH * 0.6722, screenW * 0.9948, screenH * 0.7019, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawText("$10000", screenW * 0.8250, screenH * 0.7370, screenW * 0.9948, screenH * 0.7667, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawText("$11000", screenW * 0.8250, screenH * 0.8019, screenW * 0.9948, screenH * 0.8315, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawText("$12000", screenW * 0.8250, screenH * 0.8667, screenW * 0.9948, screenH * 0.8963, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawText("$13000", screenW * 0.8250, screenH * 0.9315, screenW * 0.9948, screenH * 0.9611, tocolor(255, 255, 255, 255), 0.80, "bankgothic", "left", "bottom", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.9974, screenH * 0.1185, screenW * 0.0026, screenH * 0.1000, tocolor(255, 255, 255, 255), false)
    end
)