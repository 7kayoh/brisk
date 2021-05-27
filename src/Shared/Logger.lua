local Logs = {
    _Containers = {}
}

function Logs.new(Container, Message)
    if not Logs._Containers[Container] then
        Logs._Containers[Container] = {}
    end

    table.insert(Logs._Containers[Container], 1, {
        ["Timestamp"] = os.clock(),
        ["Message"] = Message
    })
end

function Logs:Get(Container)
    return Logs._Containers[Container] or {}
end

return Logs