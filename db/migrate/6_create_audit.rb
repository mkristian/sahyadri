require 'config/initializers/ixtlan.rb'
require 'ixtlan/rails/migrations'
migration 6, :create_audit do
  up do
    Ixtlan::Rails::Migrations.create_audit
  end

  down do
  end
end
