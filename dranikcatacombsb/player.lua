function event_click_door(e)
  local door_id = e.door:GetDoorID();
  if (door_id == 2) then  
      e.self:MovePC(336, -292.75, 1010.79, -79.79, 256); -- Zone: dranik
  end
end
