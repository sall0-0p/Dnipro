local List = {}
List.__index = List

function List.new(Name)
     local self = setmetatable({}, List)

     self.IsElement = true
     self.Type = "List"

     self.Element = Instance.new("Frame")
     self.Element.Name = Name or tostring("List"..math.random(100, 999))

     return self
end

function List:AddElement(El)
     if El.IsElement == true then
          El.Element.Parent = self.Element
     end
end

return List