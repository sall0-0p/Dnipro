local Components = {}

for _, m in script:GetChildren() do
     local r = require(m)
     Components[m.Name] = r
end

return Components