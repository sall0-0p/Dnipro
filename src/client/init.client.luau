local Players = game:GetService("Players")
local Controllers = script:GetChildren()

for _, ControlModule in Controllers do
     local Control = require(ControlModule)
     if Control.Init ~= nil then
          task.spawn(function()
               Control:Init()
               warn("["..ControlModule.Name .. "]: Controller initiated.")
          end)
     end
end

Players.LocalPlayer.CharacterAdded:Connect(function(Character)
     for _, ControlModule in Controllers do
          local Control = require(ControlModule)
          if Control.Start ~= nil then
               task.spawn(function()
                    Control:Start(Character)
                    warn("["..ControlModule.Name .. "]: Controller started.")
               end)
          end
     end
end)