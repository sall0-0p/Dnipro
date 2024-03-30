local RewardsList = {}

-- badges
RewardsList.Badges = {}
RewardsList.Badges["Welcome"] = {
     ["Id"] = 12734371392912,
     ["Name"] = "Welcome!",
}

-- gamepasses
RewardsList.Gamepasses = {}
RewardsList.Gamepasses["Test"] = {
     ["Id"] = 768560275,
     ["Name"] = "Test Gamepass",
}

-- dev products
RewardsList.DevProducts = {}
RewardsList.DevProducts["Test"] = {
     ["Id"] = "1789346392",
     ["Name"] = "Test Donate",
     ["Reward"] = function(Player: Player)
          Player.Character.Humanoid:TakeDamage(101)
     end
}

return RewardsList