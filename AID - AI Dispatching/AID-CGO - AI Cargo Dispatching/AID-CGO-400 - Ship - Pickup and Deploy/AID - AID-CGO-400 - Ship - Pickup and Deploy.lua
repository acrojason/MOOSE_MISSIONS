---
-- Name: AID-CGO-400 - Ship - Pickup and Deploy
-- Author: acrojason
-- Date Created: 01 January 2021
--

-- Sample mission to demonstrate the transporting of Cargo using naval vessels

local SetCargoInfantry = SET_CARGO:New():FilterTypes( "Infantry" ):FilterStart()
local SetShip = SET_GROUP:New():FilterPrefixes( "CargoShip" ):FilterStart()
local SetPickupZones = SET_ZONE:New():FilterPrefixes( "Pickup" ):FilterStart()
local SetDeployZones = SET_ZONE:New():FilterPrefixes( "Deploy" ):FilterStart()

-- Get the Late Activated group that defines the shipping lane, and then retrieve the WayPoints
local ShippingLane = GROUP:FindByName( "ShippingLane" )
lanepoints = ShippingLane:GetTemplateRoutePoints()

-- Turn the waypoints into Coordinates and insert them into a table
lane = {}
for i=1, #lanepoints do
  local point = lanepoints[i]
  local coord=COORDINATE:New(point.x,0,point.y)
  table.insert(lane, coord)
end

AICargoDispatcherShip = AI_CARGO_DISPATCHER_SHIP:New( SetShip, SetCargoInfantry, SetPickupZones, SetDeployZones, lane )
AICargoDispatcherShip:Start()

