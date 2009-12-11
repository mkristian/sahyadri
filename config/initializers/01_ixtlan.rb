require 'ixtlan/modified_by'
if ENV['RAILS_ENV']
  require 'models'
  require 'ixtlan/rails/error_handling'
  require 'ixtlan/optimistic_persistence'
  require 'ixtlan/audit'
  require 'ixtlan/rails/session_timeout'
  require 'ixtlan/rails/unrestful_authentication'
  require 'ixtlan/rails/timestamps_modified_by_filter'
  require 'ixtlan/guard'
  require 'ixtlan/monkey_patches'
end
