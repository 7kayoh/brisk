-- Main.lua
-- @7kayoh
-- The core of Brisk for the server end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LOG_PREFIX = "Brisk; "
local MODULE_CHECK_ERROR = "File \"(REP)\" is not a ModuleScript"

local Server = script.Parent
local ServerLibrary = Server.Library
local Shared = ReplicatedStorage.SharedBrisk

local Logger = require(Shared.Logger)
local Maid = require(Shared.Maid)
local Promise = require(Shared.Promise)

local function InitializeEnvironments(module)
    assert(module:IsA("ModuleScript"), string.gsub(MODULE_CHECK_ERROR , "(REP)", ""))
end


return {}
