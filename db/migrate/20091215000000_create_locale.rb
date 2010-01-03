migration 20091215000000, :create_locale do
  up do
    Locale.auto_migrate!
    # get/create default locale
    Locale.default
    # get/create "every" locale
    Locale.every
  end

  down do
  end
end
