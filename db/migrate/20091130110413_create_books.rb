migration 20091130110413, :create_books do
  up do
    Book.auto_upgrade!
  end

  down do
    drop_table :books
  end
end
