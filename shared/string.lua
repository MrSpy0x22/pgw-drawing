String = {}

String.toNumber = function(numberValue, thousandSeparator, stringToAdd, isPostfix)
    stringToAdd = stringToAdd or ""
    thousandSeparator = thousandSeparator or " "
    isPostfix = isPostfix or false
    local out = false

    if type(numberValue) == "number" then
        if string.len(stringToAdd) > 0 and isPostfix then
            stringToAdd = " ".. stringToAdd
        end

        local numberAsText = tostring(numberValue)

        local _, _, minus, text, fraction = string.find(numberAsText, '([-]?)(%d+)([.]?%d*)')
        text = string.gsub(string.reverse(text), "(%d%d%d)", "%1".. thousandSeparator)

        if isPostfix then
            return minus .. string.gsub(string.reverse(text), "^".. thousandSeparator, "") .. fraction .. stringToAdd
        else
            return minus .. stringToAdd .. string.gsub(string.reverse(text), "^".. thousandSeparator, "")
        end

    end

    return false
end