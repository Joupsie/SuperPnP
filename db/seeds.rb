# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([ name: 'Star Wars' },  name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Superpower.create(name: 'teleportation', description: 'en un claquement de doigt, tu es sur le sphynx', price: 200)
# Superpower.create(name: 'fly', description: 'Fly donnes des ailes', price: 500)
# Superpower.create(name: 'FireBurn', description: 'Je crame tout ce qui passe', price: 800)
# Superpower.create(name: 'telekinesie', description: 'Attrapes ta télécommandes sans bouger du canap!', price: 2)
puts "creating user..."
# josie = User.create(email: "josie@hotmail.Com", password: 'wagons')

# puts "Creating superpowers..."
# fly = { name: 'fly', description: 'Fly donnes des ailes', price: 500, user_id: josie.id }
# fireburn = { name: 'FireBurn', description: 'Je crame tout ce qui passe', price: 800, user_id: josie.id }

Superpower.each do |superpower|
  superpower = Superpower.create!(superpower)
  puts "Created #{superpower.name}"
end
puts "Finished!"
