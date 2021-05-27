local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local TextService = game:GetService("TextService")

local WAIT_FOR_CHILD_TIMEOUT = 15

local Service = {}
local private = {}

function Service.StartsWith(sample, comparingWith)
    assert(type(sample) == "string", string.gsub(private.EXPECT_GOT, "(REP)", {"Sample", "string", type(sample)}))
    assert(type(comparingWith) == "string", string.gsub(private.EXPECT_GOT, "(REP)", {"ComparingWith", "string", type(comparingWith)}))
    return string.sub(sample, 1, #comparingWith) == comparingWith
end

function Service.GetPlayerWithName(name, shouldMatchFully)
    assert(type(name) == "string", string.gsub(private.EXPECT_GOT, "(REP)", {"Name", "string", type(name)}))
    
    for _, player in ipairs(Players:GetPlayers()) do
        if shouldMatchFully and Service.StartsWith(player.Name:lower(), name:lower()) then
            return player
            
        elseif player.Name == name then
            return player
        end
    end
end

function Service.GetPlayerWithDisplayName(displayName, shouldMatchFully)
    assert(type(displayName) == "string", string.gsub(private.EXPECT_GOT, "(REP)", {"Name", "string", type(displayName)}))
    
    for _, player in ipairs(Players:GetPlayers()) do
        if shouldMatchFully and Service.StartsWith(player.DisplayName:lower(), displayName:lower()) then
            return player
            
        elseif player.DisplayName == displayName then
            return player
        end
    end
end

function Service.SetPlayerWrapper(player)
    assert(typeof(player) == "player", string.gsub(private.EXPECT_GOT, "(REP)", {"Player", "Player", typeof(player)}))

    if not Service.PlayerWrapperList[player.UserId] then
        Service.PlayerWrapperList[player.UserId] = {
            Name = player.Name,
            DisplayName = player.DisplayName,
            UserId = player.UserId,
            GetHumanoid = Service.GetHumanoid(player)
        }
    end
end

function Service.GetHumanoid(player)
    assert(typeof(player) == "player", string.gsub(private.EXPECT_GOT, "(REP)", {"Player", "Player", typeof(player)}))

    local character = player.Character or player.CharacterAdded:Wait()
    return character:WaitForChild("Humanoid", WAIT_FOR_CHILD_TIMEOUT) 
end

return setmetatable({}, {
    __index = function(_, Index)
        return Service[Index] or game:GetService(Index)
    end,
        
    __newindex = private
})
