require 'models/robot_world'

class RobotWorldApp < Sinatra::Base
	set :root, File.join(File.dirname(__FILE__), '..')
	set :method_override, true

	get '/' do
		'hello, world'
		erb :dashboard
	end
	
end
