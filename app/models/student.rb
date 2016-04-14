require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
attr_accessor :name
has_one :relationships
has_one :teachers, through: :relationships

validates :email, uniqueness: true
validates :phone, length: { minimum: 10, only_integer: true}
validates :phone, format: { with: /.*\d{3}.*\d{3}.*\d{4}.*/}
# validates :age, numericality: {greather_than_or_equal_to: 4}
validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
validates_inclusion_of :birthday, :in => Date.new(1913)..Time.now.years_ago(4).to_date
	def name
		name = "#{self.first_name}" + " " + "#{self.last_name}"
	end

  def name=(value)
  	name = value
  end

	def age
  	now = Time.now.utc
  	age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end


	end
	
