require 'faker'

# Admin
user = User.new
user.name = "Admin"
user.surname = "Admin"
user.email = "admin@mail.com"
user.password = "adminadmin"
user.birth = Faker::Date.birthday(20,70)
user.subscription_expiration = Faker::Date.between(Date.today, 1.year.from_now)
user.save

User.first.update(role: :admin)

user = User.new
user.name = "Tizio"
user.surname = "Caio"
user.email = "tizio@mail.com"
user.password = "tiziocaio"
user.birth = Faker::Date.birthday(20,70)
user.subscription_expiration = Faker::Date.between(Date.today, 1.year.from_now)
user.save

NUMBER_OF_USERS = 100
NUMBER_OF_LOCATIONS = 20
NUMBER_OF_FILTERS = 50
NUMBER_OF_TELESCOPES = 50
NUMBER_OF_BINOCULARS = 100
NUMBER_OF_EYEPIECES = 50
NUMBER_OF_BODIES = 82

NUMBER_OF_USERS.times do |i|
  user = User.new
  user.name = Faker::Name.first_name
  user.surname = Faker::Name.unique.last_name
  email = "seeduser#{i}@mail.com"
  user.email = email
  user.password = "password#{i}"
  user.birth = Faker::Date.birthday(20, 70)
  user.subscription_expiration = Faker::Date.between(Date.today, 1.year.from_now)
  user.save
end

NUMBER_OF_USERS.times do |i|
  i += NUMBER_OF_USERS
  user = User.new
  user.name = Faker::Name.first_name
  user.surname = Faker::Name.unique.last_name
  email = "seeduser#{i}@mail.com"
  user.email = email
  user.password = "password#{i}"
  user.birth = Faker::Date.birthday(20, 70)
  user.subscription_expiration = Faker::Date.between(Date.today - 1.year, Date.yesterday)
  user.save
end

NUMBER_OF_FILTERS.times do |i|
  filter = Filter.new
  filter.name = Faker::Name.unique.last_name
  filter.description = Faker::HitchhikersGuideToTheGalaxy.quote
  filter.brand = Faker::Company.name
  filter.save
end

NUMBER_OF_BINOCULARS.times do |i|
  binocular = Binocular.new
  binocular.name = Faker::Name.unique.last_name
  binocular.brand = Faker::Company.name
  binocular.magnifications = Faker::Number.between(5, 12)
  binocular.save
end

NUMBER_OF_EYEPIECES.times do |i|
  eyepiece = Eyepiece.new
  eyepiece.name = Faker::Name.unique.last_name
  eyepiece.brand = Faker::Company.name
  eyepiece.focal_length = Faker::Number.between(1.4, 500)
  eyepiece.ocular = Faker::Number.decimal(2)
  eyepiece.apparent_fov = Faker::Number.between(31.0, 51.0)
  eyepiece.size = Faker::Number.decimal(2)
  eyepiece.save
end

NUMBER_OF_TELESCOPES.times do |i|
  telescope = Telescope.new
  telescope.name = Faker::Name.unique.last_name
  telescope.brand = Faker::Company.name
  telescope.description = Faker::HitchhikersGuideToTheGalaxy.quote
  telescope.aperture = Faker::Number.between(50, 200)
  telescope.angular_resolution = 11.6/telescope.aperture
  telescope.magnitude = 3.7 + 5*Math.log10(telescope.aperture)
  telescope.focal_length = Faker::Number.between(10, 1400)
  telescope.focal_ratio = Faker::Number.decimal(2)
  telescope.finderscope = Faker::Number.between(100, 500)
  telescope.typology = ['Rifrattore', 'Riflettore', 'Catadiottrico'].sample
  telescope.mount = ['Azimutale', 'Equatoriale'].sample
  telescope.save
end

NUMBER_OF_BODIES.times do |i|
  celestial_body = CelestialBody.new
  case i
  when 0..9
  celestial_body.name = Faker::Space.unique.star
  celestial_body.typology = "Stella" 
  when 10..39
  celestial_body.name = Faker::Space.unique.star_cluster
  celestial_body.typology = "Ammasso stellare"
  when 40..49
  celestial_body.name = Faker::Space.unique.galaxy
  celestial_body.typology = "Galassia"
  when 50..69
  celestial_body.name = Faker::Space.unique.moon
  celestial_body.typology = "Luna"
  when 70..74
  celestial_body.name = Faker::Space.unique.nebula
  celestial_body.typology = "Nebulosa"
  else
  celestial_body.name = Faker::Space.unique.planet
  celestial_body.typology = "Pianeta"
  end
  celestial_body.ascension = Faker::Time.between(DateTime.now - 1, DateTime.now)
  celestial_body.declination = Faker::Number.between(-90, +90)
  celestial_body.magnitudo = Faker::Number.decimal(2)
  celestial_body.separation = Faker::Number.between(1, 100)
  celestial_body.size = Faker::Number.number(10)
  celestial_body.constellation = Faker::Space.constellation
  celestial_body.map_chart_number = Faker::Number.number(4)
  celestial_body.save
  
end 

NUMBER_OF_LOCATIONS.times do |i|
  location = Location.new
  location.name = Faker::Address.unique.city
  location.latitude = Faker::Number.unique.decimal(3)
  location.longitude = Faker::Number.unique.decimal(3)
  location.altitude = Faker::Number.between(1, 5000)
  location.bortle = Faker::Number.between(1, 10)
  location.sqm = Faker::Number.decimal(2)
  location.save
end

