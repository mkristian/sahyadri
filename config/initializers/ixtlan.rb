module Ixtlan
  module Models
    AUTHENTICATION = "::Authentication"
    USER = "::User"
    GROUP = "::Group"
    LOCALE = "::Locale"
    DOMAIN = "::Domain"
    TEXT = "::I18nText"
    CONFIGURATION = "::Configuration"
  end
end
require 'ixtlan/modified_by'
if ENV['RAILS_ENV']
  require 'i18n_text'
  require 'book'
  require 'models'
  require 'ixtlan/rails/error_handling'
  require 'ixtlan/rails/audit'
  require 'ixtlan/rails/session_timeout'
  require 'ixtlan/rails/unrestful_authentication'
  require 'ixtlan/rails/guard'
  require 'ixtlan/rails/timestamps_modified_by_filter'
  require 'ixtlan/optimistic_persistence'
end
require 'ixtlan/monkey_patches'

# auto require to load needed libraries . . .
require 'datamapper4rails'
require 'ixtlan/logger_config' if ENV['RAILS_ENV']

# cleanup can be a problem. jruby uses soft-references for the cache so
# memory cleanup with jruby is no problem.
require 'ixtlan/session'
ActionController::Base.session_store = :datamapper_store
ActionController::Base.session = {
  :cache       => true,
  :session_class => Ixtlan::Session
}

# load the guard config files from RAILS_ROOT/app/guards
Ixtlan::Guard.load(Slf4r::LoggerFacade.new(Ixtlan::Guard)) if ENV['RAILS_ENV']
