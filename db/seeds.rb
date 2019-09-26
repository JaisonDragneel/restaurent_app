# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(first_name: "jaison", last_name: "rego", username: "jaison", role: true, email: "jaison@example.com", password: "123456", password_confirmation: "123456")
User.create(first_name: "bob", last_name: "damian", username: "bobby", role: false, email: "bob@example.com", password: "123456", password_confirmation: "123456")
User.create(first_name: "alex", last_name: "daniel", username: "alexi", role: false, email: "alex@example.com", password: "123456", password_confirmation: "123456")
