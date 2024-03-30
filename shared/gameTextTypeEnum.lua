GameTextTypeEnum = {}

GameTextTypeEnum.BIG_CENTER = 1
GameTextTypeEnum.BIG_TOP = 2
GameTextTypeEnum.STATUS = 3
GameTextTypeEnum.SCORES = 4
GameTextTypeEnum.DIALOG = 5
GameTextTypeEnum.AREA_NAME = 6
GameTextTypeEnum.VEH_NAME = 7
GameTextTypeEnum.DAMAGES = 8
GameTextTypeEnum.SHOUT = 9

GameTextTypeEnum.isValid = function(style)
    return type(style) == "number"
       and (style == GameTextTypeEnum.BIG_CENTER
        or style == GameTextTypeEnum.BIG_TOP
        or style == GameTextTypeEnum.STATUS
        or style == GameTextTypeEnum.SCORES
        or style == GameTextTypeEnum.DIALOG
        or style == GameTextTypeEnum.AREA_NAME
        or style == GameTextTypeEnum.VEH_NAME
        or style == GameTextTypeEnum.DAMAGES
        or style == GameTextTypeEnum.SHOUT)
end