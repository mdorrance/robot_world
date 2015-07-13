require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest

	def test_home_page_displays_title
		visit("/")
		assert page.has_content?("Robot World")
		# skip
			save_and_open_page
		within(".title") do 

			assert page.has_content?("Welcome to the Robot World")
		end
		
		# assert find(".title").has_content?("Welcome to the Robot World")
	end

	def test_user_sees_index_of_robots

		visit("/robots")
		within(".mdl-card__supporting-text") do
			asser page.has_content?("Features")
		end
	end
end