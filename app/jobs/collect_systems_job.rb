require 'open-uri'

class CollectSystemsJob < ApplicationJob
  queue_as :default

  def perform
    loop do
      current_page.search('table/tbody/tr').each do |row|
        name, x_coord, y_coord, _ = row.search('td')

        new_name = cell_text_to_text(name)

        new_system          = System.find_or_create_by(name: new_name)
        new_system.name     = new_name
        new_system.coords_x = cell_text_to_text(x_coord)
        new_system.coords_y = cell_text_to_text(y_coord)
        new_system.url      = fix_url(name.search('a').first)
        new_system.save
        CollectSystemDataJob.perform_later(new_system)
      end

      next_page
      break unless next_link?
    end

    CollectNovelsJob.perform_later
  end

  private

  def initial_page
    raw = open('https://isatlas.teamspam.net/planet.php?func=all').read
    Nokogiri::HTML.parse(raw)
  end

  def current_page
    @current_page ||= initial_page
  end

  def set_current_page(page)
    @current_page = page
  end

  def next_link
    ul = current_page.search('ul.pagination').first
    li = ul.search('li').last
    return nil if (li['class'] == 'disabled')
    fix_url(li.search('a').first)
  end

  def next_link?
    next_link.present?
  end

  def next_page
    return unless next_link?
    raw = open(next_link).read
    set_current_page(Nokogiri::HTML.parse(raw))
  end
end
