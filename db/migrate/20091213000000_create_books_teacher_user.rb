migration 20091213000000, :create_books_teacher_user do
  up do
    root = User.first
    u = User.new(:login => 'librarian', :email => 'librarian@example.com', :name => 'Librarian', :language => 'en', :id => 3, :current_user => root)
    u.reset_password
    u.save
    g = Group.create(:name => 'books', :current_user => root)
    u.groups << g
    u.save
    File.open("root_#{RAILS_ENV}", 'a') do |f|
      f.puts "#{u.login}\n#{u.password}\n\n"
    end

    u = User.new(:login => 'teacher', :email => 'teacher@example.com', :name => 'Teacher', :language => 'en', :id => 4, :current_user => root)
    u.reset_password
    u.save
    g = Group.create(:name => 'teacher', :current_user => root)
    u.groups << g
    u.save
    File.open("root_#{RAILS_ENV}", 'a') do |f|
      f.puts "#{u.login}\n#{u.password}"
    end

  end

  down do
  end
end
