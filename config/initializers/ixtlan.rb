module Ixtlan
  module Models
    # overwrite configuration class
    # CONFIGURATION = "::MyConfiguration"
    # set this to nil to switch off Audit logs into the database
    # AUDIT = nil
  end
end

# rails related libraries from ixtlan
require 'ixtlan/rails'

if ENV['RAILS_ENV']
  require 'ixtlan/models/role'
  require 'ixtlan/models/permission'
  require 'ixtlan/models/audit'
  require 'ixtlan/models/configuration_locale'
  require 'ixtlan/models/configuration'
  require 'ixtlan/models/domain_group_user'
  require 'ixtlan/models/domain'
  require 'ixtlan/models/group_locale_user'
  require 'ixtlan/models/group'
  require 'ixtlan/models/group_user'
  require 'ixtlan/models/i18n_text'
  require 'ixtlan/models/locale'
  require 'ixtlan/models/phrase'
  require 'ixtlan/models/translation'
  require 'ixtlan/models/user'
  require 'ixtlan/models/word'
  require 'i18n_text'
  require 'book'
end

# auto require to load needed libraries . . .
require 'datamapper4rails'
require 'ixtlan/logger_config' if ENV['RAILS_ENV']

# cleanup can be a problem. jruby uses soft-references for the cache so
# memory cleanup with jruby is no problem.
require 'ixtlan/session'
ActionController::Base.session_store = :datamapper_store
ActionController::Base.session = {
  :cache       => true,
  :session_class => Ixtlan::SessionWithCache
}

# load the guard config files from RAILS_ROOT/app/guards
Ixtlan::Guard.load(Slf4r::LoggerFacade.new(Ixtlan::Guard)) if ENV['RAILS_ENV']
