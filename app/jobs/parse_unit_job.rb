class ParseUnitJob < ApplicationJob
  queue_as :default

  def perform(unit)
    @unit = unit
    collect_tech_parameters
    collect_fluff_data
  end

  private

  def fluff_headers
    [
      "Battle History",
      "Capabilities",
      "Combat Trial Results",
      "Deployment",
      "Mechwarrior Rules",
      "Notable Units and Warriors",
      "Overview",
      "Parameters",
      "Review of Combat Trial Simulations",
      "Similar Units",
      "Upgrades",
      "Variants"
    ]
  end

  def collect_fluff_data
    fluff_headers.each do |header|
      key = ''

      case header
      when /Battle History/
        fail 'Battle History' if fluff_content(header).present?
        next
      when /Capabilities/
        key = 'capabilites'
      when /Combat Trial Results/
        fail 'Combat Trail Results' if fluff_content(header).present?
        next
      when /Deployment/
        key = 'deployment'
      when /Mechwarrior Rules/
        key = 'mechwarrior_rules'
      when /Notable Units and Warriors/
        key = 'notable_units'
      when /Overview/
        key = 'overview'
      when /Parameters/
        fail 'Parameters' if fluff_content(header).present?
        next
      when /Review of Combat Trial Simulations/
        fail 'Review of Combat Trial' if fluff_content(header).present?
        next
      when /Similar Units/
        update_similar
        next
      when /Upgrades/
        fail 'Upgrades' if fluff_content(header).present?
        next
      when /Variants/
        update_variants
        next
      end

      Rails.logger.info "Key: `#{key}` Header: `#{header}`"

      selected_unit[key] = fluff_content(header)
    end

    selected_unit.save
  end

  def update_variants
    fail 'Variants'
  end

  def update_similar
    fail 'Similar'
  end

  def unit_notables
    fluff_content('Notable Units and Warriors')
  end

  def fluff_content(header_text)
    header = page.at("span.fluffheader:contains('#{header_text}')")
    return nil if header.blank?

    header.parent.parent.next.text.strip
  end

  def selected_unit
    @unit
  end

  def page
    @page ||= Nokogiri::HTML.parse(open(selected_unit.source_file_name).read)
  end

  def tech_parameters_keys
    [
      "appearance",
      "armament",
      "armor-type",
      "available",
      "communication-system",
      "config",
      "cruise-speed",
      "jump-jets",
      "location",
      "manufacturer",
      "maximum-speed",
      "power-plant",
      "rules",
      "source",
      "targeting-tracking-system",
      "tech-level",
      "tonnage",
      "used-by"
    ]
  end

  def tech_parameters_ar_key
    tech_parameters_keys.collect { |key| key.gsub('-', '_') }
  end

  def system_for_location(rows, index)
    location = rows['location'][index]
    System.find_or_create_by(name: location)
  end

  def collect_tech_parameters
    rows = {}

    page = Nokogiri::HTML.parse(open(selected_unit.source_file_name).read)
    span = page.search('span:contains("Technical parameters")').first
    table = span.parent.search('table').first
    table.search('./tbody/tr').each do |row|
      cells = row.search('td')
      rows[cells[0].text.parameterize] = cells[1]
    end

    tech_parameters_keys.each_with_index do |key, index|
      next if rows[key].blank?
      value = rows[key].text.strip

      case key
      when /location/
        value.split(',').collect(&:strip).each do |system_name|
          system = System.find_or_create_by(name: system_name)
          selected_unit.systems << system unless selected_unit.systems.exists?(system.id)
        end

        @systems = selected_unit.systems
      when /manufacturer/
        value.split(',').collect(&:strip).each_with_index do |factory_name, manu_index|
          system = system_for_location(rows, manu_index)
          factory = Factory.find_or_create_by(name: factory_name, system: system)
          selected_unit.factories << factory unless selected_unit.factories.exists?(factory.id)
        end
      when /used\-by/
        next
      else
        selected_unit[tech_parameters_ar_key[index]] = value
      end
    end

    selected_unit.save
  end
end
