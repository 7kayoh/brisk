local StarterPlayer = game:GetService("StarterPlayer")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local client = script.Parent.Client
local shared = script.Parent.Shared
local server = script.Parent.Server

server.Name = "BriskServer"
shared.Name = "BriskShared"
client.Name = "BriskClient"
server.Parent = ServerScriptService
shared.Parent = ReplicatedStorage
client.Parent = StarterPlayer.StarterPlayerScripts

require(server.Runtime.Main)

return {}
