require 'config/initializers/ixtlan.rb'
require 'ixtlan/rails/migrations'
migration 1, :create_user do
  up do
    # USER = Object.const_get(Ixtlan::Models::USER.sub(/^::/, ''))

    # USER.auto_migrate!
    
    # repository.adapter.execute_update("insert into users (uidnumber, uid, cn, mail, created_by_id, updated_by_id, created_at, updated_at) values(1, 'root', 'Superuser', 'root@example.com', 1, 1, '#{DateTime.now.strftime("%Y-%m-%d %H:%M:%S")}', '#{DateTime.now.strftime("%Y-%m-%d %H:%M:%S")}')")

    Ixtlan::Rails::Migrations.create_user unless User::LDAP
  end

  down do
  end
end
