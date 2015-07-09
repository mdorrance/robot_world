ENV['ROBOT_WORLD_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'

class Minitest::Test 
  def teardown
    RobotWorld.delete_all
  end
end