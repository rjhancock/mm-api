require 'open-uri'

class CollectSystemsJob < ApplicationJob
  queue_as :default

  def perform
    loop do
      current_page.search('table/tbody/tr').each do |row|
        name, x_coord, y_coord, _ = row.search('td')

        new_name = name.text.strip

        new_system          = System.find_or_create_by(name: new_name)
        new_system.name     = new_name
        new_system.coords_x = x_coord.text.strip
        new_system.coords_y = y_coord.text.strip
        new_system.url      = fix_url(name.search('a').first)
        new_system.save
      end

      next_page
      break unless next_link?
    end
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
    return nil if (li.class == 'disabled')
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

  def fix_url(link)
    url = link['href']
    url = "https://isatlas.teamspam.net#{url}" unless !!(url =~ /^http/)
    url
  end
end
