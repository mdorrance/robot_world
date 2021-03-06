# require 'yaml/store'
require 'date'
require 'bigdecimal'

require_relative 'robot'

class RobotWorld
	def self.database
		if ENV["ROBOT_WORLD_ENV"] == 'test'
			@database ||= Sequel.sqlite("db/robot_world_test.sqlite3")
		else
			@database ||= Sequel.sqlite("db/robot_world_development.sqlite3")
		end
	end

	def self.create(robot)
		begin
			dataset.insert( name: robot[:name],
											city: robot[:city],
											state: robot[:state],
											avatar: robot[:robot],
											birthdate: robot[:birthdate],
											date_hired: robot[:date_hired],
											department: robot[:department])
		rescue
			return false
		end
		Robot.new(dataset.to_a.last)
	end

	def self.all
		dataset.map { |data| Robot.new(data) }
	end

	def self.find(id)
		Robot.new(dataset.where(id: id).first)
	end

	def self.update(id, robot)
		target = dataset.where(id: id)
		dataset.where(id: id).update(robot)
	end

	def self.delete(id)
		dataset.where(id: id).delete
	end

  def self.average_robot_age
    count = 0
    database.transaction do
    	if database['robots'] == []
    		'None'
	    	else
	      ages = database['robots'].map do |robot|
	        count += 1
	        ((Date.today - Date.strptime(robot["birthdate"],'%m/%d/%Y')).to_i) / 365.0
	      end
	      (ages.reduce(0, :+) / count).round(2)
    	end
    end
  end

  def self.robots_hired_per_year
    hired = Hash.new { |hsh, key| hsh[key] = 0}
    database.transaction do
        database['robots'].map do |robot|
          year = Date.strptime(robot["date_hired"],'%m/%d/%Y').year
          hired[year] += 1
        end
      hired
      end
  end

  def self.robots_per_department
    per_department = Hash.new { |hsh, key| hsh[key] = 0}
    database.transaction do
        database['robots'].map do |robot|
          department = robot["department"]
          per_department[department] += 1
        end
      per_department
      end
  end

  def self.robots_per_city
    per_city = Hash.new { |hsh, key| hsh[key] = 0}
    database.transaction do
        database['robots'].map do |robot|
          city = robot["city"]
          per_city[city] += 1
        end
      per_city
      end
  end

  def self.robots_per_state
    per_state = Hash.new { |hsh, key| hsh[key] = 0}
    database.transaction do
        database['robots'].map do |robot|
          state = robot["state"]
          per_state[state] += 1
        end
      per_state
      end
  end
	
	 def self.delete_all
    dataset.delete
  end

  def self.dataset
  	database.from(:robots)
  end

end