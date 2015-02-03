task :new_user do
  puts "Creating new admin user"
  puts "Name: "
  name = STDIN.gets
  puts "Email: "
  email = STDIN.gets
  puts "Password: "
  password = STDIN.gets
  
  password_c = ""
  loop do
    puts "Password confirm:"
    password_c = STDIN.gets
    
    if password == password_c then
      break
    else
      puts "Passwords not matching. Retype:"
    end
  end

  puts "Type your grade, like \"Teacher\" or \"System Administrator:\""
  grade = STDIN.gets

  puts "Finnishing..."
  User.create!({:name => name, :email => email, :password => password, :password_confirmation => password_c, :admin => 1, :clazz => grade})
  puts "User #{name} created!"
end
