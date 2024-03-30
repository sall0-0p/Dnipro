local Button = {}
Button.__index = Button

function Button.new(Parent)
     local self = setmetatable({}, Button)

     self.Element = Instance.new("Frame")

     return self
end

return Button