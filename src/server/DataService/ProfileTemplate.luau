return {
     LastLogin = 0; -- 0 - first join, tick - another join
     Settings = {
          Language = "Auto",
     };

     Bank = 100;

     CurrentCharacter = 0; -- 1-3, 0 - not choosed
     Characters = {
          [1] = {
               Bio = {               
                    Fullname = "", -- surname name
                    Weight = 10, -- kg
                    Height = 10, -- cm
                    Age = 0, -- >18
               };

               PlayTime =  0; -- start_tick()-end_tick()
               Cash = 100;

               Inventory =  {  }; -- "PM", "AK-74"

               Spendings = {
                    -- { Action = "Transfer", Amount = 100, ... },
               };

               Vehicles = {
                    -- { Gas = 100, Health = 100, Trunk = { ... } }
               };
               Jobs = {
                    -- ["Cleaner"] = { Experience = 0 }
               };
               Policing = {
                    Jailed = 0, -- tick()
                    Warnings = {
                         -- { Type = "Cite", Amount = 100, Reason = "Speeding", Officer = "System" },
                         -- { Type = "Warn", Reason = "Speeding", Officer = "System" },
                    }
               }
          };
          [2] = {  };
          [3] = {  };
     };

     Moderation = {
          Muted = 0, -- tick()
          Banned = 0, -- tick()
     };

     OwnedPrivateServers = {  }; -- 000000, 000001
}