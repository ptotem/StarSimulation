class UserSimDatum < ActiveRecord::Base

  #validates_uniqueness_of :simulation_datum_id, :scope => [:user_id, :simulation_id], :message => "You already have selected this program."
  #validates :age_min, :numericality => {greater_than: 0, less_than_or_equal_to: :age_max}, :unless => Proc.new {|user| user.age_min.nil? || user.age_max.nil? }

  belongs_to :simulation
  belongs_to :user

  #before_save :my_method_usd
  #validate :my_method_usd

  def my_method_usd
    puts "UserSimDatum"
    puts "in my_method_usd"
    puts "self.id #{self.id}"
    new_array = Array.new()
    new_array << self.id
    puts "new_array :- #{new_array}"
    #puts "all together, simulation_datum_id :- #{UserSimDatum.where("simulation_id = ? AND user_id = ?", self.simulation_id, self.user_id).map{|i| i.simulation_datum_id}}"
    #puts "all together, no_of_slots :- #{UserSimDatum.where("simulation_id = ? AND user_id = ?", self.simulation_id, self.user_id).map{|i| i.no_of_slots}}"
  end


end
