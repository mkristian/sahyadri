migration 20091215000000, :create_text do
  up do
    Text.auto_migrate!
  end

  down do
  end
end
