class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end

# app/controllers/application_controller.rb
def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
end
