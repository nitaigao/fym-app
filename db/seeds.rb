# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u = User.create!({:email => "test@example.com", :encrypted_token => "abcd" })
a = u.addresses.create!
a.name = "Test"
a.mask = "a8s7d89a"
a.save