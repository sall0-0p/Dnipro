local EconomyService = {}

EconomyService.DealershipService = nil
EconomyService.HousingService = nil
EconomyService.ShopService = nil

function EconomyService:Init()
     EconomyService.DealershipService = require(script.DealershipService)
     EconomyService.HousingService = require(script.HousingService)
     EconomyService.ShopService = require(script.ShopService)
end

return EconomyService