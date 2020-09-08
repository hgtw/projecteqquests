-- On Death: "Talakoi's corpse's spirit dissipates in a din of chaotic magic.  Dark clouds encircle you, engulfing you in a smothering embrace.  You are momentarily blinded.  After you come to your senses, you see that a ghostly essence has formed and is moving towards a room to the east."
function event_death_complete(e)
  local essence = eq.spawn2(288086, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0) -- NPC: a_ghostly_essence
  essence:SetEntityVariable("pylon_position", "1")
end
