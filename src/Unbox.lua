-- Unbox.lua
-- @7kayoh
-- A simple run-once code to setup and initialize Brisk at runtime

-- Singletons
local StarterPlayer = game:GetService("StarterPlayer")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

-- Constants
local LOG_PREFIX = "Brisk; "
local MISSING_MSG = LOG_PREFIX .. "Folder \"(REP)\" seems to be missing"
local CORRUPTED_MSG = LOG_PREFIX .. "Folder \"(REP)\" is corrupted"

-- Variables
local Parent = script.Parent
local Client = Parent:FindFirstChild("Client")
local Shared = Parent:FindFirstChild("Shared")
local Server = Parent:FindFirstChild("Server")

-- Rules
assert(Server and Server:IsA("Folder"), string.gsub(MISSING_MSG, "(REP)", "Server"))
assert(Shared and Shared:IsA("Folder"), string.gsub(MISSING_MSG, "(REP)", "Shared"))
assert(Client and Client:IsA("Folder"), string.gsub(MISSING_MSG, "(REP)", "Client"))

assert(Server:FindFirstChild("Runtime") and Server:FindFirstChild("Library"), string.gsub(CORRUPTED_MSG, "(REP)", "Server"))
assert(Client:FindFirstChild("Runtime") and Client:FindFirstChild("Library"), string.gsub(CORRUPTED_MSG, "(REP)", "Client"))
assert(Server.Runtime:FindFirstChild("Main") and Server.Runtime:FindFirstChild("Main"):IsA("ModuleScript"), string.gsub(CORRUPTED_MSG, "(REP)", "Server"))
assert(Client.Runtime:FindFirstChild("Main") and Client.Runtime:FindFirstChild("Main"):IsA("ModuleScript"), string.gsub(CORRUPTED_MSG, "(REP)", "Client"))

-- Executables
Server.Name = "BriskServer"
Shared.Name = "BriskShared"
Client.Name = "BriskClient"
Server.Parent = ServerScriptService
Shared.Parent = ReplicatedStorage
Client.Parent = StarterPlayer.StarterPlayerScripts

require(Server.Runtime.Main)

return {}