require 'open-uri'

class CollectSystemDataJob < ApplicationJob
  queue_as :default

  def perform
    System.find_each do |star_system|
      @star_system = star_system
      star_system.description   = get_description
      star_system.time_to_jump  = get_time_to_jump
      update_owner_eras
      update_occupation_dates
      star_system.save
      clear_data
    end
  end

  private

  def clear_data
    @star_system  = nil
    @raw_page     = nil
    @page         = nil
  end

  def current_system
    @star_system
  end

  def planet_page
    @raw_page ||= open(current_system.url).read
    @page     ||= Nokogiri::HTML.parse(@raw_page)
  rescue Net::OpenTimeout
    Rails.logger.info "Sleeping 15..."
    sleep(15)
    retry
  end

  def get_description
    panel = planet_page.at('div.panel:contains("Description:")/div.panel-body')
    panel.text.strip if panel.present?
  end

  def get_time_to_jump
    list_item = planet_page.at('div.panel:contains("System Info:")/ul.list-group/li:contains("Time to Jump Point:")')
    list_item.text.split(':', 2).last.strip if list_item.present?
  end

  def owner_era_rows
    planet_page.search('div.panel:contains("System Owner Eras:")/div/table/tbody/tr')
  end

  def update_owner_eras
    owner_era_rows.each do |row|
      era, faction = row.search('td').collect(&:text).collect(&:strip)
      item = SystemOwnerEra.find_or_create_by(era: era, faction: faction, system: current_system)
      current_system.system_owner_eras << item
    end
  end

  def occupation_date_rows
    planet_page.search('div.panel:contains("System Occupation Dates:")/div/table/tbody/tr')
  end

  def update_occupation_dates
    occupation_date_rows.each do |row|
      site_date, faction = row.search('td').collect(&:text).collect(&:strip)
      parsed_date = Date.strptime(site_date, "%Y-%m-%d")
      item = SystemOccupationDate.find_or_create_by(occupation_start: parsed_date, faction: faction, system: current_system)
      current_system.system_occupation_dates << item
    end
  end
end
