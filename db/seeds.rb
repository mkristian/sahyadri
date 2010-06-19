# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'config/initializers/ixtlan.rb'
require 'ixtlan/rails/migrations'
USER = Object.const_get(Ixtlan::Models::USER.sub(/^::/, ''))

USER.auto_migrate!
    
repository.adapter.execute_update("insert into users (uidnumber, uid, cn, mail, created_by_id, updated_by_id, created_at, updated_at) values(1, 'root', 'Superuser', 'root@example.com', 1, 1, '#{DateTime.now.strftime("%Y-%m-%d %H:%M:%S")}', '#{DateTime.now.strftime("%Y-%m-%d %H:%M:%S")}')")

Ixtlan::Rails::Migrations.create_user(USER.first)
Ixtlan::Rails::Migrations.create_configuration
Ixtlan::Rails::Migrations.create_locale
Ixtlan::Rails::Migrations.create_domain
Ixtlan::Rails::Migrations.create_text
