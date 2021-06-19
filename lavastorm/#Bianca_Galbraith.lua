-- lavastorm/#Bianca_Galbraith.lua

--[[ notes
  with glaring, level 110 grouped with 2 other 110s (apprenhensive and amiable) received nothing but message
  with apprehensive, ungrouped, level 64 offered:
    Simple Task [60]                   -- live task id 4778
    Simple Task [65]                   -- live task id 4779
    Simple Task [68+]                  -- live task id 4780
    Throes of Contagion [60]           -- live task id 4803
    Throes of Contagion [65]           -- live task id 4804
    Throes of Contagion [68+]          -- live task id 4805
  with amiable, level 110 grouped with 2 other 110s offered:
    Holy Hour [68+]
    Simple Task [68+]
    The Creator [68+]
    Scions of Thundercrest [68+]
    Splitting the Storm [68+]
    Throes of Contagion [68+]
  with ally, level 89 shrouded (imp evoker) to 55, grouped with an 88
    Holy Hour [68+]                    -- live task id 4774
    Lair Unguarded [68+]               -- live task id 4777
    Simple Task [68+]                  -- live task id 4780
    The Creator [68+]                  -- live task id 4795
    Scions of Thundercrest [68+]       -- live task id 4798
    Splitting the Storm [68+]          -- live task id 4802
    Throes of Contagion [68+]          -- live task id 4805
    Behind Closed Doors [68+]          -- live task id 4808
    House of the Autumn Rose [68+]     -- live task id 5070
  with ally, level 89 shrouded to 55 grouped with a 64 offers all [60], [65], [68+] versions
    The Creator [60]                   -- live task id 4793
    The Creator [65]                   -- live task id 4794
  with ally, level 89 NOT shrouded grouped with a 64 offered only [68+]
  with ally, level 89 grouped with both 64 and 86, offered only the [68+] versions

  Kanetheus Forestwalker mission task ids (ally, level 88 shrouded to 55, grouped with a 64)
    Sudden Tremors [60]                -- live task id 4929
    Sudden Tremors [65]                -- live task id 4930
    Sudden Tremors [68+]               -- live task id 4931
    Animated Statue Plans [60]         -- live task id 5526
    Animated Statue Plans [65]         -- live task id 5527
    Animated Statue Plans [68+]        -- live task id 5528
    ... many more

  Dark Reign side uses different task ids:
  with apprehensive, level 88 shrouded (imp evoker) to 55 offered
    Simple Task [68+]                  -- live task id 5043
    Throes of Contagion [68+]          -- live task id 4976

  accepting task on a level 86 with a level 55 shroud grouped
    (Red) 8890: You can not be assigned this shared task because your party's level spread is too high.
  minimum players validated after selection:
    (Red) 8895: You can not be assigned this shared task because your party does not contain the minimum required number of players.
  todo: confirm if a minimum level to request or if it just checks on accept
  shroud level seemed to affect task offers, needs more testing
  using /taskadd with a level 89 (shrouded 55) on a level 110 when in 'The Creator [60]'
    (Red) 8969: You can not add this player because you would exceed the maximum level spread (21) for this shared task.
    (Red) 8970: You can not add this player because their level exceeds the maximum level limit for this shared task.
    (Red) 8917: <name> could not be invited to join you.
  using /taskadd with a level 89 (shrouded 55) on a level 110 when in 'The Creator [65]'
    (Red) 8969: You can not add this player because you would exceed the maximum level spread (23) for this shared task.
    *This indicates each task may have its own maximum level spread variable in addition to max level and min players*
  using /taskadd with 'The Creator [68]' gives level spread (30)
  using /taskadd on a level 100 gives the same messages after disbanding the 64, it must be honoring shroud level
  /taskquit on level 64, other members get (todo: check if leader only):
    (Red) 8895: You can not be assigned this shared task because your party does not contain the minimum required number of players.
    (Red) 8945: If your party does not meet the requirements in two minutes, the shared task will be terminated.
  Shared task expired from minimum player count not being reached in 2 minutes:
    (Yellow) 8951: Your shared task, 'The Creator [60]' has ended.
]]

