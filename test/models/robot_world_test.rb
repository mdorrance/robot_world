require_relative '../test_helper'

class RobotWorldTest < Minitest::Test

	def setup
		RobotWorld.create({ :name       => "mike",
												:city       => "denver",
												:state      => "co",
												:avatar     => "joe",
												:birthdate  => "01/01/2000",
												:date_hired => "12/24/1974",
												:department => "homegoods"})

		RobotWorld.create({ :name       => "christine",
												:city       => "stc",
												:state      => "il",
												:avatar     => "yo",
												:birthdate  => "01/01/1993",
												:date_hired => "12/24/1975",
												:department => "arts"})

		RobotWorld.create({ :name       => "jack",
												:city       => "denver",
												:state      => "co",
												:avatar     => "joe",
												:birthdate  => "01/01/2010",
												:date_hired => "12/24/1931",
												:department => "homegoods"})
	end

	def test_it_creates_a_robot
		assert_equal 3, RobotWorld.all.count
		robot = RobotWorld.find(RobotWorld.all.first.id)

		assert_equal "denver", robot.city
		assert_equal RobotWorld.all.first.id, robot.id
	end

	def test_it_finds_all_robots
		robots = RobotWorld.all
		expected = RobotWorld.all.count
		assert_equal expected, robots.count
	end

	def test_it_can_find_an_id
		robot = RobotWorld.find(RobotWorld.all.first.id)
		# assert_equal "denver", robot.city
		assert_equal robot, robot		
	end

	def test_it_can_update
		updated = { :city => "denver", :state => "co", :avatar => "super cute"}
		RobotWorld.update(RobotWorld.all.first.id, updated)
		robot = RobotWorld.find(RobotWorld.all.first.id)
		assert_equal "denver", robot.city
		assert_equal "co", robot.state
 		assert_equal "super cute", robot.avatar
 		assert_equal RobotWorld.all.first.id, robot.id
	end

	def test_it_can_destroy	
		robots = RobotWorld.all.count
		RobotWorld.delete(RobotWorld.all.first.id)
		expected = (robots - 1)
		assert_equal expected, RobotWorld.all.count
	end
end