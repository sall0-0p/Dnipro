local Button = {}
Button.__index = Button

function Button.new(Name)
     local self = setmetatable({}, Button)

     self.IsElement = true
     self.Type = "Button"

     self.Element = Instance.new("TextButton")
     self.Element.Name = Name or tostring("Button"..math.random(100, 999))

     return self
end

return Button