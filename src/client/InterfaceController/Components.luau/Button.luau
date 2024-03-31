local Button = {}
Button.__index = Button

function Button.new(Parent)
     local self = setmetatable({}, Button)

     self.Element = Instance.new("")

     return self
end

return Button