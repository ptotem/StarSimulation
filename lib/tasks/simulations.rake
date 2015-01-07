namespace :simulations do
  desc "Create Simulation with name, spots, grp & cprp"
  task create_simulations: :environment do
    simualtions = [
        {
            name: "Simulation 01",
            spots:  110,
            grp: 369,
            cprp: 27379
        },
        {
            name: "Simulation 02",
            spots:  108,
            grp: 362,
            cprp: 27821
        },
        {
            name: "Simulation 03",
            spots:  110,
            grp: 365,
            cprp: 27679
        }
    ]

    simualtions.each_with_index do |simulation, index|
      @simulation = Simulation.create(:name=>simulation[:name], :sim_spot=>simulation[:spots], :sim_grp=>simulation[:grp], :sim_cprp=>simulation[:cprp])
      @simulation.save!
    end

  end

end
