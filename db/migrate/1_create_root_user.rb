migration 1, :create_root_user do
  up do
    Ixtlan::Models::User.auto_migrate!
    Ixtlan::Models::Locale.auto_migrate!
    Ixtlan::Models::Group.auto_migrate!
    Ixtlan::Models::GroupUser.auto_migrate!

    u = Ixtlan::Models::User.new(:login => 'root', :email => 'root@exmple.com', :name => 'Superuser', :language => 'en', :id => 1)
    #u.current_user = u
    u.created_at = DateTime.now
    u.updated_at = u.created_at
    u.created_by_id = 1
    u.updated_by_id = 1
    u.reset_password
    u.save!
    g = Ixtlan::Models::Group.create(:name => 'root', :current_user => u)
    u.groups << g
    u.save
    STDERR.puts "#{u.login} #{u.password}"
  end

  down do
  end
end
