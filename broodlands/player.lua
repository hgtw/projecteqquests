local dz_switches = {
  [5] = { zone="thundercrest", version=instance_version.thundercrest_isles_the_creator },
}

-- todo: will need to handle different difficulty versions
function event_click_door(e)
  local door_id = e.door:GetDoorID()
  eq.debug("Door: " .. door_id)

  local dz = dz_switches[door_id]
  if dz then
    e.self:MovePCDynamicZone(dz.zone, dz.version, false)
  end
end
