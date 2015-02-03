task :install do
  puts "Setting up DB..."
  Rake::Task["db:setup"].invoke
  Rake::Task["new_user"].invoke
  puts "Finnish"
end


