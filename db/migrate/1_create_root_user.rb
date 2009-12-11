migration 1, :create_root_user do
  up do
    User.auto_migrate!
    Locale.auto_migrate!
    Group.auto_migrate!
    Ixtlan::Models::GroupUser.auto_migrate!
    Ixtlan::Models::GroupLocaleUser.auto_migrate!

    u = User.new(:login => 'root', :email => 'root@exmple.com', :name => 'Superuser', :language => 'en', :id => 1)
    #u.current_user = u
    u.created_at = DateTime.now
    u.updated_at = u.created_at
    u.created_by_id = 1
    u.updated_by_id = 1
    u.reset_password
    u.save!
    g = Group.create(:name => 'root', :current_user => u)
    u.groups << g
    u.save
    STDERR.puts "#{u.login} #{u.password}"
  end

  down do
  end
end
