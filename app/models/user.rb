class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessible :name

  # include  ActiveModel::MassAssignmentSecurity
  # attr_accessible :name, as: :create_params
  # def create_objects(params)
  #   User.new(sanitized_params(params, :create_params))
  # end

  # has_many :simulations
  has_many :simulateresult
  
  rails_admin do
    edit do
      field :name
      field :email
      field :password
      field :password_confirmation
      field :admin
    end
  end

  def set_budget
    sim_user_data = self.simulation_user_datas.build
    sim_user_data.budget = 10000000
    sim_user_data.save!
    self.save!
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    # puts "User Upload Started"
    (2..spreadsheet.last_row).each do |i|
      # puts "email :- #{spreadsheet.row(i)[0]}"
      # puts "name :- #{spreadsheet.row(i)[1]}"
      @user = User.create(:email=>spreadsheet.row(i)[0], :name=>spreadsheet.row(i)[1], :password=>"password", :password_confirmation=>"password")
      @user.save!
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
