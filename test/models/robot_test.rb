require_relative '../test_helper'

class RobotTest < Minitest::Test
	def test_assigns_attributes_correctly
		robot = Robot.new({ "name" => "mike",
												"city" => "denver",
												"state" => "il",
												"avatar" => "joe",
												"birthdate" => "01/01/2001",
												"date_hired" => "02/28/2010",
												"department" => "home",
												"id" => 1})
		assert_equal "joe", robot.avatar
		assert_equal "il", robot.state
		assert_equal 1, robot.id
	end
end