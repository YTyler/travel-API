# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    seed = Seed.new
    seed.generate_countries
  end

  def generate_countries
    195.times do |i|
      country = Country.create!(
        name: Faker::Address.country
      )
      puts "Country #{i}: #{country.name}"
      5.times do
        city = country.cities.new(
          name: Faker::Nation.capital_city,
          country_id: country.id
        )
        country.save
        50.times do
          city.reviews.new(
            response: Faker::Hipster.paragraph_by_chars(characters: 200, supplemental: false)
          )
          city.save
        end
      end
    end
  end
end

Seed.begin

p "Created #{Country.count} Countries, #{City.count} cities and #{Review.count} reviews"
