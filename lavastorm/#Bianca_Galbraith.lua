-- lavastorm/#Bianca_Galbraith.lua

--[[
  Testing sql with live task ids and first step (basics)

  todo: "touch" task objectives should be able to specify a switch (door) id and let source automatically update that way

  INSERT INTO `tasks` VALUES (4780,1,21600,0,'Simple Task [68+]','placeholder','Fix and implement rewards',57208,0,0,2,0,0,1,0,''),(4793,1,21600,0,'The Creator [60]','We have word of a creator of statues within the isles of Thundercrest. We\'re not yet sure who is commissioning these creatures for the dragon that resides there, but we do know that not all are yet functioning as they should be.<BR><BR>[2,3,Your first clue is that the defunct statues may yet be waiting in the Garden of Yar`Lir.  Seek them out and destroy them.] [4,The rumbling you just felt must have been a sentry that is fully automated! Judging by the magnitude of the power, it must be nearby. Search for this beast and destroy it before it has a chance to destroy you!] [5,Time is short but you must take the energy crystal that has been left behind. Its use is unclear just yet, but the pulsating emissions that you can sense draws you ever closer to it.] [6,Now that you have the crystal in your grasp, you must identify the crystal to uncover it\'s hidden heritage. Such information may give you a better understanding as to who, or what, is creating these statues.] [7,The crystal\'s deeply ensconced knowledge has shown you that there is one creator of the statues. This being is a direct underling to the great dragon of these isles, Yar`Lir. You must find this creator and slay him before he can bring to life any of his latest creations!]','Fix and implement rewards',57208,0,0,2,0,0,1,0,''),(4794,1,21600,0,'The Creator [65]','We have word of a creator of statues within the isles of Thundercrest. We\'re not yet sure who is commissioning these creatures for the dragon that resides there, but we do know that not all are yet functioning as they should be.<BR><BR>[2,3,Your first clue is that the defunct statues may yet be waiting in the Garden of Yar`Lir.  Seek them out and destroy them.] [4,The rumbling you just felt must have been a sentry that is fully automated! Judging by the magnitude of the power, it must be nearby. Search for this beast and destroy it before it has a chance to destroy you!] [5,Time is short but you must take the energy crystal that has been left behind. Its use is unclear just yet, but the pulsating emissions that you can sense draws you ever closer to it.] [6,Now that you have the crystal in your grasp, you must identify the crystal to uncover it\'s hidden heritage. Such information may give you a better understanding as to who, or what, is creating these statues.] [7,The crystal\'s deeply ensconced knowledge has shown you that there is one creator of the statues. This being is a direct underling to the great dragon of these isles, Yar`Lir. You must find this creator and slay him before he can bring to life any of his latest creations!]','Fix and implement rewards',57208,0,0,2,0,0,1,0,''),(4795,1,21600,0,'The Creator [68+]','We have word of a creator of statues within the isles of Thundercrest. We\'re not yet sure who is commissioning these creatures for the dragon that resides there, but we do know that not all are yet functioning as they should be.<BR><BR>[2,3,Your first clue is that the defunct statues may yet be waiting in the Garden of Yar`Lir.  Seek them out and destroy them.] [4,The rumbling you just felt must have been a sentry that is fully automated! Judging by the magnitude of the power, it must be nearby. Search for this beast and destroy it before it has a chance to destroy you!] [5,Time is short but you must take the energy crystal that has been left behind. Its use is unclear just yet, but the pulsating emissions that you can sense draws you ever closer to it.] [6,Now that you have the crystal in your grasp, you must identify the crystal to uncover it\'s hidden heritage. Such information may give you a better understanding as to who, or what, is creating these statues.] [7,The crystal\'s deeply ensconced knowledge has shown you that there is one creator of the statues. This being is a direct underling to the great dragon of these isles, Yar`Lir. You must find this creator and slay him before he can bring to life any of his latest creations!]','Fix and implement rewards',57208,0,0,2,0,0,1,0,'');
  INSERT INTO `task_activities` VALUES (4780,0,1,11,'the portal to Thundercrest Isles','','-1','0','',0,2,1,0,'337',0),(4793,0,1,11,'the portal to Thundercrest Isles','','-1','0','',0,2,1,0,'337',0),(4794,0,1,11,'the portal to Thundercrest Isles','','-1','0','',0,2,1,0,'337',0),(4795,0,1,11,'the portal to Thundercrest Isles','','-1','0','',0,2,1,0,'337',0);
--]]

