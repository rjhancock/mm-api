# System data exporter to XLS/CSV

require 'csv'

class SystemExporter
  def csv_export
    make_export_dir
    File.write('exports/systems.csv', system_data)
    File.write('exports/occupations.csv', occupation_data)
    File.write('exports/owner_eras.csv', owner_era_data)
    File.write('exports/factories.csv', factory_data)
    File.write('exports/components.csv', component_data)
  end

  private

  def make_export_dir
    FileUtils.mkdir_p "exports"
  end

  def system_data
    CSV.generate(headers: true) do |csv|
      csv << ['id', 'name', 'description', 'coords_x', 'coords_y', 'time_to_jump']
      System.find_each do |record|
        csv << [record.id, record.name, record.description, record.coords_x, record.coords_y, record.time_to_jump]
      end
    end
  end

  def occupation_data
    CSV.generate(headers: true) do |csv|
      csv << ['faction', 'occupation_start', 'system', 'system_id']
      SystemOccupationDate.includes(:system).find_each do |record|
        csv << [record.faction, record.occupation_start, record.system.name, record.system.id]
      end
    end
  end

  def owner_era_data
    CSV.generate(headers: true) do |csv|
      csv << ['era', 'faction', 'system', 'system_id']
      SystemOwnerEra.includes(:system).find_each do |record|
        csv << [record.era, record.faction, record.system.name, record.system.id]
      end
    end
  end

  def factory_data
    CSV.generate(headers: true) do |csv|
      csv << ['id', 'name', 'system', 'system_id']
      Factory.includes(:system).find_each do |record|
        csv << [record.id, record.name, record.system.name, record.system.id]
      end
    end
  end

  def component_data
    CSV.generate(headers: true) do |csv|
      csv << ['name', 'component_type', 'factory', 'factory_id']
      Component.includes(:factories, :component_type).find_each do |record|
        record.factories.each do |factory|
          csv << [record.name, record.component_type.name, factory.name, factory.id]
        end
      end
    end
  end
end
