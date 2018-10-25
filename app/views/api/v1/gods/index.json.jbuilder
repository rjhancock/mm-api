# frozen_string_literal: true

json.gods @gods do |god|
  json.name       god.name
  json.pantheon   god.pantheon
  json.popularity god.popularity
end

json.total_pages  @gods.total_pages
json.current_page @gods.current_page
