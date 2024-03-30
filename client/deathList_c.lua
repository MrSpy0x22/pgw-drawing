DeathList = {}

DeathList.queue = {}

DeathList.addRecord = function(killedPlayer, killerPlayer, reason)
    return { player = killedPlayer, killer = killerPlayer, reason = reason }
end