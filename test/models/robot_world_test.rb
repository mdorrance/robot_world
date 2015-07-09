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
		robot = RobotWorld.find(2)
		assert_equal "stc", robot.city
		assert_equal 2, robot.id
	end

	def test_it_finds_all_robots
		robots = RobotWorld.all
		expected = 3
		assert_equal expected, robots.count
	end

	def test_it_can_find_an_id
		robot = RobotWorld.find(3)
		assert_equal "denver", robot.city
		assert_equal 3, robot.id		
	end

	def test_it_can_update
		updated = { :city => "denver", :state => "co", :avatar => "super cute"}
		RobotWorld.update(2, updated)
		robot = RobotWorld.find(2)
		assert_equal "denver", robot.city
		assert_equal "co", robot.state
 		assert_equal "super cute", robot.avatar
 		assert_equal 2, robot.id
	end

	def test_it_can_destroy
		RobotWorld.delete(2)
		robots = RobotWorld.all
		expected = 2
		assert_equal expected, robots.count
	end
end