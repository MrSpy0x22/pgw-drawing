-- https://wiki.multitheftauto.com/wiki/DxDrawBorderedText
function dxDrawBorderedText(outline, text, left, top, right, bottom, color, scaleX, scaleY, font, alignX, alignY, clip, wordBreak, postGUI, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    clip = clip == true
    wordBreak = wordBreak == true
    postGUI = postGUI == true
    subPixelPositioning = subPixelPositioning == true
    fRotation = fRotation or 0
    fRotationCenterX = fRotationCenterX or 0
    fRotationCenterY = fRotationCenterY or 0
    
    local outlineX = (scaleX or 1) * (1.333333333333334 * (outline or 1))
    local outlineY = (scaleY or 1) * (1.333333333333334 * (outline or 1))

    dxDrawText(string.gsub(text, "#%x%x%x%x%x%x", "#000000"), left - outlineX, top - outlineY, right - outlineX, bottom - outlineY, tocolor (0, 0, 0), scaleX, scaleY, font, alignX, alignY, clip, wordBreak, postGUI, true, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(string.gsub(text, "#%x%x%x%x%x%x", "#000000"), left + outlineX, top - outlineY, right + outlineX, bottom - outlineY, tocolor (0, 0, 0), scaleX, scaleY, font, alignX, alignY, clip, wordBreak, postGUI, true, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(string.gsub(text, "#%x%x%x%x%x%x", "#000000"), left - outlineX, top + outlineY, right - outlineX, bottom + outlineY, tocolor (0, 0, 0), scaleX, scaleY, font, alignX, alignY, clip, wordBreak, postGUI, true, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(string.gsub(text, "#%x%x%x%x%x%x", "#000000"), left + outlineX, top + outlineY, right + outlineX, bottom + outlineY, tocolor (0, 0, 0), scaleX, scaleY, font, alignX, alignY, clip, wordBreak, postGUI, true, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(string.gsub(text, "#%x%x%x%x%x%x", "#000000"), left - outlineX, top, right - outlineX, bottom, tocolor (0, 0, 0), scaleX, scaleY, font, alignX, alignY, clip, wordBreak, postGUI, true, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(string.gsub(text, "#%x%x%x%x%x%x", "#000000"), left + outlineX, top, right + outlineX, bottom, tocolor (0, 0, 0), scaleX, scaleY, font, alignX, alignY, clip, wordBreak, postGUI, true, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(string.gsub(text, "#%x%x%x%x%x%x", "#000000"), left, top - outlineY, right, bottom - outlineY, tocolor (0, 0, 0), scaleX, scaleY, font, alignX, alignY, clip, wordBreak, postGUI, true, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(string.gsub(text, "#%x%x%x%x%x%x", "#000000"), left, top + outlineY, right, bottom + outlineY, tocolor (0, 0, 0), scaleX, scaleY, font, alignX, alignY, clip, wordBreak, postGUI, true, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    dxDrawText(text, left, top, right, bottom, color, scaleX, scaleY, font, alignX, alignY, clip, wordBreak, postGUI, true, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
end

-- https://wiki.multitheftauto.com/wiki/DxDrawTextOnElement
function dxDrawTextOnPosition(x, y, z, text, border, height, distance, color, size, font)
	local x2, y2, z2 = getCameraMatrix()
	local distance = distance or 20
	local height = height or 1

	if (isLineOfSightClear(x, y, z + 2, x2, y2, z2)) then
		local sx, sy = getScreenFromWorldPosition(x, y, z + height)
		if (sx) and (sy) then
			local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
			if (distanceBetweenPoints < distance) then
                dxDrawBorderedText(border, text, sx + 2, sy + 2, sx, sy, color,
                    size, size, --[[(size or 1) - (distanceBetweenPoints / distance),]] font or "arial", "center", "center")

                return true
			end
		end
	end

    return false
end

function getProgress(startTime, ticksToAdd)
    local elapsed = getTickCount() - startTime
    local duration = (startTime + ticksToAdd) - startTime

    return elapsed / duration
end