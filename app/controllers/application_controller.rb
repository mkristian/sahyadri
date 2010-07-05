# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  filter_parameter_logging :password, :login
  before_filter :check_session_expiry

  include Ixtlan::Rails::RescueModule
  # you can overwrite a rescue directive here
  # rescue_from ::Ixtlan::StaleResourceError, :with => :stale_resource
  # rescue_from ::ActionView::MissingTemplate, :with => :internal_server_error

  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
