# frozen_string_literal: true

class TameGodsJob < ApplicationJob
  queue_as :default

  def perform
    main_listing.each do |item|
      pantheon = item.text.strip.titlecase
      url = item['href'] + '?list-gods-names'
      collect_gods(url, pantheon)
    end
  end

  private

  def base_url
    'http://www.godchecker.com'
  end

  def main_listing
    return @main_listing if @main_listing.present?

    raw = open(base_url).read
    page = Nokogiri::HTML.parse(raw)
    @main_listing = page.search('div#drop-panel-pantheons/ul/li/a')
  end

  def collect_gods(url, pantheon)
    raw = open(url).read
    page = Nokogiri::HTML.parse(raw)
    page.search('section#main-page/a').each do |god|
      god_url   = god['href']
      god_name  = god.text.strip
      god = God.find_or_create_by(
        name: god_name,
        pantheon: pantheon,
        url: god_url
      )

      fail "Error: #{god.errors.inspect}" if god.errors.present?
    end
  end
end