-- todo: level scaling versions would need to be handled (3 level-based versions per mission)
-- todo: consider implementing a compass switch id to get the coords more easily

-- all Bianca missions use the same dz entrance
local thundercrest_compass    = { zone="broodlands", x=1241.88, y=511.147, z=23.4192 } -- switch id 5
local thundercrest_safereturn = { zone="broodlands", x=1242.0, y=526.0, z=27.0, h=0.0 }

local simple_task = {
  instance   = { zone="thundercrest", version=instance_version.thundercrest_isles_simple_task },
  compass    = thundercrest_compass,
  safereturn = thundercrest_safereturn
}

local throes_of_contagion = {
  instance   = { zone="thundercrest", version=instance_version.thundercrest_isles_throes_of_contagion },
  compass    = thundercrest_compass,
  safereturn = thundercrest_safereturn,
}

local scions_of_thundercrest = {
  instance   = { zone="thundercrest", version=instance_version.thundercrest_isles_scions_of_thundercrest },
  compass    = thundercrest_compass,
  safereturn = thundercrest_safereturn
}

local splitting_the_storm = {
  instance   = { zone="thundercrest", version=instance_version.thundercrest_isles_splitting_the_storm },
  compass    = thundercrest_compass,
  safereturn = thundercrest_safereturn
}

local holy_hour = {
  instance   = { zone="thundercrest", version=instance_version.thundercrest_isles_holy_hour },
  compass    = thundercrest_compass,
  safereturn = thundercrest_safereturn
}

local the_creator = {
  instance   = { zone="thundercrest", version=instance_version.thundercrest_isles_the_creator },
  compass    = thundercrest_compass,
  safereturn = thundercrest_safereturn,
  zonein     = { x=1641.0, y=-646.0, z=114.0, h=54.0 } -- todo: could be excluded if zone-in heading in table made accurate
}

local lair_unguarded = {
  instance   = { zone="thundercrest", version=instance_version.thundercrest_isles_lair_unguarded },
  compass    = thundercrest_compass,
  safereturn = thundercrest_safereturn
}

local behind_closed_doors = {
  instance   = { zone="thundercrest", version=instance_version.thundercrest_isles_behind_closed_doors },
  compass    = thundercrest_compass,
  safereturn = thundercrest_safereturn
}

-- todo: version for this is missing from db
local house_of_the_autumn_rose = {
--   instance   = { zone="thundercrest", version=instance_version. },
  compass    = thundercrest_compass,
  safereturn = thundercrest_safereturn
}

