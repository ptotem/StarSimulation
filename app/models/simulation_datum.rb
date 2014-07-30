class SimulationDatum < ActiveRecord::Base

  belongs_to :simulation

  def self.import(file, simulation)
    require 'time'
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      start_time_parsed = DateTime.strptime(spreadsheet.row(i)[4].to_s,'%s').strftime("%T")
      end_time_parsed = DateTime.strptime(spreadsheet.row(i)[5].to_s,'%s').strftime("%T")
      simulation_data = SimulationDatum.create!(simulation_id: simulation.id, channel: spreadsheet.row(i)[0].to_s.gsub(".0",""), reg_market: spreadsheet.row(i)[1].to_s.gsub(".0",""), performance_date: spreadsheet.row(i)[2].to_s.gsub(".0",""), performance_day: spreadsheet.row(i)[3].to_s.gsub(".0",""), start_time: start_time_parsed, end_time: end_time_parsed, programme_name: spreadsheet.row(i)[6], duration: spreadsheet.row(i)[7], tvr: spreadsheet.row(i)[8])
      simulation_data.save
    end
  end


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
      when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
      when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end