# mini_social.rb
# This application is a product of the  Launchschool 170 Users
# and Interests `Code Challenge`

require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

before do
  @user_info = YAML.load_file('data/users.yaml')
  @users = @user_info.keys
  @user_count = @users.count
end

helpers do
  def count_interests
    count = 0
    @users.map do |user|
      count += @user_info[user][:interests].size
    end
    count
  end
end

get '/' do
  erb :home
end

get "/:name" do
  @name = params[:name].to_sym
  @email = @user_info[@name][:email]
  @interests = @user_info[@name][:interests]

  erb :user_pg
end
