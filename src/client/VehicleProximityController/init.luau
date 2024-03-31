----
--

--[[
	This is temporary module, I writted to handle ProximityPrompts in VehicleSeats and Seats
]]

local ProximityController = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local VehicleEvents = Remotes:WaitForChild("Vehicles")
local EnteredVehicleEvent: RemoteEvent = VehicleEvents:WaitForChild("EnteredVehicle")
local LeftVehicleEvent: RemoteEvent = VehicleEvents:WaitForChild("LeftVehicle")

----

local function onVehicleEntered(vehicle)
	print("Entered Vehicle")
	local DriverPrompts = CollectionService:GetTagged("VehicleDriverSeatPP")
	local PassengerPrompts = CollectionService:GetTagged("VehiclePassengerSeatPP")

	for _, prompt: ProximityPrompt in DriverPrompts do
		prompt.Enabled = false
	end

	for _, prompt: ProximityPrompt in PassengerPrompts do
		prompt.Enabled = false
	end
end

local function onVehicleLeft(vehicle)
	print("Left Vehicle")
	local DriverPrompts = CollectionService:GetTagged("VehicleDriverSeatPP")
	local PassengerPrompts = CollectionService:GetTagged("VehiclePassengerSeatPP")

	for _, prompt: ProximityPrompt in DriverPrompts do
		--local promptedCarOwner = prompt.Parent.Parent.Values.Owner.Value
		--if promptedCarOwner == Player or promptedCarOwner == nil then
			prompt.Enabled = true
		--end
	end

	for _, prompt: ProximityPrompt in PassengerPrompts do
		prompt.Enabled = true
	end
end

----

function ProximityController:Init()
	EnteredVehicleEvent.OnClientEvent:Connect(onVehicleEntered)
	LeftVehicleEvent.OnClientEvent:Connect(onVehicleLeft)
end

return ProximityController