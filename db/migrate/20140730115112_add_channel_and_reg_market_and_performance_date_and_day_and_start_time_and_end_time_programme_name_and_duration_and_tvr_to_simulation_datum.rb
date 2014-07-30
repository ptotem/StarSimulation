class AddChannelAndRegMarketAndPerformanceDateAndDayAndStartTimeAndEndTimeProgrammeNameAndDurationAndTvrToSimulationDatum < ActiveRecord::Migration
  def change
    add_column :simulation_data, :channel, :string
    add_column :simulation_data, :reg_market, :string
    add_column :simulation_data, :performance_date, :date
    add_column :simulation_data, :performance_day, :string
    add_column :simulation_data, :start_time, :time
    add_column :simulation_data, :end_time, :time
    add_column :simulation_data, :programme_name, :string
    add_column :simulation_data, :duration, :integer
    add_column :simulation_data, :tvr, :float
  end
end
