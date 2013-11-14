# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.attr_accessible :role
User.create first_name: "Ben", last_name: "Eggett", email: "beneggett@gmail.com", password: 'devpoint123', role: "admin"
User.create first_name: "Admin", last_name: "User", email: "admin@gmail.com", password: 'devpoint123', role: "admin"
User.create first_name: "Student", last_name: "User", email: "student@gmail.com", password: 'devpoint123', role: "student"