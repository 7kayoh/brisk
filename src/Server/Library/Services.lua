local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local TextService = game:GetService("TextService")

local Services = {}
local Private = {}

function Services.StartsWith(Sample, ComparingWith)
    assert(type(Sample) == "string", string.gsub(Private.EXPECT_GOT, "(REP)", {"Sample", "string", type(Sample)}))
    assert(type(ComparingWith) == "string", string.gsub(Private.EXPECT_GOT, "(REP)", {"ComparingWith", "string", type(ComparingWith)}))
    return string.sub(Sample, 1, #ComparingWith) == ComparingWith
end

function Services.GetPlayerWithName(Name, ShouldMatchFully)
    assert(type(Name) == "string", string.gsub(Private.EXPECT_GOT, "(REP)", {"Name", "string", type(Name)}))
    for _, player in ipairs(Players:GetPlayers()) do
        if ShouldMatchFully and Services.StartsWith(player.Name:lower(), Name:lower()) then
            return player
        elseif player.Name == Name then
            return player
        end
    end
end

function Services.GetPlayerWithDisplayName(DisplayName, ShouldMatchFully)
    assert(type(DisplayName) == "string", string.gsub(Private.EXPECT_GOT, "(REP)", {"Name", "string", type(DisplayName)}))
    for _, player in ipairs(Players:GetPlayers()) do
        if ShouldMatchFully and Services.StartsWith(player.DisplayName:lower(), DisplayName:lower()) then
            return player
        elseif player.DisplayName == DisplayName then
            return player
        end
    end
end

function Services.SetupPlayerWrapper(Player)
    assert(typeof(Player) == "player", string.gsub(Private.EXPECT_GOT, "(REP)", {"Player", "Player", typeof(Player)}))

    if not Services.PlayerWrapperList[Player.UserId] then
        Services.PlayerWrapperList[Player.UserId] = {
            ["Name"] = Player.Name,
            ["DisplayName"] = Player.DisplayName,
            ["UserId"] = Player.UserId,

            ["GetHumanoid"] = Services.GetHumanoid(Player)
        }
    end
end

function Services.GetHumanoid(Player)
    assert(typeof(Player) == "player", string.gsub(Private.EXPECT_GOT, "(REP)", {"Player", "Player", typeof(Player)}))
    return Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") or nil
end

return setmetatable({}, {
    __index = function(_, Index)
        return Services[Index] or game:GetService(Index)
    end,
    __newindex = Private
})