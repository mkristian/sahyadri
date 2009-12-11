migration 2, :create_configuration do
  up do
    Configuration.auto_migrate!
    Configuration.create(:session_idle_timeout => 10, :keep_audit_logs => 3, :current_user => User.first)
  end

  down do
  end
end
