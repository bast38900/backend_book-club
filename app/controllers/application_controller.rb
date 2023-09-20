# Application controller class, parent to child controllers
class ApplicationController < ActionController::API
  # Make controllers respond to json, and not render view
  respond_to :json
end
