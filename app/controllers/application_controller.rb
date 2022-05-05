class ApplicationController < ActionController::Base
  # ActionController::InvalidAuthenticityToken in Users::RegistrationsController#create
  protect_from_forgery prepend: true
end
