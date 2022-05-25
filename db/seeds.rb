puts "creating user..."
josie = User.create(email: "josie@hotmail.Com", password: 'wagons')

puts "Creating superpowers..."
fly = { name: 'fly', description: 'Fly donnes des ailes', price: 500, user_id: josie.id }
fireburn = { name: 'FireBurn', description: 'Je crame tout ce qui passe', price: 800, user_id: josie.id }

[ fly, fireburn ].each do |attributes|
  superpower = Superpower.create!(attributes)
  puts "Created #{superpower.name}"
end
puts "Finished!"
