# frozen_string_literal: true

json.id           @system.id
json.name         @system.name
json.description  @system.description
json.coords_x     @system.coords_x
json.coords_y     @system.coords_y
json.time_to_jump @system.time_to_jump

json.occupation_dates @system.system_occupation_dates do |date|
  json.faction  date.faction
  json.start    date.occupation_start
end

json.owner_eras @system.system_owner_eras do |era|
  json.faction  era.faction
  json.era      era.era
end

json.factories @system.factories do |factory|
  json.factory factory.name
  json.components factory.components do |component|
    json.name component.name
    json.type component.component_type.name
  end
end
