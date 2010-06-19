require 'config/initializers/ixtlan.rb'
require 'ixtlan/rails/migrations'
migration 4, :create_domain do
  up do
    Ixtlan::Rails::Migrations.create_domain
  end

  down do
  end
end
