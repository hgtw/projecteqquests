function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	if(e.self:HasItem(12080) and qglobals["cleric20_darkdisciples"] ~= nil) then -- Player has Enchated Signet of Disciples on their character and Zones in.
		e.self:Message(13, "The Enchanted Signet of the Disciples begins to glow.");
	end

	if(e.self:HasItem(69941) and e.self:HasItem(69952) and e.self:HasItem(69942) and e.self:HasItem(69983)) then -- Paladin 1.5 trigger
		if(qglobals["paladin_wos"] ==  nil) then
			eq.spawn2(300087,0,0,-1118.76,1007,13.45,226); -- NPC: #Durunal_the_Cursebearer
			eq.set_global("paladin_wos","1",3,"H2");
		end
	end

	if(qglobals["ranger_epic"] == "8" and qglobals["rng_spawn_wos"] == nil and eq.get_entity_list():IsMobSpawnedByNpcTypeID(300057) == false) then
		eq.unique_spawn(300057,0,0,-1491,2015,51.2,192); --#Herrian_Warfrost
		eq.spawn2(300058,0,0,-1495,1965,51.2,160); --an_excited_builder (300058)
		eq.spawn2(300058,0,0,-1447,2014,51.2,220); -- NPC: an_excited_builder
		eq.spawn2(300058,0,0,-1454,1976,51.2,192); -- NPC: an_excited_builder
		--eq.set_global("rng_spawn_wos","1",2,"H2");
	end		
end

function event_loot(e)
	if(e.self:Class() == "Warrior" and e.item:GetID() == 60312) then -- Stone of Eternal Power: Northeast Eye
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["warrior_epic"] == "10" and qglobals["warr_epic_wos"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("warr_epic_wos","1",5,"F");
		end
	elseif(e.self:Class() == "Wizard" and e.item:GetID() == 11445) then  --Fluxing Rod
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["wiz_epic"] == "1" and qglobals["wiz_wos_chest"] == nil) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("wiz_wos_chest","1",5,"F");
		end
	elseif(e.self:Class() == "Paladin" and e.item:GetID() == 69971) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["paladin_epic"] == "6" and qglobals["paladin_epic_wos"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("paladin_epic_wos","1",5,"F");
		end
		e.self:Message(6,"As you hold the sword, your soul is tugged for a few seconds and then all four soulstones speak in unison, 'This sword is the key, this sword is the misery, this sword is the instrument that took us away, and this sword is what will set us free. Take this cursed sword to Irak Altil, for he will know how to end our pain.");	
	elseif(e.self:Class() == "Cleric" and e.item:GetID() == 12433) then
		local qglobals = eq.get_qglobals(e.self);
		if (qglobals["cleric20_robedropped"] ~= nil) then
			e.self:DelGlobal("cleric20_robedropped");
			e.self:DelGlobal("cleric20_darkdisciples"); -- I couldn't retrigger the event
		else
			return 1; -- loot fail
		end
	elseif(e.self:Class() == "Shaman" and e.item:GetID() == 57404) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["shaman_epic"] == "12") then
			if(qglobals["shaman_epic_wos"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("shaman_epic_wos","1",5,"F");
			end
		else
			return 1;
		end
	elseif(e.self:Class() == "Druid" and e.item:GetID() == 62872) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["druid_epic"] == "10") then
			if(qglobals["druid_epic_wos"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("druid_epic_wos","1",5,"F");
			end
		else
			return 1;
		end
	elseif(e.self:Class() == "Ranger" and e.item:GetID() == 76999) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["ranger_epic"] == "8") then
			if(qglobals["rng_wos_chest"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("rng_wos_chest","1",5,"F");
			end
		else
			return 1;
		end			
	elseif(e.self:Class() == "Enchanter" and e.item:GetID() == 57919) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["ench_epic"] == "9") then
			if(qglobals["ench_wos_chest"] == nil ) then
				eq.spawn2(893,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
				eq.set_global("ench_wos_chest","1",5,"F");
			end
		else
			return 1;
		end			
	end	
end

function event_click_door(e)
  local door_id = e.door:GetDoorID();
  eq.debug("Door: " .. door_id .. " clicked");

  if (door_id == 3) then
    local qglobals = eq.get_qglobals(e.self);
    local has_signets = qglobals["oow_rss_taromani_insignias"]
    local has_trials = qglobals["oow_mpg_raids_complete"]

    -- zone entry gated via flag checks but expedition can be created if only requester is eligible
    if (e.self:Admin() >= 80 and e.self:GetGM()) or (has_signets and has_trials) then
      local anguish_door_open = eq.get_data("anguish_door_open") ~= "" and true or false
      if not anguish_door_open then
        eq.set_data("anguish_door_open", "1", "60s")
        e.self:Message(15, "The door swings wide and allows you entrance to Anguish, the Fallen Palace.");
      else
        -- live does seem to throttle creation requests during this message, not just messages
        e.self:Message(13, "You can feel the door to Anguish opening underneath your hand.");
      end

      local dz = e.self:GetExpedition()
      if dz.valid then
        e.self:MovePCDynamicZone("anguish") -- only moves client if they have associated dz to target zone
      else --elseif not anguish_door_open then
        dz = e.self:CreateExpedition("anguish", 0, 21600, "Anguish, the Fallen Palace", 6, 54, anguish_door_open)
        if dz.valid then
          dz:SetCompass("wallofslaughter", 1353.15, 1712.19, 109.001)      -- anguish compass coordinates (live packet confirmed)
          dz:SetSafeReturn("wallofslaughter", 1349.13, 1715.00, 123.81, 0) -- in wos, outside anguish
          dz:SetZoneInLocation(-9, -2466, -79, 0)                          -- zone in coordinates inside anguish (if not set, defaults to zone safecoords)
          dz:SetReplayLockoutOnMemberJoin(false)                           -- disable adding "Replay Timer" lockout automatically to newly added members, live doesn't add it for anguish after /dzadd

          if dz:GetInstanceID() == 0 then
            e.self:Message(13, "Instance failed to be created, yell at a GM");
          end
          eq.cross_zone_message_player_by_name(5, "GMFizban", "Anguish -- Instance: " .. dz:GetInstanceID());
        end
      end
    else
      if not has_trials then
        e.self:Message(13, "You must complete the Muramite Proving Grounds raid trials."); -- unconfirmed message since live doesn't require this now?
      elseif not has_signets then
        e.self:Message(13, "Though you carry the seal to enter Anguish, the Fallen Palace, you would be torn asunder by the harsh environment were you to venture within.  You will need to find a way to protect yourself from the powers of Discord.");
      end
    end
  end
end
