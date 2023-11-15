# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning db...'
Flat.destroy_all

puts 'Seeding db...'
10.times do
  flat = Flat.create!(
    name: "#{Faker::JapaneseMedia::StudioGhibli.unique.character} #{%w[house apartments mansion castle].sample}",
    address: Faker::Address.unique.full_address,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price_per_night: rand(50..500),
    number_of_guests: rand(1..10)
  )
  puts "Created #{flat.name}"
end

puts 'Finished!'
