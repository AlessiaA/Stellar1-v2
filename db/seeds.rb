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

NUMBER_OF_USERS = 4000
NUMBER_OF_ENTITIES = 1500

NUMBER_OF_USERS.times do |i|
  user = User.new
  user.name = Faker::Name.first_name
  user.surname = Faker::Name.last_name
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
  user.surname = Faker::Name.last_name
  email = "seeduser#{i}@mail.com"
  user.email = email
  user.password = "password#{i}"
  user.birth = Faker::Date.birthday(20, 70)
  user.subscription_expiration = Faker::Date.between(Date.today - 1.year, Date.yesterday)
  user.save
end

NUMBER_OF_ENTITIES.times do |i|
  filter = Filter.new
  filter.name = Faker::Name.last_name
  filter.description = Faker::HitchhikersGuideToTheGalaxy.quote
  filter.brand = Faker::Company.name
  filter.save
end

NUMBER_OF_ENTITIES.times do |i|
  binocular = Binocular.new
  binocular.name = Faker::Name.last_name
  binocular.brand = Faker::Company.name
  binocular.magnifications = Faker::Number.between(5, 12)
  binocular.save
end

NUMBER_OF_ENTITIES.times do |i|
  eyepiece = Eyepiece.new
  eyepiece.name = Faker::Name.last_name
  eyepiece.brand = Faker::Company.name
  eyepiece.focal_length = Faker::Number.between(1.4, 500)
  eyepiece.ocular = Faker::Number.decimal(2)
  eyepiece.apparent_fov = Faker::Number.between(31.0, 51.0)
  eyepiece.size = Faker::Number.decimal(2)
  eyepiece.save
end

NUMBER_OF_ENTITIES.times do |i|
  telescope = Telescope.new
  telescope.name = Faker::Name.last_name
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

NUMBER_OF_ENTITIES.times do |i|
  celestial_body = CelestialBody.new
  celestial_body.name = Faker::Space.planet
  celestial_body.typology = "Pianeta"
  celestial_body.size = Faker::Number.number(10)
  celestial_body.constellation = Faker::Space.constellation
  celestial_body.map_chart_number = Faker::Number.number(4)
  celestial_body.save
end 
