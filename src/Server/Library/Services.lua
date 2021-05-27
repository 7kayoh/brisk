local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local TextService = game:GetService("TextService")

local services = {}
local private = {}

function Services.StartsWith(sample, comparingWith)
    assert(type(sample) == "string", string.gsub(Private.EXPECT_GOT, "(REP)", {"Sample", "string", type(sample)}))
    assert(type(comparingWith) == "string", string.gsub(Private.EXPECT_GOT, "(REP)", {"ComparingWith", "string", type(CcmparingWith)}))
    return string.sub(sample, 1, #comparingWith) == comparingWith
end

function Services.GetPlayerWithName(name, shouldMatchFully)
    assert(type(name) == "string", string.gsub(Private.EXPECT_GOT, "(REP)", {"Name", "string", type(name)}))
    
    for _, player in ipairs(Players:GetPlayers()) do
        if ShouldMatchFully and Services.StartsWith(player.Name:lower(), name:lower()) then
            return player
            
        elseif player.Name == name then
            return player
        end
    end
end

function Services.GetPlayerWithDisplayName(displayName, shouldMatchFully)
    assert(type(displayName) == "string", string.gsub(Private.EXPECT_GOT, "(REP)", {"Name", "string", type(displayName)}))
    
    for _, player in ipairs(Players:GetPlayers()) do
        if shouldMatchFully and Services.StartsWith(player.DisplayName:lower(), displayName:lower()) then
            return player
            
        elseif player.DisplayName == displayName then
            return player
        end
    end
end

function Services.SetPlayerWrapper(player)
    assert(typeof(Player) == "player", string.gsub(Private.EXPECT_GOT, "(REP)", {"Player", "Player", typeof(player)}))

    if not Services.PlayerWrapperList[Player.UserId] then
        Services.PlayerWrapperList[Player.UserId] = {
            ["Name"] = Player.Name,
            ["DisplayName"] = Player.DisplayName,
            ["UserId"] = Player.UserId,

            ["GetHumanoid"] = Services.GetHumanoid(Player)
        }
    end
end

function Services.GetHumanoid(player)
    assert(typeof(Player) == "player", string.gsub(Private.EXPECT_GOT, "(REP)", {"Player", "Player", typeof(player)}))
    return player.Character and player.Character:FindFirstChildOfClass("Humanoid") 
end

return setmetatable({}, {
    __index = function(_, Index)
        return Services[Index] or game:GetService(Index)
    end,
        
    __newindex = Private
})
