# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Setup roles
[{name: 'user', desc: "Member of application"}, {name: 'editor', desc: "Editor of application"}, {name: 'admin', desc: "Admin of application"}, {name: 'superadmin', desc: "Superadministrator of application"}].each do |role|
  Role.find_or_create_by({name: role[:name], descriptions: role[:desc]})
end

User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role_id: Role.find_by_name('superadmin')) unless User.find_by_email('admin@example.com')