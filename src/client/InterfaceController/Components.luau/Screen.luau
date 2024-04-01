local Players = game:GetService("Players")
local Screen = {}
Screen.__index = Screen

function Screen.new(Name)
     local self = setmetatable({}, Screen)

     self.IsElement = true
     self.Type = "Screen"

     self.Element = Instance.new("ScreenGui")
     self.Element.Parent = Players.LocalPlayer.PlayerGui
     self.Element.Name = Name or tostring("Screen"..math.random(100, 999))

     return self
end

function Screen:AddElement(El)
     if El.IsElement == true then
          El.Element.Parent = self.Element
     end
end

return Screen