function getLevelFromScores(scores)
    if type(scores) ~= "number" or scores < 0 then
        scores = 0
    end

    for i = 1, CLevelMax do
        local scoresForLevel = CLevelArray[i] or 0

        if scores < scoresForLevel then return i - 1
        elseif i == CLevelMax then return CLevelMax
        end
    end

    return 0
end

function getLevelProgressForScores(scores)
    local progress = 0

    if type(scores) == "number" then
        local levelFromScores = getLevelFromScores(scores)

        if scores > 0 and levelFromScores < CLevelMax then
            local low, high = CLevelArray[levelFromScores] or 0, CLevelArray[levelFromScores + 1]
            progress = ((scores - low) / (high - low)) * 100
        end
    end
    
    return progress
end