----
--

--[[
	This controller exists for mass distribution of common scripts into multiple objects united with tag.
]]

local BatchController = {}

----

local CollectionService = game:GetService("CollectionService")
local ServerStorage = game:GetService("ServerStorage")

----

local function assignDriverScripts()
	for _, driverSeat in CollectionService:GetTagged("VehicleSeat") do
		local seatScript = ServerStorage.Insertables.DriverSeatScript:Clone()
		seatScript.Parent = driverSeat
	end
end

local function assignPassangerScripts()
	for _, passangerSeat in CollectionService:GetTagged("PassangerSeat") do
		local seatScript = ServerStorage.Insertables.PassengerSeatScript:Clone()
		seatScript.Parent = passangerSeat
	end
end

----

function BatchController:Start()
	assignDriverScripts()
	assignPassangerScripts()
end

return BatchController