local missions = {
  [4778] = { min_faction = Faction.Apprehensive, dz = simple_task },           -- Simple Task [60]
  [4779] = { min_faction = Faction.Apprehensive, dz = simple_task },           -- Simple Task [65]
  [4780] = { min_faction = Faction.Apprehensive, dz = simple_task },           -- Simple Task [68+]
  [4803] = { min_faction = Faction.Apprehensive, dz = throes_of_contagion },   -- Throes of Contagion [60]
  [4804] = { min_faction = Faction.Apprehensive, dz = throes_of_contagion },   -- Throes of Contagion [65]
  [4805] = { min_faction = Faction.Apprehensive, dz = throes_of_contagion },   -- Throes of Contagion [68+]

  [4796] = { min_faction = Faction.Indifferent, dz = scions_of_thundercrest }, -- Scions of Thundercrest [60]
  [4797] = { min_faction = Faction.Indifferent, dz = scions_of_thundercrest }, -- Scions of Thundercrest [65]
  [4798] = { min_faction = Faction.Indifferent, dz = scions_of_thundercrest }, -- Scions of Thundercrest [68+]
  [4800] = { min_faction = Faction.Indifferent, dz = splitting_the_storm },    -- Splitting the Storm [60]
  [4801] = { min_faction = Faction.Indifferent, dz = splitting_the_storm },    -- Splitting the Storm [65]
  [4802] = { min_faction = Faction.Indifferent, dz = splitting_the_storm },    -- Splitting the Storm [68+]

  [4772] = { min_faction = Faction.Amiable, dz = holy_hour },                  -- Holy Hour [60]
  [4773] = { min_faction = Faction.Amiable, dz = holy_hour },                  -- Holy Hour [65]
  [4774] = { min_faction = Faction.Amiable, dz = holy_hour },                  -- Holy Hour [68+]
  [4793] = { min_faction = Faction.Amiable, dz = the_creator },                -- The Creator [60]  "thundercrest_60"
  [4794] = { min_faction = Faction.Amiable, dz = the_creator },                -- The Creator [65]  "thundercrest_65"
  [4795] = { min_faction = Faction.Amiable, dz = the_creator },                -- The Creator [68+] "thundercrest_70"

  [4775] = { min_faction = Faction.Kindly, dz = lair_unguarded },              -- Lair Unguarded [60]
  [4776] = { min_faction = Faction.Kindly, dz = lair_unguarded },              -- Lair Unguarded [65]
  [4777] = { min_faction = Faction.Kindly, dz = lair_unguarded },              -- Lair Unguarded [68+]
  [4806] = { min_faction = Faction.Kindly, dz = behind_closed_doors },         -- Behind Closed Doors [60]
  [4807] = { min_faction = Faction.Kindly, dz = behind_closed_doors },         -- Behind Closed Doors [65]
  [4808] = { min_faction = Faction.Kindly, dz = behind_closed_doors },         -- Behind Closed Doors [68+]

  [5068] = { min_faction = Faction.Warmly, dz = house_of_the_autumn_rose },    -- House of the Autumn Rose [60]
  [5069] = { min_faction = Faction.Warmly, dz = house_of_the_autumn_rose },    -- House of the Autumn Rose [65]
  [5070] = { min_faction = Faction.Warmly, dz = house_of_the_autumn_rose },    -- House of the Autumn Rose [68+]
}

local function get_missions(faction, is_gm)
  local task_offers = {}

  for task_id, mission in pairs(missions) do
    -- eq.debug(("checking %d client faction: %d vs min_faction %d"):format(task_id, faction, mission.min_faction))
    if is_gm or faction <= mission.min_faction then
      task_offers[#task_offers+1] = task_id
    end
  end

  -- sort by task ids so level choices don't display out of order
  table.sort(task_offers)

  return task_offers
end

function event_say(e)
  if e.message:findi("hail") then
    local is_gm = (e.other:Admin() >= 80 and e.other:GetGM())

    local faction = e.other:GetFaction(e.self)
    if not is_gm and faction > Faction.Apprehensive then
      e.other:Message(MT.NPCQuestSay, ("Bianca Galbraith says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
    else
      -- todo: task ids offered are based on faction and levels (levels should be filtered by shared task system)
      local task_offers = get_missions(faction, is_gm)
      if #task_offers > 0 then
        eq.task_selector(task_offers)
      end
    end
  end
end

function event_task_accepted(e)
  eq.debug(("Creating dz for task id: (%d) by: (%s) (%d)"):format(e.task_id, e.other:GetName(), e.other:CharacterID()))
  local mission = missions[e.task_id]
  if mission and mission.dz ~= nil then
    -- dz duration will be overridden by time remaining on the shared task
    e.other:CreateTaskDynamicZone(e.task_id, mission.dz)
  end
end
