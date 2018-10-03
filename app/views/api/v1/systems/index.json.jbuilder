# frozen_string_literal: true

json.systems @systems do|star_system|
  json.id           star_system.id
  json.name         star_system.name
  json.description  star_system.description
  json.coords_x     star_system.coords_x
  json.coords_y     star_system.coords_y
  json.time_to_jump star_system.time_to_jump
end

json.total_pages  @systems.total_pages
json.current_page @systems.current_page
