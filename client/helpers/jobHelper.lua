function getPlayerJob(player)
    if not isElement(player) or getElementType(player) ~= "player" then return false end
    return getElementData(player, "player.job", false) or false
end

function getJobName(jobId)
    if type(jobId) ~= "string" then return false end

    local jobDict = getElementData(root, "global.dict.job", false)

    for _, v in pairs(jobDict or {}) do
        if v.key == jobId then
            return v.value
        end
    end

    return false
end