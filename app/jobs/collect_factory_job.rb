class CollectFactoryJob < ApplicationJob
  queue_as :default

  def perform(factory)
    @factory = factory
    update_compontents
  end

  private

  def current_factory
    @factory
  end

  def page
    @raw_page ||= open(current_factory.url).read
    @page     ||= Nokogiri::HTML.parse(@raw_page)
  end

  def component_rows
    page.search('table/tbody/tr')
  end

  def update_compontents
    component_rows.each do |component|
      name, comp_type = component.search('td').collect(&:text).collect(&:strip).collect(&:squish)
      component_type  = ComponentType.find_or_create_by(name: comp_type)
      new_component   = Component.find_or_create_by(name: name, component_type: component_type)
      current_factory.components << new_component
    end
  end
end
