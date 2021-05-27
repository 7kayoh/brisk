local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LOG_PREFIX = "Brisk; "
local EXPECT_GOT = "Argument \"(REP)\" expects type \"(REP)\", got type \"(REP)\""

local Server = script.Parent
local ServerLibrary = Server.Library
local Shared = ReplicatedStorage.SharedBrisk

local Logger = require(Shared.Logger)
local Maid = require(Shared.Maid)
local Promise = require(Shared.Promise)
local Services = require(ServerLibrary.Services)

local function LogInternally(message)
    assert(type(message) == "string", string.gsub(EXPECT_GOT, "(REP)", {"Message", "string", type(message)}))
    Logger.new("Internal", ("%s : %s"):format(script.Name, message))
end

local function InitializeEnvironments(module)
    module.LOG_PREFIX = LOG_PREFIX
    module.EXPECT_GOT = EXPECT_GOT
    module.Server = Server
    module.Shared = Shared
    module.Logger = Logger
    module.Maid = Maid
    module.Promise = Promise
end

LogInternally("PreInit")
InitializeEnvironments(Services)
LogInternally("AfterInit")

return nil