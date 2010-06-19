require 'config/initializers/ixtlan.rb'
require 'ixtlan/rails/migrations'
migration 3, :create_locale do
  up do
    Ixtlan::Rails::Migrations.create_locale
  end

  down do
  end
end
