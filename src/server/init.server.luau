local Shared = game.ReplicatedStorage.Shared
local Services = script:GetChildren()

local Promise = require(Shared.promise)

for _, ServeModule in Services do
     Promise.new(function()
          local Servi = require(ServeModule)
          if Servi.Init ~= nil then
               Servi:Init()
               warn("[".. ServeModule.Name .. "]: Service was initiated.")
          end
     end)
     :andThen(function()
          warn("[".. ServeModule.Name .. "]: Service was loaded.")
     end)
     :catch(function()
          warn("[".. ServeModule.Name .. "]: Service was not loaded due to errors.")
     end)
end