local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LOG_PREFIX = "Brisk; "
local MODULE_CHECK_ERROR = "File \"(REP)\" is not a ModuleScript"
local EXPECT_GOT = "Argument \"(REP)\" expects type \"(REP)\", got type \"(REP)\""

local Server = script.Parent
local ServerLibrary = Server.Library
local Shared = ReplicatedStorage.SharedBrisk

local Logger = require(Shared.Logger)
local Maid = require(Shared.Maid)
local Promise = require(Shared.Promise)
local Services = require(ServerLibrary.Services)

local function InitializeEnvironments(module)
    module.LOG_PREFIX = LOG_PREFIX
    module.EXPECT_GOT = EXPECT_GOT
    module.Server = Server
    module.Shared = Shared
    module.Logger = Logger
    module.Maid = Maid
    module.Promise = Promise
end

InitializeEnvironments(Services)

return nil