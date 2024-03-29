Animator = {}

Animator.get = function(processorName)
    if processorName == "fadeInOut" then
        return FadeInOutAnim
    end

    return false
end