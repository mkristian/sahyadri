require 'config/initializers/ixtlan.rb'
require 'ixtlan/rails/migrations'
migration 5, :create_text do
  up do
    Ixtlan::Rails::Migrations.create_text
  end

  down do
  end
end
