

require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateTeachers < ActiveRecord::Migration
	def change
		create_table :teachers do |t| 
				t.string :first_name
				t.string :last_name
				t.string :email
				t.string :phone
		end
	end
end

# CreateTeachers.new('Died', 'van der Hoek', 'male', '1992-05-15', 'djpvanderhoek@gmail.com', '0031655328915')