local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local ProfileService = require(script.ProfileService)
local ProfileTemplate = require(script.ProfileTemplate)

local ProfileStore = ProfileService.GetProfileStore("PlayerData01", ProfileTemplate)

local DataService = {}

DataService.Profiles = {}

function DataService.ProcessReceipt(ReceiptInfo)
     print("anyone anything bought")
end

function DataService:PreparePlayer(Player, Profile)
     print("prepare profile of player")
end

function DataService.PlayerAdded(Player: Player)
     local profile = ProfileStore:LoadProfileAsync("Player"..Player.UserId)
     if profile ~= nil then
          profile:AddUserId(Player.UserId)
          profile:Reconcile()
          profile:ListenToRelease(function()
               DataService.Profiles[Player] = nil
               Player:Kick("Data Service Error 02")
          end)
          if Player:IsDescendantOf(Players) then
               DataService.Profiles[Player] = profile
               DataService:PreparePlayer(Player, profile)
          else
               profile:Release()
          end
     else
          Player:Kick("Data Service Error 01")
     end
end

function DataService.PlayerRemoved(Player)

end

function DataService:Init()
     for _, Player in Players:GetPlayers() do
          task.spawn(DataService.PlayerAdded, Player)
     end

     MarketplaceService.ProcessReceipt = DataService.ProcessReceipt

     Players.PlayerAdded:Connect(DataService.PlayerAdded)

     Players.PlayerRemoving:Connect(function(Player)
          local profile = DataService.Profiles[Player]
          if profile ~= nil then
               profile:Release()
          end
     end)

     return true
end

return DataService