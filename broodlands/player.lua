local dz_switches = {
  [5] = { zone="thundercrest" }, -- entrance used by different versions
}

function event_click_door(e)
  local door_id = e.door:GetDoorID()
  eq.debug("Door: " .. door_id)

  local dz = dz_switches[door_id]
  if dz then
    e.self:MovePCDynamicZone(dz.zone, -1, false) -- todo: make msg_if_invalid false by default
  end
end
