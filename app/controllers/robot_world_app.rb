require 'models/robot_world'
require 'date'

class RobotWorldApp < Sinatra::Base
	set :root, File.join(File.dirname(__FILE__), '..')
	set :method_override, true

	get '/' do
		@average_robot_age = RobotWorld.average_robot_age
		@robots_hired_per_year = RobotWorld.robots_hired_per_year
		@robots_per_department = RobotWorld.robots_per_department
		@robots_per_city = RobotWorld.robots_per_city
		@robots_per_state = RobotWorld.robots_per_state
		erb :dashboard
	end

	get '/robots' do
		@robots = RobotWorld.all
		erb :index
	end

	get '/robots/new' do
		erb :new
	end

	post '/robots' do
		RobotWorld.create(params[:robot])
		redirect '/robots'
	end

	get '/robots/:id' do |id|
		@robot = RobotWorld.find(id.to_i)
		erb :show
	end

	get '/robots/:id/edit' do |id|
		@robot = RobotWorld.find(id.to_i)
		erb :edit
	end

	put '/robots/:id' do |id|
		RobotWorld.update(id.to_i, params[:robot])
		redirect "/robots/#{id}"
	end

	delete '/robots/:id' do |id|
		RobotWorld.delete(id.to_i)
		redirect "/robots"
	end


end
