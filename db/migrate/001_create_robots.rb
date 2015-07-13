require "sequel"
require "sqlite3"
require "./app/models/robot_world"

environments = %w(test development)

environments.each do |environment|
	Sequel.sqlite("db/robot_world_#{environment}.sqlite3").create_table :robots do
		primary_key :id
		String			:name
		String  		:city
		String      :state
		String  		:avatar
		String  		:birthdate
		String  		:date_hired
		String  		:department
	end
	puts "creating robtos table for #{environment}"
end
