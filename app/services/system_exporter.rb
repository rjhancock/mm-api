# System data exporter to XLS/CSV

require 'csv'

class SystemExporter
  def excel_export
    make_export_dir
    data = header
    data += system_data
    data += occupation_data
    data += owner_era_data
    data += factory_data
    data += component_data
    data += footer
    File.write('exports/isatlas.xls', data)
  end

  private

  def make_export_dir
    FileUtils.mkdir_p "exports"
  end

  def header
'<?xml version="1.0" encoding="UTF-8"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet" xmlns:html="http://www.w3.org/TR/REC-html40">
'
  end

  def footer
    '</Workbook>'
  end

  def system_data
    data = '<Worksheet ss:Name="Systems">
  <Table>
    <Column ss:Index="1" ss:AutoFitWidth="0" ss:Width="110"/>
    <Row>
      <Cell><Data ss:Type="String">ID</Data></Cell>
      <Cell><Data ss:Type="String">Name</Data></Cell>
      <Cell><Data ss:Type="String">Description</Data></Cell>
      <Cell><Data ss:Type="String">X Coordinates</Data></Cell>
      <Cell><Data ss:Type="String">Y Coordinates</Data></Cell>
      <Cell><Data ss:Type="String">Time To Jump</Data></Cell>
    </Row>'

    System.find_each do |record|
      data += '<Row>
      <Cell><Data ss:Type="Number">' + record.id.to_s + '</Data></Cell>
      <Cell><Data ss:Type="String">' + record.name + '</Data></Cell>
      <Cell><Data ss:Type="String">' + (record.description || '') + '</Data></Cell>
      <Cell><Data ss:Type="Number">' + record.coords_x.to_s + '</Data></Cell>
      <Cell><Data ss:Type="Number">' + record.coords_y.to_s + '</Data></Cell>
      <Cell><Data ss:Type="String">' + (record.time_to_jump || '') + '</Data></Cell>
    </Row>'
    end

    data += '</Table></Worksheet>'
  end

  def occupation_data
    data = '<Worksheet ss:Name="Occupation+Dates">
  <Table>
    <Column ss:Index="1" ss:AutoFitWidth="0" ss:Width="110"/>
    <Row>
      <Cell><Data ss:Type="String">Faction</Data></Cell>
      <Cell><Data ss:Type="String">Start Date</Data></Cell>
      <Cell><Data ss:Type="String">System</Data></Cell>
      <Cell><Data ss:Type="String">System ID</Data></Cell>
    </Row>'

    SystemOccupationDate.includes(:system).find_each do |record|
      data += '<Row>
      <Cell><Data ss:Type="String">' + record.faction + '</Data></Cell>
      <Cell><Data ss:Type="String">' + record.occupation_start.to_s + '</Data></Cell>
      <Cell><Data ss:Type="String">' + record.system.name + '</Data></Cell>
      <Cell><Data ss:Type="Number">' + record.system.id.to_s + '</Data></Cell>
    </Row>'
    end

    data += '</Table></Worksheet>'
  end

  def owner_era_data
    data = '<Worksheet ss:Name="System+Owner+Eras">
  <Table>
    <Column ss:Index="1" ss:AutoFitWidth="0" ss:Width="110"/>
    <Row>
      <Cell><Data ss:Type="String">Era</Data></Cell>
      <Cell><Data ss:Type="String">Faction</Data></Cell>
      <Cell><Data ss:Type="String">System</Data></Cell>
      <Cell><Data ss:Type="String">System ID</Data></Cell>
    </Row>'

    SystemOwnerEra.includes(:system).find_each do |record|
      data += '<Row>
      <Cell><Data ss:Type="Number">' + record.era.to_s + '</Data></Cell>
      <Cell><Data ss:Type="String">' + record.faction + '</Data></Cell>
      <Cell><Data ss:Type="String">' + record.system.name + '</Data></Cell>
      <Cell><Data ss:Type="Number">' + record.system.id.to_s + '</Data></Cell>
    </Row>'
    end

    data += '</Table></Worksheet>'
  end

  def factory_data
    data = '<Worksheet ss:Name="Factories">
  <Table>
    <Column ss:Index="1" ss:AutoFitWidth="0" ss:Width="110"/>
    <Row>
      <Cell><Data ss:Type="String">ID</Data></Cell>
      <Cell><Data ss:Type="String">Name</Data></Cell>
      <Cell><Data ss:Type="String">System</Data></Cell>
      <Cell><Data ss:Type="String">System ID</Data></Cell>
    </Row>'

    Factory.includes(:system).find_each do |record|
      data += '<Row>
      <Cell><Data ss:Type="Number">' + record.id.to_s + '</Data></Cell>
      <Cell><Data ss:Type="String">' + record.name + '</Data></Cell>
      <Cell><Data ss:Type="String">' + record.system.name + '</Data></Cell>
      <Cell><Data ss:Type="Number">' + record.system.id.to_s + '</Data></Cell>
    </Row>'
    end

    data += '</Table></Worksheet>'
  end

  def component_data
    data = '<Worksheet ss:Name="Components">
  <Table>
    <Column ss:Index="1" ss:AutoFitWidth="0" ss:Width="110"/>
    <Row>
      <Cell><Data ss:Type="String">Name</Data></Cell>
      <Cell><Data ss:Type="String">Component Type</Data></Cell>
      <Cell><Data ss:Type="String">Factory</Data></Cell>
      <Cell><Data ss:Type="String">Factory ID</Data></Cell>
    </Row>'

    Component.includes(:factories, :component_type).find_each do |record|
      record.factories.each do |factory|
        data += '<Row>
        <Cell><Data ss:Type="Number">' + record.name.to_s + '</Data></Cell>
        <Cell><Data ss:Type="String">' + record.component_type.name + '</Data></Cell>
        <Cell><Data ss:Type="String">' + factory.name + '</Data></Cell>
        <Cell><Data ss:Type="Number">' + factory.id.to_s + '</Data></Cell>
      </Row>'
    end
    end

    data += '</Table></Worksheet>'
  end
end