--[[
  The Creator sql with live task ids and first step (basics)

  todo: "touch" task objectives should be able to specify a switch (door) id and let source automatically update that way

  INSERT INTO `tasks` VALUES (4780,1,21600,0,'Simple Task [68+]','placeholder','Fix and implement rewards',57208,0,0,2,0,0,1,0,''),(4793,1,21600,0,'The Creator [60]','We have word of a creator of statues within the isles of Thundercrest. We\'re not yet sure who is commissioning these creatures for the dragon that resides there, but we do know that not all are yet functioning as they should be.<BR><BR>[2,3,Your first clue is that the defunct statues may yet be waiting in the Garden of Yar`Lir.  Seek them out and destroy them.] [4,The rumbling you just felt must have been a sentry that is fully automated! Judging by the magnitude of the power, it must be nearby. Search for this beast and destroy it before it has a chance to destroy you!] [5,Time is short but you must take the energy crystal that has been left behind. Its use is unclear just yet, but the pulsating emissions that you can sense draws you ever closer to it.] [6,Now that you have the crystal in your grasp, you must identify the crystal to uncover it\'s hidden heritage. Such information may give you a better understanding as to who, or what, is creating these statues.] [7,The crystal\'s deeply ensconced knowledge has shown you that there is one creator of the statues. This being is a direct underling to the great dragon of these isles, Yar`Lir. You must find this creator and slay him before he can bring to life any of his latest creations!]','Fix and implement rewards',57208,0,0,2,0,0,1,0,''),(4794,1,21600,0,'The Creator [65]','We have word of a creator of statues within the isles of Thundercrest. We\'re not yet sure who is commissioning these creatures for the dragon that resides there, but we do know that not all are yet functioning as they should be.<BR><BR>[2,3,Your first clue is that the defunct statues may yet be waiting in the Garden of Yar`Lir.  Seek them out and destroy them.] [4,The rumbling you just felt must have been a sentry that is fully automated! Judging by the magnitude of the power, it must be nearby. Search for this beast and destroy it before it has a chance to destroy you!] [5,Time is short but you must take the energy crystal that has been left behind. Its use is unclear just yet, but the pulsating emissions that you can sense draws you ever closer to it.] [6,Now that you have the crystal in your grasp, you must identify the crystal to uncover it\'s hidden heritage. Such information may give you a better understanding as to who, or what, is creating these statues.] [7,The crystal\'s deeply ensconced knowledge has shown you that there is one creator of the statues. This being is a direct underling to the great dragon of these isles, Yar`Lir. You must find this creator and slay him before he can bring to life any of his latest creations!]','Fix and implement rewards',57208,0,0,2,0,0,1,0,''),(4795,1,21600,0,'The Creator [68+]','We have word of a creator of statues within the isles of Thundercrest. We\'re not yet sure who is commissioning these creatures for the dragon that resides there, but we do know that not all are yet functioning as they should be.<BR><BR>[2,3,Your first clue is that the defunct statues may yet be waiting in the Garden of Yar`Lir.  Seek them out and destroy them.] [4,The rumbling you just felt must have been a sentry that is fully automated! Judging by the magnitude of the power, it must be nearby. Search for this beast and destroy it before it has a chance to destroy you!] [5,Time is short but you must take the energy crystal that has been left behind. Its use is unclear just yet, but the pulsating emissions that you can sense draws you ever closer to it.] [6,Now that you have the crystal in your grasp, you must identify the crystal to uncover it\'s hidden heritage. Such information may give you a better understanding as to who, or what, is creating these statues.] [7,The crystal\'s deeply ensconced knowledge has shown you that there is one creator of the statues. This being is a direct underling to the great dragon of these isles, Yar`Lir. You must find this creator and slay him before he can bring to life any of his latest creations!]','Fix and implement rewards',57208,0,0,2,0,0,1,0,'');
  INSERT INTO `task_activities` VALUES (4780,0,1,11,'the portal to Thundercrest Isles','','-1','0','',0,2,1,0,'337',0),(4793,0,1,11,'the portal to Thundercrest Isles','','-1','0','',0,2,1,0,'337',0),(4794,0,1,11,'the portal to Thundercrest Isles','','-1','0','',0,2,1,0,'337',0),(4795,0,1,11,'the portal to Thundercrest Isles','','-1','0','',0,2,1,0,'337',0);
--]]

-- todo: there's going to be so many of these, maybe define in a dedicated don-dz import
local simple_task = {
  instance   = { zone="thundercrest", version=instance_version.thundercrest_isles_simple_task },
  compass    = { zone="broodlands", x=1241.88, y=511.147, z=23.4192 },
  safereturn = { zone="broodlands", x=1242.0, y=526.0, z=27.0, h=0.0 }
}

local throes_of_contagion = {}
local holy_hour = {}
local lair_unguarded = {}
local scions_of_thundercrest = {}
local splitting_the_storm = {}
local behind_closed_doors = {}
local house_of_the_autumn_rose = {}

-- todo: level scaling versions would need to be handled (3 level-based versions per mission)
local the_creator = {
  instance   = { zone="thundercrest", version=instance_version.thundercrest_isles_the_creator },
  compass    = { zone="broodlands", x=1241.88, y=511.147, z=23.4192 }, -- todo: lots of dzs to define, maybe implement compass switch id to get the coords more easily
  safereturn = { zone="broodlands", x=1242.0, y=526.0, z=27.0, h=0.0 },
  zonein     = { x=1641.0, y=-646.0, z=114.0, h=54.0 } -- todo: could be excluded if zone-in heading in table made accurate
}

local missions = {
  [4778] = { min_faction = Faction.Apprehensive, dz = simple_task },           -- Simple Task [60]
  [4779] = { min_faction = Faction.Apprehensive, dz = simple_task },           -- Simple Task [65]
  [4780] = { min_faction = Faction.Apprehensive, dz = simple_task },           -- Simple Task [68+]
  [4803] = { min_faction = Faction.Apprehensive, dz = throes_of_contagion },   -- Throes of Contagion [60]
  [4804] = { min_faction = Faction.Apprehensive, dz = throes_of_contagion },   -- Throes of Contagion [65]
  [4805] = { min_faction = Faction.Apprehensive, dz = throes_of_contagion },   -- Throes of Contagion [68+]

  [4798] = { min_faction = Faction.Indifferent, dz = scions_of_thundercrest }, -- Scions of Thundercrest [68+]
  [4802] = { min_faction = Faction.Indifferent, dz = splitting_the_storm },    -- Splitting the Storm [68+]

  [4774] = { min_faction = Faction.Amiable, dz = holy_hour },                  -- Holy Hour [68+]
  [4793] = { min_faction = Faction.Amiable, dz = the_creator },                -- The Creator [60]  "thundercrest_60"
  [4794] = { min_faction = Faction.Amiable, dz = the_creator },                -- The Creator [65]  "thundercrest_65"
  [4795] = { min_faction = Faction.Amiable, dz = the_creator },                -- The Creator [68+] "thundercrest_70"

  -- todo: need to confirm min factions below

  [4777] = { min_faction = Faction.Kindly, dz = lair_unguarded },              -- Lair Unguarded [68+]
  [4808] = { min_faction = Faction.Kindly, dz = behind_closed_doors },         -- Behind Closed Doors [68+]

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
