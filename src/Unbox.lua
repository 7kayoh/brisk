local StarterPlayer = game:GetService("StarterPlayer")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local Client = Parent:FindFirstChild("Client")
local Shared = Parent:FindFirstChild("Shared")
local Server = Parent:FindFirstChild("Server")

Server.Name = "BriskServer"
Shared.Name = "BriskShared"
Client.Name = "BriskClient"
Server.Parent = ServerScriptService
Shared.Parent = ReplicatedStorage
Client.Parent = StarterPlayer.StarterPlayerScripts

require(Server.Runtime.Main)

return {}
