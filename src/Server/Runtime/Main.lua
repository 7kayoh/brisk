-- Main.lua
-- @7kayoh
-- The core of Brisk for the server end

-- Singletons
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Constants
local LOG_PREFIX = "Brisk; "
local IS_NOT_MODULESCRIPT = "File \"(REP)\" is not a ModuleScript"

-- Variables
local Server = script.Parent
local ServerLibrary = Server:FindFirstChild("Library")
local Shared = ReplicatedStorage:FindFirstChild("SharedBrisk")

local Logger = require(Shared:FindFirstChild("Logger"))
local Maid = require(Shared:FindFirstChild("Maid"))
local Promise = require(Shared:FindFirstChild("Promise"))

-- Functions
local function InitializeEnvironments(Module)
    assert(Module:IsA("ModuleScript"), string.gsub(IS_NOT_MODULESCRIPT, "(REP)", ""))
end

-- Rules

-- Executables

return {}