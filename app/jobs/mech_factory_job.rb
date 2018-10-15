class MechFactoryJob < ApplicationJob
  queue_as :default

  def perform
    FileUtils.mkdir_p temp_mech_path
    FileUtils.mkdir_p temp_vehicle_path
    login
    visit_mechs
    visit_vehicles
    browser.quit
  end

  private

  def main_url
    'http://battletech.rpg.hu/mechfactory_frame.php'
  end

  def all_mechs_url
    'http://battletech.rpg.hu/dynmech/allmechs.php'
  end

  def all_vehicls_url
    'http://battletech.rpg.hu/dynmech/allvehicles.php'
  end

  def browser
    @browser ||= Capybara::Session.new(:selenium_chrome)
  end

  def login
    browser.visit(main_url)
    frame = browser.find('iframe#mhlogin')

    if frame.present?
      browser.driver.switch_to_frame(frame)
      fields = browser.all('input.loginfield')
      fields[0].set(Rails.application.credentials.username)
      fields[1].set(Rails.application.credentials.password)
      browser.find('img#loginbtn').click
    end
  end

  def process_units(urls, base_path, unit_type)
    urls.each do |title, url|
      unit = Unit.find_or_create_by(title: title, unit_type: unit_type)
      next if unit.source_file_name.present? && File.exist?(unit.source_file_name)

      Rails.logger.info "Navigating to: #{url}"

      browser.visit(url)
      frame = browser.find('iframe#mhmain')

      if frame.present?
        browser.driver.switch_to_frame(frame)
        data = browser.find('body')['innerHTML']

        file_path = sanitize_file_path(title, base_path)
        File.write(file_path, data)

        unit.update_attributes(source_file_name: file_path)
        Rails.logger.info "Unit Saved: #{title}"
        ParseUnit.perform_later(unit)
      end
    end
  end

  def sanitize_file_path(title, base_path)
    title = title.gsub(/[^0-9A-Z]/i, '_')
    "#{base_path}/#{title}.html"
  end

  def visit_mechs
    browser.visit(all_mechs_url)
    page = Nokogiri::HTML.parse(browser.find('body')['innerHTML'])

    urls = page.search('table//table//td/a').collect { |link| [link.text, fix_url(link['href'])] }
    process_units(urls, temp_mech_path, :mech)
  end

  def visit_vehicles
    browser.visit(all_vehicls_url)
    page = Nokogiri::HTML.parse(browser.find('body')['innerHTML'])

    urls = page.search('table//table//td/a').collect { |link| [link.text, fix_url(link['href'])] }
    process_units(urls, temp_vehicle_path, :vehicle)
  end

  def fix_url(url)
    url = "http://battletech.rpg.hu/dynmech/#{url}" unless !!(url =~ /^http/)
    url
  end

  def temp_mech_path
    'tmp/mechs'
  end

  def temp_vehicle_path
    'tmp/vehicles'
  end
end
